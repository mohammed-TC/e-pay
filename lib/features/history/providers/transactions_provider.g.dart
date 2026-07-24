// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Transaction ledger — architecture.md §3 `transactionsProvider`. Appended
/// to by `PaymentService`; History screen watches this.

@ProviderFor(AppTransactions)
final appTransactionsProvider = AppTransactionsProvider._();

/// Transaction ledger — architecture.md §3 `transactionsProvider`. Appended
/// to by `PaymentService`; History screen watches this.
final class AppTransactionsProvider
    extends $AsyncNotifierProvider<AppTransactions, List<Txn>> {
  /// Transaction ledger — architecture.md §3 `transactionsProvider`. Appended
  /// to by `PaymentService`; History screen watches this.
  AppTransactionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appTransactionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appTransactionsHash();

  @$internal
  @override
  AppTransactions create() => AppTransactions();
}

String _$appTransactionsHash() => r'7a3dc2734bf9ade6331fa16d18e2e9845583a66a';

/// Transaction ledger — architecture.md §3 `transactionsProvider`. Appended
/// to by `PaymentService`; History screen watches this.

abstract class _$AppTransactions extends $AsyncNotifier<List<Txn>> {
  FutureOr<List<Txn>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Txn>>, List<Txn>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Txn>>, List<Txn>>,
              AsyncValue<List<Txn>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
