import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/money.dart';

part 'rental_addon.freezed.dart';
part 'rental_addon.g.dart';

/// Whether an add-on's [RentalAddon.price] is charged once per trip or
/// multiplied by trip length — product.md L3.
enum AddonPricingBasis { flat, perDay }

/// An optional rental extra (damage protection, roadside assistance,
/// unlimited mileage, fuel package) — product.md L3. [loyaltyMultiplier]
/// above 1 doubles the reward points earned on the whole booking when this
/// add-on is selected (`RentalPricingBreakdown.doublePointsActive`).
@freezed
abstract class RentalAddon with _$RentalAddon {
  const factory RentalAddon({
    required String id,
    required String name,
    required String description,
    required AddonPricingBasis pricingBasis,
    required Money price,
    required int loyaltyMultiplier,
  }) = _RentalAddon;

  factory RentalAddon.fromJson(Map<String, dynamic> json) =>
      _$RentalAddonFromJson(json);
}
