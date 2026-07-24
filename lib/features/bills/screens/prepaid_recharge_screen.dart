import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/biller.dart';
import '../../../core/models/biller_category.dart';
import '../../../core/models/money.dart';
import '../../../core/models/txn_type.dart';
import '../../../core/widgets/np_amount_input.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_chip.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../../payment/models/payment_request.dart';
import '../../payment/models/payment_result.dart';
import '../models/recharge_plan.dart';
import '../providers/billers_provider.dart';
import '../providers/recharge_provider.dart';
import '../widgets/payment_method_picker.dart';

/// Screen E6 — Prepaid Recharge
///
/// Provider select → plan cards or custom amount → VAT line item —
/// product.md E6. Pay CTA builds a `PaymentRequest(type: prepaidRecharge)`
/// through the shared payment flow (payment-flow.md).
class PrepaidRechargeScreen extends ConsumerStatefulWidget {
  const PrepaidRechargeScreen({super.key});

  @override
  ConsumerState<PrepaidRechargeScreen> createState() =>
      _PrepaidRechargeScreenState();
}

class _PrepaidRechargeScreenState extends ConsumerState<PrepaidRechargeScreen> {
  String _methodId = PaymentMethodPicker.walletMethodId;

  Future<void> _pay(Biller biller, Money base) async {
    final l10n = context.l10n;
    final vat = Money.fromAmount(base.amount * 0.15);
    final total = base + vat;
    final request = PaymentRequest(
      type: TxnType.prepaidRecharge,
      payeeName: biller.name,
      payeeSubtitle: l10n.rechargeTitle,
      lineItems: [
        PaymentLineItem(label: l10n.rechargeAmountLabel, amount: base),
        PaymentLineItem(label: l10n.rechargeVatLabel, amount: vat),
      ],
      amount: total,
      fee: Money.zero,
      meta: {'billerId': biller.id, 'method': _methodId},
    );
    final result = await context.push<PaymentResult>(
      Routes.paymentConfirm,
      extra: request,
    );
    if (result is PaymentSuccess && mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final form = ref.watch(rechargeFormProvider);
    final notifier = ref.read(rechargeFormProvider.notifier);
    final billersAsync = ref.watch(billersProvider);

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.rechargeTitle)),
      body: billersAsync.when(
        data: (billers) {
          final telecomBillers = billers
              .where((b) => b.category == BillerCategory.telecom)
              .toList();
          final selectedBiller = telecomBillers
              .where((b) => b.id == form.billerId)
              .firstOrNull;

          return ListView(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
            children: [
              Text(
                l10n.rechargeProviderLabel,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: AppSpacing.sm,
                children: [
                  for (final biller in telecomBillers)
                    NPChip(
                      label: biller.name,
                      selected: form.billerId == biller.id,
                      onTap: () => notifier.selectBiller(biller.id),
                    ),
                ],
              ),
              if (selectedBiller != null) ...[
                const SizedBox(height: AppSpacing.sectionGap),
                Consumer(
                  builder: (context, ref, _) {
                    final plansAsync = ref.watch(
                      rechargePlansProvider(selectedBiller.id),
                    );
                    return plansAsync.when(
                      data: (plans) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (final plan in plans)
                            _PlanCard(
                              plan: plan,
                              selected: form.selectedPlanId == plan.id,
                              onTap: () => notifier.selectPlan(plan.id),
                            ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            l10n.rechargeCustomAmountLabel,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          NPCard(
                            interactive: false,
                            child: NPAmountInput(
                              value: form.useCustomAmount
                                  ? form.customAmountDigits
                                  : '',
                              onChanged: notifier.setCustomAmountDigits,
                            ),
                          ),
                        ],
                      ),
                      loading: () => const Column(
                        children: [
                          NPShimmer.card(height: 72),
                          SizedBox(height: AppSpacing.sm),
                          NPShimmer.card(height: 72),
                        ],
                      ),
                      error: (error, stackTrace) => NPErrorState(
                        title: l10n.homeErrorTitle,
                        body: l10n.homeErrorBody,
                        onRetry: () => ref.invalidate(
                          rechargePlansProvider(selectedBiller.id),
                        ),
                        retryLabel: l10n.homeErrorRetry,
                      ),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.sectionGap),
                Text(
                  l10n.paymentMethodSectionTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpacing.sm),
                PaymentMethodPicker(
                  selectedMethodId: _methodId,
                  onSelect: (id) => setState(() => _methodId = id),
                ),
                const SizedBox(height: AppSpacing.sectionGap),
                Consumer(
                  builder: (context, ref, _) {
                    final plans = ref
                        .watch(rechargePlansProvider(selectedBiller.id))
                        .value;
                    final selectedPlan = plans
                        ?.where((p) => p.id == form.selectedPlanId)
                        .firstOrNull;
                    final base = selectedPlan?.price ?? form.customAmount;
                    return NPButton(
                      label: l10n.rechargePayCta,
                      onPressed: form.isValid
                          ? () => _pay(selectedBiller, base)
                          : null,
                    );
                  },
                ),
              ],
            ],
          );
        },
        loading: () => const Column(
          children: [
            NPShimmer(height: 40),
            SizedBox(height: AppSpacing.sm),
          ],
        ),
        error: (error, stackTrace) => NPErrorState(
          title: l10n.homeErrorTitle,
          body: l10n.homeErrorBody,
          onRetry: () => ref.invalidate(billersProvider),
          retryLabel: l10n.homeErrorRetry,
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({
    required this.plan,
    required this.selected,
    required this.onTap,
  });

  final RechargePlan plan;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: NPCard(
        onTap: onTap,
        color: selected ? colors.accentTint : null,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan.label,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    plan.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Text(
              plan.price.format(context),
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: colors.accentPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
