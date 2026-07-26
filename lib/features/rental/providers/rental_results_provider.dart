import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/money.dart';
import '../../../data/repositories/rental_repository.dart';
import '../models/rental_vehicle_class.dart';
import 'rental_catalog_provider.dart';
import 'rental_search_provider.dart';

part 'rental_results_provider.g.dart';

/// One L2 result row: a vehicle class priced for the current search's trip
/// length.
typedef RentalResult = ({
  RentalVehicleClass vehicleClass,
  int days,
  Money total,
});

/// Vehicle classes priced for [rentalSearchProvider]'s current dates —
/// product.md L2. Business logic lives here, not in the L2 screen
/// (flutter-conventions.md).
@riverpod
Future<List<RentalResult>> rentalResults(Ref ref) async {
  final params = ref.watch(rentalSearchProvider);
  final classes = await ref.watch(rentalVehicleClassesProvider.future);
  final days = params.pickupDate != null && params.returnDate != null
      ? RentalRepository.calculateDays(params.pickupDate!, params.returnDate!)
      : 1;
  return [
    for (final vehicleClass in classes)
      (
        vehicleClass: vehicleClass,
        days: days,
        total: RentalRepository.classTotal(vehicleClass, days),
      ),
  ];
}
