import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/models/vehicle.dart';
import '../../core/utils/mock_latency.dart';

part 'vehicles_repository.g.dart';

/// Registered vehicles — product.md F3, seeded from
/// `assets/mock/vehicles.json`. Read-only: no screen mutates a vehicle yet.
class VehiclesRepository {
  List<Vehicle>? _vehicles;

  Future<List<Vehicle>> fetchVehicles() async {
    await simulateLatency();
    final cached = _vehicles;
    if (cached != null) return cached;
    final raw = await rootBundle.loadString('assets/mock/vehicles.json');
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
        .toList();
    _vehicles = list;
    return list;
  }
}

@Riverpod(keepAlive: true)
VehiclesRepository vehiclesRepository(Ref ref) => VehiclesRepository();
