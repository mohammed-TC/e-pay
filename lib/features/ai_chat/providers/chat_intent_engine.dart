import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/models/biller.dart';
import '../../../core/models/biller_account.dart';
import '../../../core/models/money.dart';
import '../../../core/models/txn_type.dart';
import '../../../core/models/vehicle.dart';
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
import 'chat_reminders_provider.dart';
import 'vehicles_provider.dart';

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

/// A proactive assistant offer awaiting a yes/no/later reply — product.md
/// K1 proactive nudges. Resolved via [resolveAffirmation], not keyword
/// matching, since the user's next turn is a reply to a question, not a
/// fresh request.
enum PendingOffer { none, vehicleRenewal, autoPay }

/// How the user answered a [PendingOffer] question.
enum AffirmationResult { yes, no, later, unclear }

/// One turn's worth of reply plus the next [PendingOffer] state — threaded
/// back into `ChatNotifier` (`chat_provider.dart`) since dialogue context
/// lives with the conversation, not the stateless engine.
typedef PendingReplyResult = ({
  List<ChatMessage> messages,
  PendingOffer offer,
  String? accountId,
  String? vehicleId,
  bool autoPayExplained,
});

PendingReplyResult _clearedResult(List<ChatMessage> messages) => (
  messages: messages,
  offer: PendingOffer.none,
  accountId: null,
  vehicleId: null,
  autoPayExplained: false,
);

/// Best-effort yes/no/later classifier for a reply to a pending offer —
/// deliberately simple keyword match, same spirit as [detectIntent].
AffirmationResult resolveAffirmation(String input) {
  final q = input.toLowerCase();
  if (q.contains('later') ||
      q.contains('remind me') ||
      q.contains('not today')) {
    return AffirmationResult.later;
  }
  if (q.contains('no') ||
      q.contains('nope') ||
      q.contains('nah') ||
      q.contains("don't")) {
    return AffirmationResult.no;
  }
  if (q.contains('yes') ||
      q.contains('yeah') ||
      q.contains('yep') ||
      q.contains('sure') ||
      q.contains('ok') ||
      q.contains('tell me more') ||
      q.contains('go ahead')) {
    return AffirmationResult.yes;
  }
  return AffirmationResult.unclear;
}

Vehicle? _findVehicle(List<Vehicle> vehicles, String? id) {
  if (id == null) return null;
  for (final vehicle in vehicles) {
    if (vehicle.id == id) return vehicle;
  }
  return null;
}

/// Fixed demo renewal fee — mirrors [_chatSendMoneyAmount]'s flat-amount
/// shortcut, this is a chat nudge, not the full Vehicle Renewal flow (F3).
final _vehicleRenewalFee = Money.fromAmount(35);

PaymentRequest _vehicleRenewalRequest(Vehicle vehicle, AppLocalizations l10n) =>
    PaymentRequest(
      type: TxnType.vehicleRenewal,
      payeeName: '${vehicle.make} ${vehicle.model}',
      payeeSubtitle: vehicle.plateNumber,
      lineItems: [
        PaymentLineItem(
          label: l10n.chatVehicleRenewalFeeLabel,
          amount: _vehicleRenewalFee,
        ),
      ],
      amount: _vehicleRenewalFee,
      fee: Money.zero,
      meta: {'vehicleId': vehicle.id},
    );

/// Dispatches a resolved [AffirmationResult] to the reply builder for
/// whichever [PendingOffer] is currently open.
Future<PendingReplyResult> resolvePendingOffer({
  required Ref ref,
  required AppLocalizations l10n,
  required PendingOffer offer,
  required AffirmationResult resolution,
  required String? accountId,
  required String? vehicleId,
  required bool autoPayExplained,
}) async {
  switch (offer) {
    case PendingOffer.vehicleRenewal:
      return _resolveVehicleRenewalOffer(
        ref,
        l10n,
        resolution,
        vehicleId,
        accountId,
      );
    case PendingOffer.autoPay:
      return _resolveAutoPayOffer(
        ref,
        l10n,
        resolution,
        accountId,
        autoPayExplained,
      );
    case PendingOffer.none:
      return _clearedResult([_text(l10n.chatReplyFallback)]);
  }
}

