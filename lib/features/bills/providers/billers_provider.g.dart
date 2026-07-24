// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// All fictional billers, grouped by category on-screen — product.md E1/E2.

@ProviderFor(Billers)
final billersProvider = BillersProvider._();

/// All fictional billers, grouped by category on-screen — product.md E1/E2.
final class BillersProvider
    extends $AsyncNotifierProvider<Billers, List<Biller>> {
  /// All fictional billers, grouped by category on-screen — product.md E1/E2.
  BillersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'billersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$billersHash();

  @$internal
  @override
  Billers create() => Billers();
}

String _$billersHash() => r'0a2ee6d7fb24f18541c704ddcc2c388eb5a0c858';

/// All fictional billers, grouped by category on-screen — product.md E1/E2.

abstract class _$Billers extends $AsyncNotifier<List<Biller>> {
  FutureOr<List<Biller>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Biller>>, List<Biller>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Biller>>, List<Biller>>,
              AsyncValue<List<Biller>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
