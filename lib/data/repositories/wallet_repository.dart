import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/constants/demo_constants.dart';
import '../../core/models/money.dart';
import '../../core/models/saved_card.dart';
import '../../core/models/wallet.dart';
import '../../core/utils/mock_latency.dart';
import '../../features/wallet/models/merchant.dart';
import '../../features/wallet/models/money_request.dart';
import '../../features/wallet/models/wallet_contact.dart';

part 'wallet_repository.g.dart';

/// In-memory wallet ledger + saved cards — architecture.md §8, cards
/// seeded from `assets/mock/cards.json`. Balance mutated only via
/// [debit]/[credit] (invariant enforced by `PaymentService`). Also owns the
/// rest of Module C's mock data: contacts (C3/C4), money requests (C4), and
/// QR merchants (C5) — all still Wallet-domain, so one repository per
/// architecture.md §2's "one per domain" convention.
class WalletRepository {
  Money _balance = DemoConstants.seedWalletBalance;
  List<SavedCard>? _cards;
  List<WalletContact>? _contacts;
  List<MoneyRequest>? _moneyRequests;
  List<Merchant>? _merchants;

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

  Future<List<WalletContact>> fetchContacts() async {
    await simulateLatency();
    final cached = _contacts;
    if (cached != null) return cached;
    final raw = await rootBundle.loadString('assets/mock/contacts.json');
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => WalletContact.fromJson(e as Map<String, dynamic>))
        .toList();
    _contacts = list;
    return list;
  }

  Future<List<MoneyRequest>> fetchMoneyRequests() async {
    await simulateLatency();
    final cached = _moneyRequests;
    if (cached != null) return cached;
    final raw = await rootBundle.loadString(
      'assets/mock/money_requests.json',
    );
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => MoneyRequest.fromJson(e as Map<String, dynamic>))
        .toList();
    _moneyRequests = list;
    return list;
  }

  /// Mutates the cached in-memory list — mirrors `HistoryRepository.append`'s
  /// "session feels live" mock-mutation pattern.
  Future<void> respondToRequest(String id, RequestStatus status) async {
    final current = await fetchMoneyRequests();
    _moneyRequests = [
      for (final request in current)
        if (request.id == id) request.copyWith(status: status) else request,
    ];
  }

  Future<void> addMoneyRequest(MoneyRequest request) async {
    final current = await fetchMoneyRequests();
    _moneyRequests = [request, ...current];
  }

  Future<Merchant?> lookupMerchant(String code) async {
    await simulateLatency();
    final cached = _merchants;
    final list = cached ?? await _loadMerchants();
    for (final merchant in list) {
      if (merchant.qrCode == code) return merchant;
    }
    return null;
  }

  Future<List<Merchant>> _loadMerchants() async {
    final raw = await rootBundle.loadString('assets/mock/merchants.json');
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => Merchant.fromJson(e as Map<String, dynamic>))
        .toList();
    _merchants = list;
    return list;
  }
}

@Riverpod(keepAlive: true)
WalletRepository walletRepository(Ref ref) => WalletRepository();
