// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// L1 Rental Search state — product.md L1.

@ProviderFor(RentalSearch)
final rentalSearchProvider = RentalSearchProvider._();

/// L1 Rental Search state — product.md L1.
final class RentalSearchProvider
    extends $NotifierProvider<RentalSearch, RentalSearchParams> {
  /// L1 Rental Search state — product.md L1.
  RentalSearchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rentalSearchProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rentalSearchHash();

  @$internal
  @override
  RentalSearch create() => RentalSearch();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RentalSearchParams value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RentalSearchParams>(value),
    );
  }
}

String _$rentalSearchHash() => r'33e75755bd1c50b374ba707e8fa61b36dbdeb70a';

/// L1 Rental Search state — product.md L1.

abstract class _$RentalSearch extends $Notifier<RentalSearchParams> {
  RentalSearchParams build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<RentalSearchParams, RentalSearchParams>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RentalSearchParams, RentalSearchParams>,
              RentalSearchParams,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
