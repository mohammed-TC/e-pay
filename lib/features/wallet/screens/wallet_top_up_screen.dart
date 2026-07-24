import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/money.dart';
import '../../../core/models/saved_card.dart';
import '../../../core/models/txn_type.dart';
import '../../../core/widgets/np_amount_input.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_list_tile.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../../payment/models/payment_request.dart';
import '../../payment/models/payment_result.dart';
import '../providers/top_up_provider.dart';
import '../providers/wallet_provider.dart';

const _applePaySourceId = 'apple_pay';

/// Screen C2 — Top-up
///
/// Builds a `PaymentRequest(type: walletTopup)` and routes through the
/// shared payment flow (payment-flow.md) — never its own confirm/PIN/receipt.
class WalletTopUpScreen extends ConsumerWidget {
  const WalletTopUpScreen({super.key});

  static const _quickAmounts = [5.0, 10.0, 20.0, 50.0];

  Future<void> _submit(
    BuildContext context,
    WidgetRef ref,
    String sourceLabel,
  ) async {
    final l10n = context.l10n;
    final form = ref.read(topUpFormProvider);
    final request = PaymentRequest(
      type: TxnType.walletTopup,
      payeeName: l10n.walletTopUpTitle,
      payeeSubtitle: sourceLabel,
      lineItems: [
        PaymentLineItem(
          label: l10n.walletTopUpAmountLabel,
          amount: form.amount,
        ),
      ],
      amount: form.amount,
      fee: Money.zero,
      meta: {'source': form.selectedSourceId},
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
    final form = ref.watch(topUpFormProvider);
    final walletAsync = ref.watch(appWalletProvider);

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.walletTopUpTitle)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [
          NPAmountInput(
            value: form.amountDigits,
            onChanged: (digits) =>
                ref.read(topUpFormProvider.notifier).setAmountDigits(digits),
            quickAmounts: _quickAmounts,
            onQuickAmountTap: (amount) =>
                ref.read(topUpFormProvider.notifier).setQuickAmount(amount),
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          Text(
            l10n.walletTopUpSourceLabel,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSpacing.sm),
          walletAsync.when(
            data: (wallet) => _SourceList(
              cards: wallet.savedCards,
              selectedSourceId: form.selectedSourceId,
              applePayLabel: l10n.walletTopUpApplePay,
            ),
            loading: () => const Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
                  child: NPShimmer(height: 56),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
                  child: NPShimmer(height: 56),
                ),
              ],
            ),
            error: (error, stackTrace) => NPErrorState(
              title: l10n.homeErrorTitle,
              body: l10n.homeErrorBody,
              onRetry: () => ref.invalidate(appWalletProvider),
              retryLabel: l10n.homeErrorRetry,
            ),
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          NPButton(
            label: l10n.walletTopUpCta,
            onPressed: form.isValid
                ? () => _submit(
                    context,
                    ref,
                    _sourceLabel(
                      form.selectedSourceId,
                      walletAsync.maybeWhen(
                        data: (wallet) => wallet.savedCards,
                        orElse: () => const [],
                      ),
                      l10n.walletTopUpApplePay,
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }

  String _sourceLabel(
    String? sourceId,
    List<SavedCard> cards,
    String applePayLabel,
  ) {
    if (sourceId == null) return '';
    if (sourceId == _applePaySourceId) return applePayLabel;
    final card = cards.where((c) => c.id == sourceId).firstOrNull;
    return card == null ? '' : '${card.brand} ${card.maskedNumber}';
  }
}

class _SourceList extends ConsumerWidget {
  const _SourceList({
    required this.cards,
    required this.selectedSourceId,
    required this.applePayLabel,
  });

  final List<SavedCard> cards;
  final String? selectedSourceId;
  final String applePayLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Column(
      children: [
        for (final card in cards)
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: AppSpacing.md,
            ),
            child: NPListTile(
              leading: Icon(
                Icons.credit_card,
                size: 20,
                color: colors.inkPrimary,
              ),
              title: '${card.brand} ${card.maskedNumber}',
              subtitle: card.expiry,
              trailingWidget: selectedSourceId == card.id
                  ? Icon(Icons.check_circle, color: colors.accentPrimary)
                  : null,
              onTap: () =>
                  ref.read(topUpFormProvider.notifier).selectSource(card.id),
            ),
          ),
        NPListTile(
          leading: Icon(Icons.apple, size: 20, color: colors.inkPrimary),
          title: applePayLabel,
          trailingWidget: selectedSourceId == _applePaySourceId
              ? Icon(Icons.check_circle, color: colors.accentPrimary)
              : null,
          onTap: () => ref
              .read(topUpFormProvider.notifier)
              .selectSource(_applePaySourceId),
        ),
      ],
    );
  }
}
