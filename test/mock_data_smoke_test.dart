import 'package:epay/data/repositories/bills_repository.dart';
import 'package:epay/data/repositories/history_repository.dart';
import 'package:epay/data/repositories/rewards_repository.dart';
import 'package:epay/data/repositories/wallet_repository.dart';
import 'package:flutter_test/flutter_test.dart';

/// Phase 1 Definition of Done — docs/tasks.md: repos load, balance =
/// 250.000, history = 30 items (product.md §6).
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('mock data layer seeds correctly', () async {
    final wallet = await WalletRepository().fetchWallet();
    expect(wallet.balance.amount, 250.0);

    final txns = await HistoryRepository().fetchTransactions();
    expect(txns.length, 30);

    final rewards = await RewardsRepository().fetchRewards();
    expect(rewards.points, 320);

    final billsRepository = BillsRepository();
    final billers = await billsRepository.fetchBillers();
    expect(billers.length, 12);

    final accounts = await billsRepository.fetchAccounts();
    expect(accounts.length, 6);

    final plans = await billsRepository.fetchRechargePlans('b5');
    expect(plans.length, 3);

    final meterCharge = await billsRepository.fetchMeterCharge('MTR123456');
    expect(meterCharge.amountDue.amount, greaterThan(0));
  });
}
