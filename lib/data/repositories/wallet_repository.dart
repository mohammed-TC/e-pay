import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/constants/demo_constants.dart';
import '../../core/models/money.dart';
import '../../core/models/saved_card.dart';
import '../../core/models/wallet.dart';
import '../../core/utils/mock_latency.dart';

part 'wallet_repository.g.dart';

/// In-memory wallet ledger + saved cards — architecture.md §8, cards
/// seeded from `assets/mock/cards.json`. Balance mutated only via
/// [debit]/[credit] (invariant enforced by `PaymentService`).
class WalletRepository {
  Money _balance = DemoConstants.seedWalletBalance;
  List<SavedCard>? _cards;

  Future<Wallet> fetchWallet() async {
    await simulateLatency();
    return Wallet(balance: _balance, savedCards: await _loadCards());
  }

  Future<List<SavedCard>> _loadCards() async {
    final cached = _cards;
    if (cached != null) return cached;
    final raw = await rootBundle.loadString('assets/mock/cards.json');
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => SavedCard.fromJson(e as Map<String, dynamic>))
        .toList();
    _cards = list;
    return list;
  }

  Money get balance => _balance;

  void debit(Money amount) => _balance -= amount;

  void credit(Money amount) => _balance += amount;
}

@Riverpod(keepAlive: true)
WalletRepository walletRepository(Ref ref) => WalletRepository();
