import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/money.dart';
import '../../../core/models/txn_type.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_text_field.dart';
import '../../payment/models/payment_request.dart';
import '../../payment/models/payment_result.dart';
import '../providers/smart_meter_provider.dart';
import '../widgets/payment_method_picker.dart';

/// Screen E7 — Smart Meter Recharge
///
/// Meter number entry, amount, VAT — product.md E7. No saved-account
/// concept; charge is fetched fresh per meter number, same deterministic
/// shape as E5's bill fetch. Pay CTA builds a
/// `PaymentRequest(type: smartMeterRecharge)`.
class SmartMeterScreen extends ConsumerStatefulWidget {
  const SmartMeterScreen({super.key});

  @override
  ConsumerState<SmartMeterScreen> createState() => _SmartMeterScreenState();
}

class _SmartMeterScreenState extends ConsumerState<SmartMeterScreen> {
  String _methodId = PaymentMethodPicker.walletMethodId;

  Future<void> _pay() async {
    final l10n = context.l10n;
    final form = ref.read(smartMeterFormProvider);
    final bill = form.bill;
    if (bill == null) return;
    final request = PaymentRequest(
      type: TxnType.smartMeterRecharge,
      payeeName: l10n.smartMeterTitle,
      payeeSubtitle: form.meterNumber,
      lineItems: [
        for (final item in bill.lineItems)
          PaymentLineItem(label: item.label, amount: item.amount),
      ],
      amount: bill.amountDue,
      fee: Money.zero,
      meta: {'meterNumber': form.meterNumber, 'method': _methodId},
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
    final colors = Theme.of(context).extension<AppColors>()!;
    final form = ref.watch(smartMeterFormProvider);
    final notifier = ref.read(smartMeterFormProvider.notifier);
    final bill = form.bill;

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.smartMeterTitle)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [
          NPTextField(
            label: l10n.smartMeterNumberLabel,
            hint: l10n.smartMeterNumberHint,
            keyboardType: TextInputType.number,
            onChanged: notifier.setMeterNumber,
          ),
          const SizedBox(height: AppSpacing.lg),
          NPButton(
            label: l10n.smartMeterFetchCta,
            onPressed: form.isValid ? notifier.fetchCharge : null,
          ),
          if (bill != null) ...[
            const SizedBox(height: AppSpacing.sectionGap),
            NPCard(
              interactive: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final item in bill.lineItems)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.xs,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.label),
                          Text(item.amount.format(context)),
                        ],
                      ),
                    ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.smartMeterTotalLabel,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        bill.amountDue.format(context),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: colors.accentPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
            NPButton(label: l10n.smartMeterPayCta, onPressed: _pay),
          ],
        ],
      ),
    );
  }
}
