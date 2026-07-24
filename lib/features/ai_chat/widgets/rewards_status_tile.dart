import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_card.dart';
import '../models/chat_card_data.dart';

/// Rewards points status card — design.md §11. `gold.reward` is scoped to
/// rewards content only (design-tokens.md) — this card qualifies.
class RewardsStatusTile extends StatelessWidget {
  const RewardsStatusTile({required this.data, super.key});

  final ChatRewardsStatusCard data;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final progress = (data.points / data.threshold).clamp(0.0, 1.0);

    return NPCard(
      onTap: () => context.go(Routes.rewards),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colors.goldReward.withValues(alpha: 0.14),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.star_rounded,
                  color: colors.goldReward,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  l10n.chatRewardsPointsLabel(data.points),
                  style: textTheme.titleLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: colors.surfaceSunken,
              valueColor: AlwaysStoppedAnimation(colors.goldReward),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.chatRewardsThresholdLabel(data.threshold),
            style: textTheme.bodySmall?.copyWith(color: colors.inkSecondary),
          ),
        ],
      ),
    );
  }
}
