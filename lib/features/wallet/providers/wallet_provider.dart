import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/wallet.dart';
import '../../../data/repositories/wallet_repository.dart';

part 'wallet_provider.g.dart';

/// Wallet balance + saved cards — architecture.md §3 `walletProvider`,
/// single source of truth for money.
@Riverpod(keepAlive: true)
class AppWallet extends _$AppWallet {
  @override
  Future<Wallet> build() => ref.read(walletRepositoryProvider).fetchWallet();

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () => ref.read(walletRepositoryProvider).fetchWallet(),
    );
  }
}
