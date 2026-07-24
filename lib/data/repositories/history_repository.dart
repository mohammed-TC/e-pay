import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/models/txn.dart';
import '../../core/utils/mock_latency.dart';

part 'history_repository.g.dart';

/// Transaction ledger — architecture.md §8, seeded from
/// `assets/mock/transactions.json`. Appended only by `PaymentService`
/// (architecture.md §3 invariant).
class HistoryRepository {
  List<Txn>? _txns;

  Future<List<Txn>> fetchTransactions() async {
    await simulateLatency();
    final cached = _txns;
    if (cached != null) return cached;
    final raw = await rootBundle.loadString('assets/mock/transactions.json');
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => Txn.fromJson(e as Map<String, dynamic>))
        .toList();
    _txns = list;
    return list;
  }

  Future<void> append(Txn txn) async {
    final current = await fetchTransactions();
    _txns = [txn, ...current];
  }
}

@Riverpod(keepAlive: true)
HistoryRepository historyRepository(Ref ref) => HistoryRepository();
