import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../payment/models/payment_result.dart';
import '../models/chat_card_data.dart';

/// Generic payment shortcut card (e.g. chat-originated Send Money) —
/// design.md §11. Preview only: "Review & Pay" hands [request] to the
/// shared payment flow, this tile never confirms/pays anything itself
/// (payment-flow.md).
class PaymentShortcutTile extends StatelessWidget {
  const PaymentShortcutTile({required this.data, super.key});

  final ChatPaymentShortcutCard data;

  Future<void> _reviewAndPay(BuildContext context) async {
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

    return NPCard(
      interactive: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.send_outlined, color: colors.accentPrimary, size: 22),
              const SizedBox(width: AppSpacing.sm),
              Expanded(child: Text(data.title, style: textTheme.titleLarge)),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            data.subtitle,
            style: textTheme.bodySmall?.copyWith(color: colors.inkSecondary),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            data.request.amount.format(context),
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.md),
          NPButton(
            label: l10n.chatReviewAndPayCta,
            onPressed: () => unawaited(_reviewAndPay(context)),
          ),
        ],
      ),
    );
  }
}
