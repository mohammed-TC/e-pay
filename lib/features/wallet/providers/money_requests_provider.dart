import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/wallet_repository.dart';
import '../models/money_request.dart';

part 'money_requests_provider.g.dart';

/// Pending money requests — product.md C4. `respond`/`add` mutate the
/// repository's in-memory list then refresh, mirroring `AppWallet.refresh`.
@Riverpod(keepAlive: true)
class MoneyRequests extends _$MoneyRequests {
  @override
  Future<List<MoneyRequest>> build() =>
      ref.read(walletRepositoryProvider).fetchMoneyRequests();

  Future<void> respond(String id, RequestStatus status) async {
    await ref.read(walletRepositoryProvider).respondToRequest(id, status);
    state = await AsyncValue.guard(
      () => ref.read(walletRepositoryProvider).fetchMoneyRequests(),
    );
  }

  Future<void> add(MoneyRequest request) async {
    await ref.read(walletRepositoryProvider).addMoneyRequest(request);
    state = await AsyncValue.guard(
      () => ref.read(walletRepositoryProvider).fetchMoneyRequests(),
    );
  }
}
