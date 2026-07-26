import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/money.dart';
import '../../../core/widgets/np_badge.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_empty_state.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../../rewards/providers/rewards_provider.dart';
import '../models/rental_location.dart';
import '../providers/rental_catalog_provider.dart';
import '../providers/rental_draft_provider.dart';
import '../providers/rental_results_provider.dart';
import '../providers/rental_search_provider.dart';
import '../widgets/rental_class_card.dart';

/// Screen L2 — Vehicle Results
///
/// Priced vehicle classes for the L1 search — product.md L2. Surfaces a
/// rewards-redeemable banner when the user has a nonzero points balance,
/// then hands the chosen class + trip context to [rentalDraftProvider]
/// before pushing L3.
class RentalResultsScreen extends ConsumerWidget {
  const RentalResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final resultsAsync = ref.watch(rentalResultsProvider);
    final rewardsAsync = ref.watch(appRewardsProvider);
    final params = ref.watch(rentalSearchProvider);
    final locationsAsync = ref.watch(rentalLocationsProvider);

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.rentalResultsTitle)),
      body: resultsAsync.when(
        data: (results) {
          if (results.isEmpty) {
            return NPEmptyState(
              title: l10n.rentalResultsEmptyTitle,
              body: l10n.rentalResultsEmptyBody,
            );
          }
          final points = rewardsAsync.maybeWhen(
            data: (rewards) => rewards.points,
            orElse: () => 0,
          );
          return ListView(
            children: [
              if (points > 0) _RewardsBanner(points: points),
              const SizedBox(height: AppSpacing.md),
              for (final result in results) ...[
                RentalClassCard(
                  vehicleClass: result.vehicleClass,
                  days: result.days,
                  total: result.total,
                  onTap: () {
                    final locationName = locationsAsync
                        .maybeWhen(
                          data: (locations) => locations,
                          orElse: () => const <RentalLocation>[],
                        )
                        .where((l) => l.id == params.locationId)
                        .firstOrNull
                        ?.name;
                    ref
                        .read(rentalDraftProvider.notifier)
                        .selectClass(
                          locationId: params.locationId!,
                          locationName: locationName ?? '',
                          pickupDate: params.pickupDate!,
                          returnDate: params.returnDate!,
                          vehicleClass: result.vehicleClass,
                          days: result.days,
                        );
                    unawaited(context.push(Routes.rentalVehicleDetail));
                  },
                ),
                const SizedBox(height: AppSpacing.md),
              ],
            ],
          );
        },
        loading: () => ListView(
          children: List.generate(
            3,
            (index) => const Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.md),
              child: NPShimmer.card(height: 96),
            ),
          ),
        ),
        error: (error, stackTrace) => NPErrorState(
          title: l10n.homeErrorTitle,
          body: l10n.homeErrorBody,
          onRetry: () => ref.invalidate(rentalResultsProvider),
          retryLabel: l10n.homeErrorRetry,
        ),
      ),
    );
  }
}

/// 100 reward points = OMR 1 (same conversion as
/// `RentalRepository.pointsToDiscount`, uncapped here since no booking
/// subtotal exists yet on L2 — this is just a "here's what your points are
/// worth" preview).
class _RewardsBanner extends StatelessWidget {
  const _RewardsBanner({required this.points});

  final int points;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).extension<AppColors>()!;
    final value = Money.fromAmount(points * 0.01);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: NPCard(
        interactive: false,
        child: Row(
          children: [
            Icon(Icons.stars_rounded, color: colors.accentPrimary),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.rentalResultsRewardsBannerTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    l10n.rentalResultsRewardsBannerBody(
                      points,
                      value.format(context),
                    ),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colors.inkSecondary,
                    ),
                  ),
                ],
              ),
            ),
            NPBadge(label: l10n.rentalResultsRewardsBadge),
          ],
        ),
      ),
    );
  }
}
