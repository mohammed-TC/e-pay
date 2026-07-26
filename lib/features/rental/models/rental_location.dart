import 'package:freezed_annotation/freezed_annotation.dart';

part 'rental_location.freezed.dart';
part 'rental_location.g.dart';

/// A car-rental pickup/drop-off point — product.md L1.
@freezed
abstract class RentalLocation with _$RentalLocation {
  const factory RentalLocation({
    required String id,
    required String name,
    required String subtitle,
    required bool isAirport,
  }) = _RentalLocation;

  factory RentalLocation.fromJson(Map<String, dynamic> json) =>
      _$RentalLocationFromJson(json);
}
