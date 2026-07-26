import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/rental_repository.dart';
import '../models/rental_addon.dart';
import '../models/rental_location.dart';
import '../models/rental_vehicle_class.dart';

part 'rental_catalog_provider.g.dart';

/// Rental pickup/drop-off points — product.md L1.
@Riverpod(keepAlive: true)
class RentalLocations extends _$RentalLocations {
  @override
  Future<List<RentalLocation>> build() =>
      ref.read(rentalRepositoryProvider).fetchLocations();
}

/// Rentable vehicle classes — product.md L2.
@Riverpod(keepAlive: true)
class RentalVehicleClasses extends _$RentalVehicleClasses {
  @override
  Future<List<RentalVehicleClass>> build() =>
      ref.read(rentalRepositoryProvider).fetchVehicleClasses();
}

/// Optional rental extras — product.md L3.
@Riverpod(keepAlive: true)
class RentalAddons extends _$RentalAddons {
  @override
  Future<List<RentalAddon>> build() =>
      ref.read(rentalRepositoryProvider).fetchAddons();
}
