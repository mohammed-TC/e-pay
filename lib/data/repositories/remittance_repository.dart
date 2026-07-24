import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/models/beneficiary.dart';
import '../../core/utils/mock_latency.dart';

part 'remittance_repository.g.dart';

/// Beneficiaries + mock FX rates — architecture.md §8, seeded from
/// `assets/mock/beneficiaries.json`.
class RemittanceRepository {
  List<Beneficiary>? _beneficiaries;

  Future<List<Beneficiary>> fetchBeneficiaries() async {
    await simulateLatency();
    final cached = _beneficiaries;
    if (cached != null) return cached;
    final raw = await rootBundle.loadString('assets/mock/beneficiaries.json');
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => Beneficiary.fromJson(e as Map<String, dynamic>))
        .toList();
    _beneficiaries = list;
    return list;
  }

  Future<void> addBeneficiary(Beneficiary beneficiary) async {
    await simulateLatency();
    final current = await fetchBeneficiaries();
    _beneficiaries = [...current, beneficiary];
  }

  Future<void> deleteBeneficiary(String id) async {
    await simulateLatency();
    final current = await fetchBeneficiaries();
    _beneficiaries = current.where((b) => b.id != id).toList();
  }

  /// Mock FX rate, OMR → target currency. Deterministic per country.
  double fxRateFor(String countryCode) {
    const rates = {'IN': 216.5, 'PH': 145.2, 'EG': 128.7, 'PK': 724.3};
    return rates[countryCode] ?? 100.0;
  }
}

@Riverpod(keepAlive: true)
RemittanceRepository remittanceRepository(Ref ref) => RemittanceRepository();
