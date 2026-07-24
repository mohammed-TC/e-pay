import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/biller_account.dart';
import '../../../core/models/money.dart';
import '../../../core/models/txn_type.dart';
import '../../../core/widgets/np_badge.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../../../l10n/app_localizations.dart';
import '../../payment/models/payment_request.dart';
import '../../payment/models/payment_result.dart';
import '../providers/bill_detail_provider.dart';
import '../widgets/payment_method_picker.dart';
import '../widgets/pdf_viewer_sheet.dart';

/// Screen E5 — Bill Detail
///
/// Amount due, due date, breakdown, "View PDF", pay CTA — product.md E5.
/// Perforated-card receipt metaphor with a due-date warning chip when
/// <5 days remain (design.md). Pay CTA builds a `PaymentRequest(type:
/// bill)` through the shared payment flow (payment-flow.md).
class BillDetailScreen extends ConsumerStatefulWidget {
  const BillDetailScreen({required this.account, super.key});

  final BillerAccount account;

  @override
  ConsumerState<BillDetailScreen> createState() => _BillDetailScreenState();
}

class _BillDetailScreenState extends ConsumerState<BillDetailScreen> {
  String _methodId = PaymentMethodPicker.walletMethodId;

  Future<void> _pay(Money amountDue) async {
    final l10n = context.l10n;
    final request = PaymentRequest(
      type: TxnType.bill,
      payeeName: widget.account.nickname,
      payeeSubtitle: widget.account.accountNumber,
      lineItems: [
        PaymentLineItem(
          label: l10n.billDetailAmountDueLabel,
          amount: amountDue,
        ),
      ],
      amount: amountDue,
      fee: Money.zero,
      meta: {'billerAccountId': widget.account.id, 'method': _methodId},
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
    final billAsync = ref.watch(billDetailProvider(widget.account));

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.billDetailTitle)),
      body: billAsync.when(
        data: (bill) => ListView(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
          children: [
            NPCard(
              interactive: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.account.nickname,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    widget.account.accountNumber,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    bill.amountDue.format(context),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _DueDateChip(dueDate: bill.dueDate, l10n: l10n),
                  const SizedBox(height: AppSpacing.lg),
                  const _DashedDivider(),
                  const SizedBox(height: AppSpacing.lg),
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
                  const SizedBox(height: AppSpacing.lg),
                  NPButton(
                    label: l10n.billDetailViewPdfCta,
                    variant: NPButtonVariant.secondary,
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const PdfViewerSheet(),
                      ),
                    ),
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
            NPButton(
              label: l10n.billDetailPayCta,
              onPressed: () => _pay(bill.amountDue),
            ),
          ],
        ),
        loading: () => const Column(
          children: [
            NPShimmer.card(height: 220),
            SizedBox(height: AppSpacing.lg),
            NPShimmer(height: 56),
          ],
        ),
        error: (error, stackTrace) => NPErrorState(
          title: l10n.homeErrorTitle,
          body: l10n.homeErrorBody,
          onRetry: () => ref.invalidate(billDetailProvider(widget.account)),
          retryLabel: l10n.homeErrorRetry,
        ),
      ),
    );
  }
}

class _DueDateChip extends StatelessWidget {
  const _DueDateChip({required this.dueDate, required this.l10n});

  final DateTime dueDate;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final daysLeft = dueDate.difference(DateTime.now()).inDays;
    final isWarning = daysLeft < 5;
    final label = DateFormat.yMMMd(
      Localizations.localeOf(context).toString(),
    ).format(dueDate);

    return NPBadge(
      label: '${l10n.billDetailDueDateLabel} $label',
      icon: isWarning ? Icons.warning_amber_rounded : null,
      tintColor: isWarning
          ? colors.semanticWarning.withValues(alpha: 0.12)
          : null,
      textColor: isWarning ? colors.semanticWarning : null,
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 6.0;
        const dashSpace = 4.0;
        final count = (constraints.maxWidth / (dashWidth + dashSpace)).floor();
        return Row(
          children: List.generate(
            count,
            (index) => Padding(
              padding: const EdgeInsetsDirectional.only(end: dashSpace),
              child: SizedBox(
                width: dashWidth,
                height: 1,
                child: ColoredBox(
                  color: colors.inkPrimary.withValues(alpha: 0.16),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
