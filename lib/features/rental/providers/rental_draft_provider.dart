import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/rental_vehicle_class.dart';

part 'rental_draft_provider.g.dart';

/// L3 selection state for the vehicle class the user picked on L2, plus the
/// add-ons/points toggle they choose on L3 — plain state, not `@freezed`
/// (same rationale as `RentalSearchParams`).
class RentalBookingDraft {
  const RentalBookingDraft({
    this.locationId,
    this.locationName,
    this.pickupDate,
    this.returnDate,
    this.vehicleClass,
    this.days = 1,
    this.selectedAddonIds = const <String>{},
    this.redeemPoints = false,
  });

  final String? locationId;
  final String? locationName;
  final DateTime? pickupDate;
  final DateTime? returnDate;
  final RentalVehicleClass? vehicleClass;
  final int days;
  final Set<String> selectedAddonIds;
  final bool redeemPoints;

  RentalBookingDraft copyWith({
    String? locationId,
    String? locationName,
    DateTime? pickupDate,
    DateTime? returnDate,
    RentalVehicleClass? vehicleClass,
    int? days,
    Set<String>? selectedAddonIds,
    bool? redeemPoints,
  }) {
    return RentalBookingDraft(
      locationId: locationId ?? this.locationId,
      locationName: locationName ?? this.locationName,
      pickupDate: pickupDate ?? this.pickupDate,
      returnDate: returnDate ?? this.returnDate,
      vehicleClass: vehicleClass ?? this.vehicleClass,
      days: days ?? this.days,
      selectedAddonIds: selectedAddonIds ?? this.selectedAddonIds,
      redeemPoints: redeemPoints ?? this.redeemPoints,
    );
  }
}

/// L2→L4 booking-in-progress state — product.md L3/L4.
@Riverpod(keepAlive: true)
class RentalDraft extends _$RentalDraft {
  @override
  RentalBookingDraft build() => const RentalBookingDraft();

  void selectClass({
    required String locationId,
    required String locationName,
    required DateTime pickupDate,
    required DateTime returnDate,
    required RentalVehicleClass vehicleClass,
    required int days,
  }) {
    state = RentalBookingDraft(
      locationId: locationId,
      locationName: locationName,
      pickupDate: pickupDate,
      returnDate: returnDate,
      vehicleClass: vehicleClass,
      days: days,
    );
  }

  void toggleAddon(String addonId) {
    final current = state.selectedAddonIds;
    final next = current.contains(addonId)
        ? {
            for (final id in current)
              if (id != addonId) id,
          }
        : {...current, addonId};
    state = state.copyWith(selectedAddonIds: next);
  }

  void setRedeemPoints({required bool value}) =>
      state = state.copyWith(redeemPoints: value);

  void reset() => state = const RentalBookingDraft();
}
