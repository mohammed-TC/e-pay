import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

/// A registered vehicle — product.md F3.
@freezed
abstract class Vehicle with _$Vehicle {
  const factory Vehicle({
    required String id,
    required String plateNumber,
    required String make,
    required String model,
    required int year,
    required bool insuranceValid,
    required DateTime registrationExpiry,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
}
