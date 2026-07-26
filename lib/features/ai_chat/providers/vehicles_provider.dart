import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/vehicle.dart';
import '../../../data/repositories/vehicles_repository.dart';

part 'vehicles_provider.g.dart';

/// Registered vehicles — product.md F3. Only the chat proactive nudge
/// (K1) reads this today; the Vehicle Renewal screen itself is not yet
/// built (`Routes.govRenewal` is a placeholder).
@Riverpod(keepAlive: true)
class Vehicles extends _$Vehicles {
  @override
  Future<List<Vehicle>> build() =>
      ref.read(vehiclesRepositoryProvider).fetchVehicles();
}
