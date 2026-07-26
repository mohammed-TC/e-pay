import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/demo_constants.dart';
import '../../../core/models/money.dart';
import '../../../data/repositories/rental_repository.dart';
import '../../rewards/providers/rewards_provider.dart';
import 'rental_catalog_provider.dart';
import 'rental_draft_provider.dart';

part 'rental_pricing_provider.g.dart';

/// Full L3/L4 price + points breakdown, derived from [rentalDraftProvider] —
/// business logic lives here, never in a widget (flutter-conventions.md).
typedef RentalPricingBreakdown = ({
  Money subtotal,
  int pointsAvailable,
  int pointsRedeemed,
  Money pointsDiscount,
  Money addonsCost,
  Money total,
  int baseEarned,
  int bonusEarned,
  int totalEarned,
  bool doublePointsActive,
});

const _emptyBreakdown = (
  subtotal: Money.zero,
  pointsAvailable: 0,
  pointsRedeemed: 0,
  pointsDiscount: Money.zero,
  addonsCost: Money.zero,
  total: Money.zero,
  baseEarned: 0,
  bonusEarned: 0,
  totalEarned: 0,
  doublePointsActive: false,
);

@riverpod
Future<RentalPricingBreakdown> rentalPricing(Ref ref) async {
  final draft = ref.watch(rentalDraftProvider);
  final vehicleClass = draft.vehicleClass;
  if (vehicleClass == null) return _emptyBreakdown;

  final subtotal = RentalRepository.classTotal(vehicleClass, draft.days);
  final addons = await ref.watch(rentalAddonsProvider.future);
  final selectedAddons = addons.where(
    (addon) => draft.selectedAddonIds.contains(addon.id),
  );

  var addonsCost = Money.zero;
  var doublePointsActive = false;
  for (final addon in selectedAddons) {
    addonsCost += RentalRepository.addonTotal(addon, draft.days);
    if (addon.loyaltyMultiplier > 1) doublePointsActive = true;
  }

  final rewards = await ref.watch(appRewardsProvider.future);
  final preDiscountTotal = subtotal + addonsCost;
  final pointsDiscount = draft.redeemPoints
      ? RentalRepository.pointsToDiscount(rewards.points, preDiscountTotal)
      : Money.zero;
  final pointsRedeemed = draft.redeemPoints
      ? RentalRepository.discountToPoints(pointsDiscount)
      : 0;
  final total = preDiscountTotal - pointsDiscount;
  final baseEarned = total.amount.floor() * DemoConstants.rewardPointsPerOmr;
  final bonusEarned = doublePointsActive ? baseEarned : 0;

  return (
    subtotal: subtotal,
    pointsAvailable: rewards.points,
    pointsRedeemed: pointsRedeemed,
    pointsDiscount: pointsDiscount,
    addonsCost: addonsCost,
    total: total,
    baseEarned: baseEarned,
    bonusEarned: bonusEarned,
    totalEarned: baseEarned + bonusEarned,
    doublePointsActive: doublePointsActive,
  );
}
