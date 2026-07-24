import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/txn.dart';
import '../../../core/models/txn_status.dart';
import '../../../core/widgets/np_badge.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_scaffold.dart';

/// Screen J2 — Transaction Detail
class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({required this.txn, super.key});

  final Txn txn;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    final total = txn.amount + txn.fee;
    final locale = Localizations.localeOf(context).toString();
    final dateLabel = DateFormat.yMMMd(locale).add_jm().format(txn.date);

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.txnDetailTitle)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.lg),
            Text(txn.title, style: textTheme.displayMedium),
            const SizedBox(height: AppSpacing.xs),
            Text(
              txn.subtitle,
              style: textTheme.bodyLarge?.copyWith(color: colors.inkSecondary),
            ),
            const SizedBox(height: AppSpacing.md),
            _StatusBadge(status: txn.status),
            const SizedBox(height: AppSpacing.xl),
            NPCard(
              interactive: false,
              child: Column(
                children: [
                  _DetailRow(
                    label: l10n.txnDetailAmountLabel,
                    value: txn.amount.format(context),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _DetailRow(
                    label: l10n.txnDetailFeeLabel,
                    value: txn.fee.format(context),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      vertical: AppSpacing.sm,
                    ),
                    child: Divider(height: 1),
                  ),
                  _DetailRow(
                    label: l10n.txnDetailTotalLabel,
                    value: total.format(context),
                    emphasize: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            NPCard(
              interactive: false,
              child: Column(
                children: [
                  _DetailRow(label: l10n.txnDetailDateLabel, value: dateLabel),
                  const SizedBox(height: AppSpacing.sm),
                  _DetailRow(
                    label: l10n.txnDetailReferenceLabel,
                    value: txn.referenceNo,
                  ),
                  if (txn.rewardPointsEarned > 0) ...[
                    const SizedBox(height: AppSpacing.sm),
                    _DetailRow(
                      label: l10n.txnDetailRewardPointsLabel,
                      value: '${txn.rewardPointsEarned}',
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            NPButton(
              label: l10n.txnDetailRedownloadReceipt,
              variant: NPButtonVariant.secondary,
              onPressed: () => context.push(Routes.paymentReceipt, extra: txn),
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }
}

/// Status pill — emerald tint for success, warning/danger tint otherwise.
class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final TxnStatus status;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final l10n = context.l10n;

    final (label, tint, ink) = switch (status) {
      TxnStatus.success => (
        l10n.historyStatusSuccess,
        colors.accentTint,
        colors.accentDeep,
      ),
      TxnStatus.pending => (
        l10n.historyStatusPending,
        colors.semanticWarning.withValues(alpha: 0.14),
        colors.semanticWarning,
      ),
      TxnStatus.failed => (
        l10n.historyStatusFailed,
        colors.semanticDanger.withValues(alpha: 0.14),
        colors.semanticDanger,
      ),
    };

    return NPBadge(label: label, tintColor: tint, textColor: ink);
  }
}

/// Label/value row for the amount-breakdown and meta cards.
class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  final String label;
  final String value;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: textTheme.bodyLarge?.copyWith(color: colors.inkSecondary),
        ),
        Text(
          value,
          style: emphasize
              ? textTheme.titleLarge
              : textTheme.bodyLarge?.copyWith(color: colors.inkPrimary),
        ),
      ],
    );
  }
}
