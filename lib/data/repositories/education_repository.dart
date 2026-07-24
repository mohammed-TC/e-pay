import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/models/institution.dart';
import '../../core/utils/mock_latency.dart';

part 'education_repository.g.dart';

/// Institutions + enrolled students — architecture.md §8, seeded from
/// `assets/mock/institutions.json`.
class EducationRepository {
  List<Institution>? _institutions;

  Future<List<Institution>> fetchInstitutions() async {
    await simulateLatency();
    final cached = _institutions;
    if (cached != null) return cached;
    final raw = await rootBundle.loadString('assets/mock/institutions.json');
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => Institution.fromJson(e as Map<String, dynamic>))
        .toList();
    _institutions = list;
    return list;
  }
}

@Riverpod(keepAlive: true)
EducationRepository educationRepository(Ref ref) => EducationRepository();
