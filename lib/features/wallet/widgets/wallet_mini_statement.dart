import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_empty_state.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_list_tile.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../../history/providers/transactions_provider.dart';

/// C1 Wallet Home's "mini statement (10 latest)" section — same
/// shimmer/content/error/empty shape as `home_screen.dart`'s
/// `_RecentTransactionsSection`, just a longer slice of the same
/// [appTransactionsProvider] feed.
class WalletMiniStatement extends ConsumerWidget {
  const WalletMiniStatement({super.key});

  static const _statementLength = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final txnsAsync = ref.watch(appTransactionsProvider);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.walletMiniStatementTitle, style: textTheme.titleLarge),
            NPButton(
              label: l10n.walletViewAll,
              variant: NPButtonVariant.ghost,
              onPressed: () => context.go(Routes.history),
            ),
          ],
        ),
        txnsAsync.when(
          data: (txns) {
            final recent = txns.take(_statementLength).toList();
            if (recent.isEmpty) {
              return NPEmptyState(
                title: l10n.walletStatementEmptyTitle,
                body: l10n.walletStatementEmptyBody,
              );
            }
            return Column(
              children: [
                for (final txn in recent)
                  NPListTile(
                    title: txn.title,
                    subtitle: txn.subtitle,
                    trailingAmount: txn.amount,
                    isPositive: false,
                  ),
              ],
            );
          },
          loading: () => Column(
            children: List.generate(
              4,
              (index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
                child: NPShimmer(height: 56),
              ),
            ),
          ),
          error: (error, stackTrace) => NPErrorState(
            title: l10n.homeErrorTitle,
            body: l10n.homeErrorBody,
            onRetry: () =>
                unawaited(ref.read(appTransactionsProvider.notifier).refresh()),
            retryLabel: l10n.homeErrorRetry,
          ),
        ),
      ],
    );
  }
}
