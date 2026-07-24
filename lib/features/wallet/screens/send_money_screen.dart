import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/money.dart';
import '../../../core/models/txn_type.dart';
import '../../../core/widgets/np_amount_input.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_list_tile.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_segmented_tabs.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../../../core/widgets/np_text_field.dart';
import '../../payment/models/payment_request.dart';
import '../../payment/models/payment_result.dart';
import '../models/wallet_contact.dart';
import '../providers/contacts_provider.dart';
import '../providers/send_money_provider.dart';

/// Screen C3 — Send Money
///
/// Builds a `PaymentRequest(type: walletSend)` and routes through the shared
/// payment flow (payment-flow.md) — never its own confirm/PIN/receipt.
class SendMoneyScreen extends ConsumerWidget {
  const SendMoneyScreen({super.key});

  Future<void> _submit(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final form = ref.read(sendMoneyFormProvider);
    final isBank = form.method == SendMoneyMethod.bank;
    final payeeName = isBank
        ? form.bankAccountName
        : form.selectedContact!.name;
    final payeeSubtitle = isBank
        ? form.bankIban
        : (form.method == SendMoneyMethod.mobile
              ? form.selectedContact!.mobileNumber
              : form.selectedContact!.walletId);

    final request = PaymentRequest(
      type: TxnType.walletSend,
      payeeName: payeeName,
      payeeSubtitle: payeeSubtitle,
      lineItems: [
        PaymentLineItem(label: l10n.walletSendAmountLabel, amount: form.amount),
      ],
      amount: form.amount,
      fee: Money.zero,
      meta: {'method': form.method.name, 'note': form.note},
    );
    final result = await context.push<PaymentResult>(
      Routes.paymentConfirm,
      extra: request,
    );
    if (result is PaymentSuccess && context.mounted) context.pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final form = ref.watch(sendMoneyFormProvider);
    final notifier = ref.read(sendMoneyFormProvider.notifier);

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.walletSendTitle)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [
          NPSegmentedTabs(
            segments: [
              (
                label: l10n.walletSendTabMobile,
                icon: Icons.smartphone_outlined,
              ),
              (
                label: l10n.walletSendTabWallet,
                icon: Icons.account_balance_wallet_outlined,
              ),
              (
                label: l10n.walletSendTabBank,
                icon: Icons.account_balance_outlined,
              ),
            ],
            selectedIndex: form.method.index,
            onChanged: (index) =>
                notifier.selectMethod(SendMoneyMethod.values[index]),
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          NPAmountInput(
            value: form.amountDigits,
            onChanged: notifier.setAmountDigits,
          ),
          const SizedBox(height: AppSpacing.lg),
          NPTextField(
            label: l10n.walletSendNoteLabel,
            hint: l10n.walletSendNoteHint,
            onChanged: notifier.setNote,
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          const SizedBox(height: AppSpacing.lg),
          if (form.method == SendMoneyMethod.bank)
            _BankFields(
              accountName: form.bankAccountName,
              iban: form.bankIban,
              onAccountNameChanged: notifier.setBankAccountName,
              onIbanChanged: notifier.setBankIban,
            )
          else
            _ContactPicker(
              method: form.method,
              selectedContactId: form.selectedContact?.id,
              onSelect: notifier.selectContact,
            ),
          const SizedBox(height: AppSpacing.sectionGap),
          NPButton(
            label: l10n.walletSendCta,
            onPressed: form.isValid ? () => _submit(context, ref) : null,
          ),
        ],
      ),
    );
  }
}

class _BankFields extends StatelessWidget {
  const _BankFields({
    required this.accountName,
    required this.iban,
    required this.onAccountNameChanged,
    required this.onIbanChanged,
  });

  final String accountName;
  final String iban;
  final ValueChanged<String> onAccountNameChanged;
  final ValueChanged<String> onIbanChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        NPTextField(
          label: l10n.walletSendBankAccountNameLabel,
          hint: l10n.walletSendBankAccountNameHint,
          onChanged: onAccountNameChanged,
        ),
        const SizedBox(height: AppSpacing.lg),
        NPTextField(
          label: l10n.walletSendBankIbanLabel,
          hint: l10n.walletSendBankIbanHint,
          onChanged: onIbanChanged,
        ),
      ],
    );
  }
}

class _ContactPicker extends ConsumerWidget {
  const _ContactPicker({
    required this.method,
    required this.selectedContactId,
    required this.onSelect,
  });

  final SendMoneyMethod method;
  final String? selectedContactId;
  final ValueChanged<WalletContact> onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = Theme.of(context).extension<AppColors>()!;
    final contactsAsync = ref.watch(walletContactsProvider);

    return contactsAsync.when(
      data: (contacts) => Column(
        children: [
          for (final contact in contacts)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md, right: AppSpacing.sm),
              child: NPListTile(
                leading: _ContactAvatar(initial: contact.avatarInitial),
                title: contact.name,
                subtitle: method == SendMoneyMethod.mobile
                    ? contact.mobileNumber
                    : contact.walletId,
                trailingWidget: selectedContactId == contact.id
                    ? Icon(Icons.check_circle, color: colors.accentPrimary)
                    : null,
                onTap: () => onSelect(contact),
              ),
            ),
        ],
      ),
      loading: () => Column(
        children: List.generate(
          3,
          (index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
            child: NPShimmer(height: 56),
          ),
        ),
      ),
      error: (error, stackTrace) => NPErrorState(
        title: l10n.homeErrorTitle,
        body: l10n.homeErrorBody,
        onRetry: () => ref.invalidate(walletContactsProvider),
        retryLabel: l10n.homeErrorRetry,
      ),
    );
  }
}

class _ContactAvatar extends StatelessWidget {
  const _ContactAvatar({required this.initial});

  final String initial;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Text(
      initial,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(color: colors.inkPrimary),
    );
  }
}
