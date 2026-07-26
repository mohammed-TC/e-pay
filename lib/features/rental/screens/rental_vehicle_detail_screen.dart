import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_empty_state.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../../../data/repositories/rental_repository.dart';
import '../models/rental_vehicle_class.dart';
import '../providers/rental_catalog_provider.dart';
import '../providers/rental_draft_provider.dart';
import '../providers/rental_pricing_provider.dart';
import '../widgets/rental_addon_tile.dart';
import '../widgets/rental_summary_row.dart';

/// Screen L3 — Vehicle & Extras
///
/// Vehicle spec card, points-redemption toggle, and add-on selection for
/// the class chosen on L2 — product.md L3. All pricing/points math is
/// derived by [rentalPricingProvider]; this screen only renders it.
class RentalVehicleDetailScreen extends ConsumerWidget {
  const RentalVehicleDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final draft = ref.watch(rentalDraftProvider);
    final vehicleClass = draft.vehicleClass;

    if (vehicleClass == null) {
      return NPScaffold(
        appBar: AppBar(title: Text(l10n.rentalDetailTitle)),
        body: NPEmptyState(
          title: l10n.rentalResultsEmptyTitle,
          body: l10n.rentalResultsEmptyBody,
          ctaLabel: l10n.homeErrorRetry,
          onCta: () => context.pop(),
        ),
      );
    }

    final addonsAsync = ref.watch(rentalAddonsProvider);
    final pricingAsync = ref.watch(rentalPricingProvider);
    final notifier = ref.read(rentalDraftProvider.notifier);

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.rentalDetailTitle)),
      body: ListView(
        children: [
          const SizedBox(height: AppSpacing.lg),
          _VehicleSpecCard(vehicleClass: vehicleClass, days: draft.days),
          const SizedBox(height: AppSpacing.lg),
          _RedeemPointsTile(
            redeemPoints: draft.redeemPoints,
            pointsAvailable: pricingAsync.maybeWhen(
              data: (pricing) => pricing.pointsAvailable,
              orElse: () => 0,
            ),
            onChanged: (value) => notifier.setRedeemPoints(value: value),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            l10n.rentalDetailAddonsTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.md),
          addonsAsync.when(
            data: (addons) => Column(
              children: [
                for (final addon in addons) ...[
                  RentalAddonTile(
                    addon: addon,
                    priceForTrip: RentalRepository.addonTotal(
                      addon,
                      draft.days,
                    ),
                    selected: draft.selectedAddonIds.contains(addon.id),
                    onTap: () => notifier.toggleAddon(addon.id),
                  ),
                  const SizedBox(height: AppSpacing.md),
                ],
              ],
            ),
            loading: () => Column(
              children: List.generate(
                4,
                (index) => const Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.md),
                  child: NPShimmer.card(height: 88),
                ),
              ),
            ),
            error: (error, stackTrace) => NPErrorState(
              title: l10n.homeErrorTitle,
              body: l10n.homeErrorBody,
              onRetry: () => ref.invalidate(rentalAddonsProvider),
              retryLabel: l10n.homeErrorRetry,
            ),
          ),
          const SizedBox(height: AppSpacing.xxxl),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: pricingAsync.when(
            data: (pricing) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RentalSummaryRow(
                  label: l10n.paymentTotalLabel,
                  amount: pricing.total,
                  emphasize: true,
                ),
                const SizedBox(height: AppSpacing.sm),
                NPButton(
                  label: l10n.rentalDetailContinueCta,
                  onPressed: () => context.push(Routes.rentalBookingReview),
                ),
              ],
            ),
            loading: () => const NPShimmer.card(height: 56),
            error: (error, stackTrace) => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

class _VehicleSpecCard extends StatelessWidget {
  const _VehicleSpecCard({required this.vehicleClass, required this.days});

  final RentalVehicleClass vehicleClass;
  final int days;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;

    return NPCard(
      interactive: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(vehicleClass.name, style: textTheme.displaySmall),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.sm,
            children: [
              _SpecChip(
                icon: Icons.event_seat_outlined,
                label: l10n.rentalDetailSpecsSeats(vehicleClass.seats),
              ),
              _SpecChip(
                icon: Icons.settings_outlined,
                label: vehicleClass.transmission,
              ),
              _SpecChip(
                icon: Icons.luggage_outlined,
                label: l10n.rentalDetailSpecsBags(vehicleClass.bags),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            vehicleClass.mileagePolicy,
            style: textTheme.bodySmall?.copyWith(color: colors.inkSecondary),
          ),
        ],
      ),
    );
  }
}

class _SpecChip extends StatelessWidget {
  const _SpecChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: colors.inkSecondary),
        const SizedBox(width: AppSpacing.xs),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: colors.inkSecondary),
        ),
      ],
    );
  }
}

class _RedeemPointsTile extends StatelessWidget {
  const _RedeemPointsTile({
    required this.redeemPoints,
    required this.pointsAvailable,
    required this.onChanged,
  });

  final bool redeemPoints;
  final int pointsAvailable;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).extension<AppColors>()!;

    return NPCard(
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
                  l10n.rentalDetailRedeemPointsTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  l10n.rentalDetailRedeemPointsBody(pointsAvailable),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colors.inkSecondary,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: redeemPoints,
            onChanged: pointsAvailable > 0 ? onChanged : null,
            activeThumbColor: colors.accentPrimary,
          ),
        ],
      ),
    );
  }
}
