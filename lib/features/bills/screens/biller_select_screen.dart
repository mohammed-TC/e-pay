import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/biller.dart';
import '../../../core/models/biller_category.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_empty_state.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../providers/billers_provider.dart';

/// Screen E2 — Biller Select
///
/// Grid of fictional provider brands within [category] — product.md E2.
/// Tapping a biller pushes E4 (Saved Accounts, scoped to that biller).
class BillerSelectScreen extends ConsumerWidget {
  const BillerSelectScreen({required this.category, super.key});

  final BillerCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final billersAsync = ref.watch(billersProvider);

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.billerSelectTitle)),
      body: billersAsync.when(
        data: (billers) {
          final filtered = billers
              .where((biller) => biller.category == category)
              .toList();
          if (filtered.isEmpty) {
            return NPEmptyState(
              title: l10n.billerSelectEmptyTitle,
              body: l10n.billerSelectEmptyBody,
            );
          }
          return GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            childAspectRatio: 1.4,
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
            children: [
              for (final biller in filtered) _BillerTile(biller: biller),
            ],
          );
        },
        loading: () => GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: AppSpacing.md,
          crossAxisSpacing: AppSpacing.md,
          childAspectRatio: 1.4,
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
          children: List.generate(4, (index) => const NPShimmer.card()),
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

class _BillerTile extends StatelessWidget {
  const _BillerTile({required this.biller});

  final Biller biller;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final brandColor = Color(
      int.parse(biller.brandColorHex.replaceFirst('#', '0xFF')),
    );

    return NPCard(
      onTap: () => context.push(Routes.billsSavedAccounts, extra: biller),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: brandColor.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.receipt_long_outlined,
              size: 20,
              color: brandColor,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            biller.name,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: colors.inkPrimary),
          ),
        ],
      ),
    );
  }
}
