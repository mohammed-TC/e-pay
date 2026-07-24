import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/txn.dart';
import '../../../data/repositories/history_repository.dart';

part 'transactions_provider.g.dart';

/// Transaction ledger — architecture.md §3 `transactionsProvider`. Appended
/// to by `PaymentService`; History screen watches this.
@Riverpod(keepAlive: true)
class AppTransactions extends _$AppTransactions {
  @override
  Future<List<Txn>> build() =>
      ref.read(historyRepositoryProvider).fetchTransactions();

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () => ref.read(historyRepositoryProvider).fetchTransactions(),
    );
  }
}
