// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_accounts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Saved biller accounts — product.md E3/E4. `add`/`delete` mutate the
/// repository's in-memory list then refresh, mirroring `MoneyRequests`
/// (`money_requests_provider.dart`).

@ProviderFor(SavedAccounts)
final savedAccountsProvider = SavedAccountsProvider._();

/// Saved biller accounts — product.md E3/E4. `add`/`delete` mutate the
/// repository's in-memory list then refresh, mirroring `MoneyRequests`
/// (`money_requests_provider.dart`).
final class SavedAccountsProvider
    extends $AsyncNotifierProvider<SavedAccounts, List<BillerAccount>> {
  /// Saved biller accounts — product.md E3/E4. `add`/`delete` mutate the
  /// repository's in-memory list then refresh, mirroring `MoneyRequests`
  /// (`money_requests_provider.dart`).
  SavedAccountsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedAccountsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedAccountsHash();

  @$internal
  @override
  SavedAccounts create() => SavedAccounts();
}

String _$savedAccountsHash() => r'8d25205661884cb6fd600166ea3c0bdc4ca601d2';

/// Saved biller accounts — product.md E3/E4. `add`/`delete` mutate the
/// repository's in-memory list then refresh, mirroring `MoneyRequests`
/// (`money_requests_provider.dart`).

abstract class _$SavedAccounts extends $AsyncNotifier<List<BillerAccount>> {
  FutureOr<List<BillerAccount>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<BillerAccount>>, List<BillerAccount>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<BillerAccount>>, List<BillerAccount>>,
              AsyncValue<List<BillerAccount>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
