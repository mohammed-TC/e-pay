import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_card.dart';
import '../models/chat_card_data.dart';

/// Wallet balance summary card — design.md §11. Read-only; tapping routes to
/// Wallet Home (C1) rather than acting itself.
class WalletSummaryTile extends StatelessWidget {
  const WalletSummaryTile({required this.data, super.key});

  final ChatWalletSummaryCard data;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return NPCard(
      onTap: () => context.push(Routes.wallet),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: colors.accentPrimary.withValues(alpha: 0.10),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.account_balance_wallet_outlined,
              color: colors.accentPrimary,
              size: 22,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.chatWalletSummaryLabel,
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.inkSecondary,
                  ),
                ),
                Text(data.balance.format(context), style: textTheme.titleLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
