// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_requests_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Pending money requests — product.md C4. `respond`/`add` mutate the
/// repository's in-memory list then refresh, mirroring `AppWallet.refresh`.

@ProviderFor(MoneyRequests)
final moneyRequestsProvider = MoneyRequestsProvider._();

/// Pending money requests — product.md C4. `respond`/`add` mutate the
/// repository's in-memory list then refresh, mirroring `AppWallet.refresh`.
final class MoneyRequestsProvider
    extends $AsyncNotifierProvider<MoneyRequests, List<MoneyRequest>> {
  /// Pending money requests — product.md C4. `respond`/`add` mutate the
  /// repository's in-memory list then refresh, mirroring `AppWallet.refresh`.
  MoneyRequestsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moneyRequestsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moneyRequestsHash();

  @$internal
  @override
  MoneyRequests create() => MoneyRequests();
}

String _$moneyRequestsHash() => r'4b31ef52562f6af2e28fc1de193f4509fe9edef6';

/// Pending money requests — product.md C4. `respond`/`add` mutate the
/// repository's in-memory list then refresh, mirroring `AppWallet.refresh`.

abstract class _$MoneyRequests extends $AsyncNotifier<List<MoneyRequest>> {
  FutureOr<List<MoneyRequest>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<MoneyRequest>>, List<MoneyRequest>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<MoneyRequest>>, List<MoneyRequest>>,
              AsyncValue<List<MoneyRequest>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
