import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../payment/models/payment_result.dart';
import '../models/chat_card_data.dart';
import '../providers/chat_provider.dart';

/// Generic payment shortcut card (e.g. chat-originated Send Money or a
/// proactive vehicle-renewal offer) — design.md §11. Preview only:
/// "Review & Pay" hands [request] to the shared payment flow, this tile
/// never confirms/pays anything itself (payment-flow.md). The result feeds
/// back to [ChatNotifier] so a successful payment can trigger a follow-up
/// nudge.
class PaymentShortcutTile extends ConsumerWidget {
  const PaymentShortcutTile({required this.data, super.key});

  final ChatPaymentShortcutCard data;

  Future<void> _reviewAndPay(BuildContext context, WidgetRef ref) async {
    final result = await context.push<PaymentResult>(
      Routes.paymentConfirm,
      extra: data.request,
    );
    if (result == null) return;
    await ref
        .read(chatProvider.notifier)
        .onPaymentCompleted(result, data.request);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onPressed: () => unawaited(_reviewAndPay(context, ref)),
          ),
        ],
      ),
    );
  }
}
