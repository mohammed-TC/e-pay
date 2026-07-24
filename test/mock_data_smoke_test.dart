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

    final billers = await BillsRepository().fetchBillers();
    expect(billers.length, 12);
  });
}
