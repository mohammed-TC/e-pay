import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/money.dart';

part 'rental_booking.freezed.dart';
part 'rental_booking.g.dart';

/// A completed rental booking record — product.md L5. Saved by
/// `RentalRepository.saveBooking` once the shared payment flow succeeds;
/// [pointsEarned] already includes the loyalty-multiplier bonus (computed
/// pre-payment by `rentalPricingProvider`, not by `PaymentService`).
@freezed
abstract class RentalBooking with _$RentalBooking {
  const factory RentalBooking({
    required String id,
    required String locationId,
    required String locationName,
    required String vehicleClassId,
    required String vehicleClassName,
    required DateTime pickupDate,
    required DateTime returnDate,
    required int days,
    required Money baseCost,
    required List<String> addonNames,
    required Money addonsCost,
    required int pointsRedeemed,
    required Money pointsDiscount,
    required Money total,
    required int pointsEarned,
    required DateTime bookedAt,
  }) = _RentalBooking;

  factory RentalBooking.fromJson(Map<String, dynamic> json) =>
      _$RentalBookingFromJson(json);
}
