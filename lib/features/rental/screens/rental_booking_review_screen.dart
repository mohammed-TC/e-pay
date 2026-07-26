import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/money.dart';
import '../../../core/models/txn_type.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_empty_state.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../../../data/repositories/rewards_repository.dart';
import '../../payment/models/payment_request.dart';
import '../../payment/models/payment_result.dart';
import '../../rewards/providers/rewards_provider.dart';
import '../models/rental_booking.dart';
import '../providers/rental_bookings_provider.dart';
import '../providers/rental_draft_provider.dart';
import '../providers/rental_pricing_provider.dart';
import '../providers/rental_search_provider.dart';
import '../widgets/rental_summary_row.dart';

/// Screen L4 — Booking Review
///
/// Final line-item breakdown before the shared payment flow — product.md
/// L4. On success, credits the loyalty-multiplier bonus points (not part of
/// `PaymentService`'s fixed 1 pt/OMR invariant — payment-flow.md) and saves
/// the [RentalBooking] record for L5, then resets the search/draft state.
class RentalBookingReviewScreen extends ConsumerStatefulWidget {
  const RentalBookingReviewScreen({super.key});

  @override
  ConsumerState<RentalBookingReviewScreen> createState() =>
      _RentalBookingReviewScreenState();
}

class _RentalBookingReviewScreenState
    extends ConsumerState<RentalBookingReviewScreen> {
  Future<void> _confirm(RentalPricingBreakdown pricing) async {
    final draft = ref.read(rentalDraftProvider);
    final vehicleClass = draft.vehicleClass;
    if (vehicleClass == null) return;

    final request = PaymentRequest(
      type: TxnType.carRental,
      payeeName: vehicleClass.name,
      payeeSubtitle: draft.locationName ?? '',
      lineItems: [
        PaymentLineItem(
          label: context.l10n.rentalReviewRentalCostLabel,
          amount: pricing.subtotal,
        ),
        if (pricing.addonsCost > Money.zero)
          PaymentLineItem(
            label: context.l10n.rentalReviewAddonsCostLabel,
            amount: pricing.addonsCost,
          ),
      ],
      amount: pricing.total,
      fee: Money.zero,
      meta: {'rentalBonusPoints': pricing.bonusEarned},
    );

    final result = await context.push<PaymentResult>(
      Routes.paymentConfirm,
      extra: request,
    );
    if (result is! PaymentSuccess || !mounted) return;

    if (pricing.bonusEarned > 0) {
      ref.read(rewardsRepositoryProvider).credit(pricing.bonusEarned);
      await ref.read(appRewardsProvider.notifier).refresh();
    }

    final addons = ref.read(rentalDraftProvider).selectedAddonIds;
    await ref
        .read(rentalBookingsProvider.notifier)
        .add(
          RentalBooking(
            id: result.txn.id,
            locationId: draft.locationId ?? '',
            locationName: draft.locationName ?? '',
            vehicleClassId: vehicleClass.id,
            vehicleClassName: vehicleClass.name,
            pickupDate: draft.pickupDate ?? DateTime.now(),
            returnDate: draft.returnDate ?? DateTime.now(),
            days: draft.days,
            baseCost: pricing.subtotal,
            addonNames: addons.toList(),
            addonsCost: pricing.addonsCost,
            pointsRedeemed: pricing.pointsRedeemed,
            pointsDiscount: pricing.pointsDiscount,
            total: pricing.total,
            pointsEarned: pricing.totalEarned,
            bookedAt: DateTime.now(),
          ),
        );

    if (!mounted) return;
    ref.read(rentalDraftProvider.notifier).reset();
    ref.read(rentalSearchProvider.notifier).reset();
    context.go(Routes.myRentals);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final draft = ref.watch(rentalDraftProvider);
    final vehicleClass = draft.vehicleClass;

    if (vehicleClass == null) {
      return NPScaffold(
        appBar: AppBar(title: Text(l10n.rentalReviewTitle)),
        body: NPEmptyState(
          title: l10n.rentalResultsEmptyTitle,
          body: l10n.rentalResultsEmptyBody,
          ctaLabel: l10n.homeErrorRetry,
          onCta: () => context.pop(),
        ),
      );
    }

    final pricingAsync = ref.watch(rentalPricingProvider);
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context).toString();
    final dateFormat = DateFormat.yMMMd(locale);

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.rentalReviewTitle)),
      body: pricingAsync.when(
        data: (pricing) => ListView(
          children: [
            const SizedBox(height: AppSpacing.lg),
            NPCard(
              interactive: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(vehicleClass.name, style: textTheme.titleLarge),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    draft.locationName ?? '',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.inkSecondary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    '${dateFormat.format(draft.pickupDate!)} — ${dateFormat.format(draft.returnDate!)}',
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.inkTertiary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            NPCard(
              interactive: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RentalSummaryRow(
                    label: l10n.rentalReviewRentalCostLabel,
                    amount: pricing.subtotal,
                  ),
                  if (pricing.addonsCost > Money.zero)
                    RentalSummaryRow(
                      label: l10n.rentalReviewAddonsCostLabel,
                      amount: pricing.addonsCost,
                    ),
                  if (pricing.pointsRedeemed > 0)
                    RentalSummaryRow(
                      label: l10n.rentalReviewPointsDiscountLabel,
                      amount: pricing.pointsDiscount,
                      isDiscount: true,
                    ),
                  const Divider(height: AppSpacing.lg),
                  RentalSummaryRow(
                    label: l10n.paymentTotalLabel,
                    amount: pricing.total,
                    emphasize: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            NPCard(
              interactive: false,
              child: Row(
                children: [
                  Icon(Icons.stars_rounded, color: colors.accentPrimary),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(
                      l10n.rentalReviewEarnedPointsLabel,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    l10n.rentalReviewEarnedPointsValue(pricing.totalEarned),
                    style: textTheme.titleMedium?.copyWith(
                      color: colors.accentPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            NPButton(
              label: l10n.rentalReviewConfirmCta,
              onPressed: () => _confirm(pricing),
            ),
            const SizedBox(height: AppSpacing.lg),
          ],
        ),
        loading: () => const Padding(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: NPShimmer.card(height: 240),
        ),
        error: (error, stackTrace) => const SizedBox.shrink(),
      ),
    );
  }
}
