import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/money.dart';

part 'rental_vehicle_class.freezed.dart';
part 'rental_vehicle_class.g.dart';

/// A rentable vehicle class (Economy / Compact SUV / Premium Saloon) —
/// product.md L2/L3. [perDay] is the day-rate; trip totals are
/// `perDay × days` (`RentalRepository.classTotal`).
@freezed
abstract class RentalVehicleClass with _$RentalVehicleClass {
  const factory RentalVehicleClass({
    required String id,
    required String name,
    required String iconKey,
    required int seats,
    required String transmission,
    required int bags,
    required Money perDay,
    required String mileagePolicy,
  }) = _RentalVehicleClass;

  factory RentalVehicleClass.fromJson(Map<String, dynamic> json) =>
      _$RentalVehicleClassFromJson(json);
}