Future<PendingReplyResult> _resolveVehicleRenewalOffer(
  Ref ref,
  AppLocalizations l10n,
  AffirmationResult resolution,
  String? vehicleId,
  String? accountId,
) async {
  if (resolution == AffirmationResult.unclear) {
    return _clearedResult([_text(l10n.chatReplyFallback)]);
  }

  if (resolution == AffirmationResult.yes) {
    final vehicles = await ref.read(vehiclesProvider.future);
    final vehicle = _findVehicle(vehicles, vehicleId);
    if (vehicle == null) return _clearedResult([_text(l10n.chatReplyFallback)]);
    final messages = <ChatMessage>[
      _text(l10n.chatVehicleRenewalOfferAccept(vehicle.plateNumber)),
      _card(
        '',
        ChatCardData.paymentShortcut(
          title: l10n.chatVehicleRenewalCardTitle(vehicle.plateNumber),
          subtitle: l10n.chatVehicleRenewalCardSubtitle,
          request: _vehicleRenewalRequest(vehicle, l10n),
        ),
      ),
    ];
    return _chainToAutoPayOrClose(messages, accountId, l10n);
  }

  // no / later — mock reminder only, product.md §7 excludes a real backend.
  return _chainToAutoPayOrClose(
    [_text(l10n.chatVehicleRenewalReminderSet)],
    accountId,
    l10n,
  );
}

PendingReplyResult _chainToAutoPayOrClose(
  List<ChatMessage> messages,
  String? accountId,
  AppLocalizations l10n,
) {
  if (accountId != null) {
    return (
      messages: [...messages, _text(l10n.chatAutoPayPitchIntro)],
      offer: PendingOffer.autoPay,
      accountId: accountId,
      vehicleId: null,
      autoPayExplained: false,
    );
  }
  return _clearedResult([...messages, _text(l10n.chatAnythingElsePrompt)]);
}

Future<PendingReplyResult> _resolveAutoPayOffer(
  Ref ref,
  AppLocalizations l10n,
  AffirmationResult resolution,
  String? accountId,
  bool autoPayExplained,
) async {
  if (resolution == AffirmationResult.unclear) {
    return _clearedResult([_text(l10n.chatReplyFallback)]);
  }
  if (resolution != AffirmationResult.yes) {
    return _clearedResult([
      _text(l10n.chatAutoPayDeclined),
      _text(l10n.chatAnythingElsePrompt),
    ]);
  }
  if (!autoPayExplained) {
    return (
      messages: [_text(l10n.chatAutoPayExplain)],
      offer: PendingOffer.autoPay,
      accountId: accountId,
      vehicleId: null,
      autoPayExplained: true,
    );
  }
  if (accountId == null) return _clearedResult([_text(l10n.chatReplyFallback)]);

  await ref
      .read(savedAccountsProvider.notifier)
      .setAutoPay(accountId, enabled: true);
  return _clearedResult([
    _text(l10n.chatAutoPayEnabled),
    _text(l10n.chatAnythingElsePrompt),
  ]);
}

/// The vehicle-renewal nudge threshold — inside this many days of expiry,
/// worth a proactive mention. Demo-scale: one seed vehicle, generous window
/// so the nudge reliably fires against the seeded `registrationExpiry`.
const _vehicleRenewalNudgeWindowDays = 180;

/// Builds the proactive follow-up nudge appended after a successful
/// chat-originated bill payment — product.md K1. Returns `null` when there's
/// no candidate (no vehicle on file, expiry too far out, or already nudged
/// this session).
Future<PendingReplyResult?> buildPostPaymentNudge({
  required Ref ref,
  required AppLocalizations l10n,
  required Locale locale,
  required TxnType completedType,
  required String? completedAccountId,
}) async {
  if (completedType != TxnType.bill) return null;

  const nudgeKey = 'vehicleRenewal';
  if (ref.read(chatRemindersProvider.notifier).hasSeen(nudgeKey)) return null;

  final vehicles = await ref.read(vehiclesProvider.future);
  if (vehicles.isEmpty) return null;
  final vehicle = vehicles.first;
  final daysUntilExpiry = vehicle.registrationExpiry
      .difference(DateTime.now())
      .inDays;
  if (daysUntilExpiry < 0 || daysUntilExpiry > _vehicleRenewalNudgeWindowDays) {
    return null;
  }

  ref.read(chatRemindersProvider.notifier).markSeen(nudgeKey);
  final expiryLabel = DateFormat.yMMMMd(
    locale.toString(),
  ).format(vehicle.registrationExpiry);
  return (
    messages: [
      _text(l10n.chatVehicleRenewalNudge(vehicle.plateNumber, expiryLabel)),
    ],
    offer: PendingOffer.vehicleRenewal,
    accountId: completedAccountId,
    vehicleId: vehicle.id,
    autoPayExplained: false,
  );
}
