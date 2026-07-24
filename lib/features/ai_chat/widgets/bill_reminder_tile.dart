import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_badge.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../payment/models/payment_result.dart';
import '../models/chat_card_data.dart';

/// Bill reminder card — design.md §11, mirrors Bill Detail's (E5) due-date
/// warning treatment. "Pay now" pushes [ChatBillReminderCard.request]
/// straight to the shared payment flow — this tile never confirms anything
/// itself (payment-flow.md).
class BillReminderTile extends StatelessWidget {
  const BillReminderTile({required this.data, super.key});

  final ChatBillReminderCard data;

  Future<void> _pay(BuildContext context) async {
    await context.push<PaymentResult>(
      Routes.paymentConfirm,
      extra: data.request,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final dueInDays = data.dueDate.difference(DateTime.now()).inDays;
    final dueSoon = dueInDays < 5;

    return NPCard(
      interactive: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.receipt_long_outlined,
                color: colors.accentPrimary,
                size: 22,
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(data.billerName, style: textTheme.titleLarge),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            data.accountLabel,
            style: textTheme.bodySmall?.copyWith(color: colors.inkSecondary),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            data.request.amount.format(context),
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          NPBadge(
            label: dueSoon
                ? l10n.chatBillDueSoonBadge(dueInDays)
                : l10n.chatBillDueBadge(dueInDays),
            tintColor: dueSoon
                ? colors.semanticWarning.withValues(alpha: 0.14)
                : null,
            textColor: dueSoon ? colors.semanticWarning : null,
          ),
          const SizedBox(height: AppSpacing.md),
          NPButton(
            label: l10n.chatPayNowCta,
            onPressed: () => unawaited(_pay(context)),
          ),
        ],
      ),
    );
  }
}
