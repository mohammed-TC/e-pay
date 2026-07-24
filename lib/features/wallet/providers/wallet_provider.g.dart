// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Wallet balance + saved cards — architecture.md §3 `walletProvider`,
/// single source of truth for money.

@ProviderFor(AppWallet)
final appWalletProvider = AppWalletProvider._();

/// Wallet balance + saved cards — architecture.md §3 `walletProvider`,
/// single source of truth for money.
final class AppWalletProvider
    extends $AsyncNotifierProvider<AppWallet, Wallet> {
  /// Wallet balance + saved cards — architecture.md §3 `walletProvider`,
  /// single source of truth for money.
  AppWalletProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appWalletProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appWalletHash();

  @$internal
  @override
  AppWallet create() => AppWallet();
}

String _$appWalletHash() => r'd44f3082b1c4decdb1c026f9c46a4ec64956d005';

/// Wallet balance + saved cards — architecture.md §3 `walletProvider`,
/// single source of truth for money.

abstract class _$AppWallet extends $AsyncNotifier<Wallet> {
  FutureOr<Wallet> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Wallet>, Wallet>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Wallet>, Wallet>,
              AsyncValue<Wallet>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
