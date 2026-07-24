import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/biller.dart';
import '../../../core/models/biller_account.dart';
import '../../../core/models/biller_category.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_text_field.dart';
import '../providers/account_entry_provider.dart';
import '../providers/saved_accounts_provider.dart';

/// Screen E3 — Account Entry
///
/// Account number entry for [biller] — product.md E3. Electricity billers
/// also offer "fetch by mobile"; a save toggle nicknames the account for
/// E4. On submit, pushes E5 (Bill Detail) for the new/derived account.
class AccountEntryScreen extends ConsumerWidget {
  const AccountEntryScreen({required this.biller, super.key});

  final Biller biller;

  Future<void> _submit(BuildContext context, WidgetRef ref) async {
    final form = ref.read(accountEntryFormProvider);
    final account = BillerAccount(
      id: 'acc_${DateTime.now().microsecondsSinceEpoch}',
      billerId: biller.id,
      accountNumber: form.resolvedAccountNumber,
      nickname: form.nickname.isEmpty ? biller.name : form.nickname,
      savedAt: DateTime.now(),
    );
    if (form.saveAccount) {
      await ref.read(savedAccountsProvider.notifier).add(account);
    }
    if (context.mounted) {
      await context.push(Routes.billsDetail, extra: account);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final form = ref.watch(accountEntryFormProvider);
    final notifier = ref.read(accountEntryFormProvider.notifier);
    final allowFetchByMobile = biller.category == BillerCategory.electricity;

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.accountEntryTitle)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [
          Text(biller.name, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.lg),
          if (allowFetchByMobile) ...[
            NPCard(
              interactive: false,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.accountEntryFetchByMobileLabel,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  Switch(
                    value: form.fetchByMobile,
                    onChanged: (value) =>
                        notifier.toggleFetchByMobile(value: value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
          ],
          if (form.fetchByMobile)
            NPTextField(
              label: l10n.accountEntryMobileLabel,
              hint: l10n.accountEntryMobileHint,
              keyboardType: TextInputType.phone,
              onChanged: notifier.setMobileNumber,
            )
          else
            NPTextField(
              label: l10n.accountEntryAccountNumberLabel,
              hint: l10n.accountEntryAccountNumberHint,
              keyboardType: TextInputType.number,
              onChanged: notifier.setAccountNumber,
            ),
          const SizedBox(height: AppSpacing.lg),
          NPCard(
            interactive: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.accountEntrySaveToggleLabel,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    Switch(
                      value: form.saveAccount,
                      onChanged: (value) =>
                          notifier.toggleSaveAccount(value: value),
                    ),
                  ],
                ),
                if (form.saveAccount) ...[
                  const SizedBox(height: AppSpacing.sm),
                  NPTextField(
                    label: l10n.accountEntryNicknameLabel,
                    hint: l10n.accountEntryNicknameHint,
                    onChanged: notifier.setNickname,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          NPButton(
            label: l10n.accountEntryFetchBillCta,
            onPressed: form.isValid ? () => _submit(context, ref) : null,
          ),
        ],
      ),
    );
  }
}
