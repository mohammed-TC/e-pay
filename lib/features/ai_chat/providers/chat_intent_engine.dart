import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/models/biller.dart';
import '../../../core/models/biller_account.dart';
import '../../../core/models/money.dart';
import '../../../core/models/txn_type.dart';
import '../../../l10n/app_localizations.dart';
import '../../bills/providers/bill_detail_provider.dart';
import '../../bills/providers/billers_provider.dart';
import '../../bills/providers/saved_accounts_provider.dart';
import '../../history/providers/transactions_provider.dart';
import '../../payment/models/payment_request.dart';
import '../../rewards/providers/rewards_provider.dart';
import '../../wallet/providers/contacts_provider.dart';
import '../../wallet/providers/wallet_provider.dart';
import '../models/chat_card_data.dart';
import '../models/chat_message.dart';

/// Every reply category the rule-based (offline, no LLM) engine can answer —
/// product.md K1. `payBill`/`sendMoney` also need [buildAssistantReply]'s
/// `rawInput` to resolve which biller/contact was named.
enum ChatIntent {
  greeting,
  help,
  walletBalance,
  billsDue,
  rewardsStatus,
  recentTxns,
  payBill,
  sendMoney,
  fallback,
}

/// Keyword match against the free-text input. Order matters: `payBill`/
/// `sendMoney` are checked before the read-only categories they overlap
/// with ("pay my electricity **bill**" must win over generic `billsDue`).
ChatIntent detectIntent(String input) {
  final q = input.toLowerCase();
  if (q.contains('pay')) return ChatIntent.payBill;
  if (q.contains('send') || q.contains('transfer')) return ChatIntent.sendMoney;
  if (q.contains('bill')) return ChatIntent.billsDue;
  if (q.contains('balance') || q.contains('wallet')) {
    return ChatIntent.walletBalance;
  }
  if (q.contains('reward') || q.contains('point')) {
    return ChatIntent.rewardsStatus;
  }
  if (q.contains('transaction') ||
      q.contains('history') ||
      q.contains('spent')) {
    return ChatIntent.recentTxns;
  }
  if (q.contains('help') || q.contains('what can you')) return ChatIntent.help;
  if (q.contains('hi') || q.contains('hello') || q.contains('hey')) {
    return ChatIntent.greeting;
  }
  return ChatIntent.fallback;
}

String _newId() => DateTime.now().microsecondsSinceEpoch.toString();

/// Mirrors `Money.format(context)` (money.dart) without a `BuildContext` —
/// the intent engine runs inside a provider, not a widget.
String _formatMoney(Money money, Locale locale) {
  final formatter = NumberFormat.decimalPatternDigits(
    locale: locale.toString(),
    decimalDigits: 3,
  );
  return '${formatter.format(money.amount)} ${money.currencyCode}';
}

Biller? _findBiller(List<Biller> billers, String id) {
  for (final biller in billers) {
    if (biller.id == id) return biller;
  }
  return null;
}

/// Builds the assistant's reply for one user turn — product.md K1. Reads
/// existing feature providers read-only; any money-moving reply hands off a
/// `PaymentRequest` to the shared payment flow (payment-flow.md), it never
/// pays anything itself.
Future<List<ChatMessage>> buildAssistantReply({
  required Ref ref,
  required Locale locale,
  required String rawInput,
  ChatIntent? forcedIntent,
}) async {
  final l10n = await AppLocalizations.delegate.load(locale);
  final intent = forcedIntent ?? detectIntent(rawInput);

  switch (intent) {
    case ChatIntent.greeting:
      return [_text(l10n.chatReplyGreeting)];
    case ChatIntent.help:
      return [_text(l10n.chatReplyHelp)];
    case ChatIntent.walletBalance:
      return _walletBalanceReply(ref, l10n);
    case ChatIntent.billsDue:
      return _billsDueReply(ref, l10n);
    case ChatIntent.rewardsStatus:
      return _rewardsReply(ref, l10n);
    case ChatIntent.recentTxns:
      return _recentTxnsReply(ref, l10n, locale);
    case ChatIntent.payBill:
      return _payBillReply(ref, l10n, rawInput);
    case ChatIntent.sendMoney:
      return _sendMoneyReply(ref, l10n, rawInput);
    case ChatIntent.fallback:
      return [_text(l10n.chatReplyFallback)];
  }
}

ChatMessage _text(String text) =>
    ChatMessage.assistantText(id: _newId(), text: text, sentAt: DateTime.now());

ChatMessage _card(String text, ChatCardData card) => ChatMessage.assistantCard(
  id: _newId(),
  text: text,
  card: card,
  sentAt: DateTime.now(),
);

Future<List<ChatMessage>> _walletBalanceReply(
  Ref ref,
  AppLocalizations l10n,
) async {
  final wallet = await ref.read(appWalletProvider.future);
  return [
    _card(
      l10n.chatReplyWalletBalanceIntro,
      ChatCardData.walletSummary(balance: wallet.balance),
    ),
  ];
}

