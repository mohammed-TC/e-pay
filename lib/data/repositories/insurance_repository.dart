import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/models/insurance_quote.dart';
import '../../core/utils/mock_latency.dart';

part 'insurance_repository.g.dart';

/// Insurance quotes — architecture.md §8, seeded from
/// `assets/mock/quotes.json`.
class InsuranceRepository {
  List<InsuranceQuote>? _quotes;

  Future<List<InsuranceQuote>> fetchQuotes(String vehicleId) async {
    await simulateLatency();
    final cached = _quotes ??= await _load();
    return cached.where((q) => q.vehicleId == vehicleId).toList();
  }

  Future<List<InsuranceQuote>> _load() async {
    final raw = await rootBundle.loadString('assets/mock/quotes.json');
    return (jsonDecode(raw) as List<dynamic>)
        .map((e) => InsuranceQuote.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

@Riverpod(keepAlive: true)
InsuranceRepository insuranceRepository(Ref ref) => InsuranceRepository();
