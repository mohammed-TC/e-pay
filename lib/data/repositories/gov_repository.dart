import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/models/fine.dart';
import '../../core/models/vehicle.dart';
import '../../core/utils/mock_latency.dart';

part 'gov_repository.g.dart';

/// Traffic fines + vehicles — architecture.md §8, seeded from
/// `assets/mock/fines.json` + `vehicles.json`.
class GovRepository {
  List<Fine>? _fines;
  List<Vehicle>? _vehicles;

  Future<List<Fine>> fetchFines() async {
    await simulateLatency();
    final cached = _fines;
    if (cached != null) return cached;
    final raw = await rootBundle.loadString('assets/mock/fines.json');
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => Fine.fromJson(e as Map<String, dynamic>))
        .toList();
    _fines = list;
    return list;
  }

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
GovRepository govRepository(Ref ref) => GovRepository();