Future<List<ChatMessage>> _rewardsReply(Ref ref, AppLocalizations l10n) async {
  final rewards = await ref.read(appRewardsProvider.future);
  return [
    _card(
      l10n.chatReplyRewardsIntro,
      ChatCardData.rewardsStatus(
        points: rewards.points,
        threshold: rewards.redemptionThreshold,
      ),
    ),
  ];
}

Future<List<ChatMessage>> _recentTxnsReply(
  Ref ref,
  AppLocalizations l10n,
  Locale locale,
) async {
  final txns = await ref.read(appTransactionsProvider.future);
  if (txns.isEmpty) return [_text(l10n.chatReplyNoTxns)];
  final lines = txns
      .take(3)
      .map(
        (txn) =>
            l10n.chatReplyTxnLine(txn.title, _formatMoney(txn.amount, locale)),
      )
      .join('\n');
  return [_text(l10n.chatReplyRecentTxnsIntro(lines))];
}

PaymentRequest _billPaymentRequest({
  required BillerAccount account,
  required Money amountDue,
  required String amountLabel,
}) => PaymentRequest(
  type: TxnType.bill,
  payeeName: account.nickname,
  payeeSubtitle: account.accountNumber,
  lineItems: [PaymentLineItem(label: amountLabel, amount: amountDue)],
  amount: amountDue,
  fee: Money.zero,
  meta: {'billerAccountId': account.id},
);

Future<List<ChatMessage>> _billsDueReply(Ref ref, AppLocalizations l10n) async {
  final accounts = await ref.read(savedAccountsProvider.future);
  if (accounts.isEmpty) return [_text(l10n.chatReplyNoBills)];

  final billers = await ref.read(billersProvider.future);
  final messages = <ChatMessage>[_text(l10n.chatReplyBillsDueIntro)];
  for (final account in accounts.take(2)) {
    final bill = await ref.read(billDetailProvider(account).future);
    final billerName =
        _findBiller(billers, account.billerId)?.name ?? account.nickname;
    messages.add(
      _card(
        '',
        ChatCardData.billReminder(
          billerName: billerName,
          accountLabel: account.nickname,
          dueDate: bill.dueDate,
          request: _billPaymentRequest(
            account: account,
            amountDue: bill.amountDue,
            amountLabel: l10n.billDetailAmountDueLabel,
          ),
        ),
      ),
    );
  }
  return messages;
}

Future<List<ChatMessage>> _payBillReply(
  Ref ref,
  AppLocalizations l10n,
  String rawInput,
) async {
  final query = rawInput.toLowerCase();
  final accounts = await ref.read(savedAccountsProvider.future);

  BillerAccount? match;
  for (final account in accounts) {
    if (query.contains(account.nickname.toLowerCase())) {
      match = account;
      break;
    }
  }
  if (match == null) {
    final billers = await ref.read(billersProvider.future);
    for (final biller in billers) {
      if (!query.contains(biller.name.toLowerCase())) continue;
      for (final account in accounts) {
        if (account.billerId == biller.id) {
          match = account;
          break;
        }
      }
      if (match != null) break;
    }
  }

  if (match == null) return [_text(l10n.chatReplyPayBillNotFound)];

  final bill = await ref.read(billDetailProvider(match).future);
  final billers = await ref.read(billersProvider.future);
  final billerName =
      _findBiller(billers, match.billerId)?.name ?? match.nickname;
  return [
    _text(l10n.chatReplyPayBillFound(match.nickname)),
    _card(
      '',
      ChatCardData.billReminder(
        billerName: billerName,
        accountLabel: match.nickname,
        dueDate: bill.dueDate,
        request: _billPaymentRequest(
          account: match,
          amountDue: bill.amountDue,
          amountLabel: l10n.billDetailAmountDueLabel,
        ),
      ),
    ),
  ];
}

/// Fixed demo amount for a chat-originated send — this is a quick shortcut,
/// not the full Send Money flow (C3), so there is no amount-entry step.
final _chatSendMoneyAmount = Money.fromAmount(5);

Future<List<ChatMessage>> _sendMoneyReply(
  Ref ref,
  AppLocalizations l10n,
  String rawInput,
) async {
  final query = rawInput.toLowerCase();
  final contacts = await ref.read(walletContactsProvider.future);

  for (final contact in contacts) {
    if (!query.contains(contact.name.toLowerCase())) continue;
    final request = PaymentRequest(
      type: TxnType.walletSend,
      payeeName: contact.name,
      payeeSubtitle: contact.mobileNumber,
      lineItems: [
        PaymentLineItem(
          label: l10n.walletSendAmountLabel,
          amount: _chatSendMoneyAmount,
        ),
      ],
      amount: _chatSendMoneyAmount,
      fee: Money.zero,
      meta: {'method': 'wallet', 'note': 'Ask Emral'},
    );
    return [
      _text(l10n.chatReplySendMoneyFound(contact.name)),
      _card(
        '',
        ChatCardData.paymentShortcut(
          title: l10n.chatSendMoneyCardTitle(contact.name),
          subtitle: contact.mobileNumber,
          request: request,
        ),
      ),
    ];
  }
  return [_text(l10n.chatReplySendMoneyNotFound)];
}
