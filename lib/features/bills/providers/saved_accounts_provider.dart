import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/biller_account.dart';
import '../../../data/repositories/bills_repository.dart';

part 'saved_accounts_provider.g.dart';

/// Saved biller accounts — product.md E3/E4. `add`/`delete` mutate the
/// repository's in-memory list then refresh, mirroring `MoneyRequests`
/// (`money_requests_provider.dart`).
@Riverpod(keepAlive: true)
class SavedAccounts extends _$SavedAccounts {
  @override
  Future<List<BillerAccount>> build() =>
      ref.read(billsRepositoryProvider).fetchAccounts();

  Future<void> add(BillerAccount account) async {
    await ref.read(billsRepositoryProvider).addAccount(account);
    state = await AsyncValue.guard(
      () => ref.read(billsRepositoryProvider).fetchAccounts(),
    );
  }

  Future<void> delete(String id) async {
    await ref.read(billsRepositoryProvider).deleteAccount(id);
    state = await AsyncValue.guard(
      () => ref.read(billsRepositoryProvider).fetchAccounts(),
    );
  }

  /// Enables AutoPay on a saved account — chat's "Ask Emral" proactive
  /// nudge (product.md K1) is the only entry point today.
  Future<void> setAutoPay(String id, {required bool enabled}) async {
    final current = state.value ?? const <BillerAccount>[];
    BillerAccount? match;
    for (final account in current) {
      if (account.id == id) {
        match = account;
        break;
      }
    }
    if (match == null) return;
    await ref
        .read(billsRepositoryProvider)
        .updateAccount(match.copyWith(autoPayEnabled: enabled));
    state = await AsyncValue.guard(
      () => ref.read(billsRepositoryProvider).fetchAccounts(),
    );
  }
}
