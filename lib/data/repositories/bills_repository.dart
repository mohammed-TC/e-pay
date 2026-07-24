import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/models/bill.dart';
import '../../core/models/biller.dart';
import '../../core/models/biller_account.dart';
import '../../core/models/money.dart';
import '../../core/utils/mock_latency.dart';

part 'bills_repository.g.dart';

/// Billers + saved accounts + bill fetch — architecture.md §8, seeded from
/// `assets/mock/billers.json` + `accounts.json`. Bill amounts are not
/// seeded: [fetchBill] derives a deterministic pseudo-random amount keyed
/// by account number, so repeat fetches of the same account are stable.
class BillsRepository {
  List<Biller>? _billers;
  List<BillerAccount>? _accounts;

  Future<List<Biller>> fetchBillers() async {
    await simulateLatency();
    final cached = _billers;
    if (cached != null) return cached;
    final raw = await rootBundle.loadString('assets/mock/billers.json');
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => Biller.fromJson(e as Map<String, dynamic>))
        .toList();
    _billers = list;
    return list;
  }

  Future<List<BillerAccount>> fetchAccounts() async {
    await simulateLatency();
    final cached = _accounts;
    if (cached != null) return cached;
    final raw = await rootBundle.loadString('assets/mock/accounts.json');
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => BillerAccount.fromJson(e as Map<String, dynamic>))
        .toList();
    _accounts = list;
    return list;
  }

  Future<Bill> fetchBill(BillerAccount account) async {
    await simulateLatency();
    final seed = account.accountNumber.codeUnits.fold<int>(
      0,
      (sum, c) => sum + c,
    );
    final amount = 10 + (seed % 40) + (seed % 100) / 100;
    return Bill(
      billerAccountId: account.id,
      amountDue: Money.fromAmount(amount),
      dueDate: DateTime.now().add(const Duration(days: 14)),
      lineItems: [
        BillLineItem(
          label: 'Consumption charge',
          amount: Money.fromAmount(amount * 0.85),
        ),
        BillLineItem(label: 'VAT', amount: Money.fromAmount(amount * 0.15)),
      ],
    );
  }
}

@Riverpod(keepAlive: true)
BillsRepository billsRepository(Ref ref) => BillsRepository();
