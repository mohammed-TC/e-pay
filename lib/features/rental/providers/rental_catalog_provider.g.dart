// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_catalog_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Rental pickup/drop-off points — product.md L1.

@ProviderFor(RentalLocations)
final rentalLocationsProvider = RentalLocationsProvider._();

/// Rental pickup/drop-off points — product.md L1.
final class RentalLocationsProvider
    extends $AsyncNotifierProvider<RentalLocations, List<RentalLocation>> {
  /// Rental pickup/drop-off points — product.md L1.
  RentalLocationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rentalLocationsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rentalLocationsHash();

  @$internal
  @override
  RentalLocations create() => RentalLocations();
}

String _$rentalLocationsHash() => r'55f5ceb41e9725a6fa03aba8f21f2d82c9176404';

/// Rental pickup/drop-off points — product.md L1.

abstract class _$RentalLocations extends $AsyncNotifier<List<RentalLocation>> {
  FutureOr<List<RentalLocation>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<RentalLocation>>, List<RentalLocation>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<RentalLocation>>,
                List<RentalLocation>
              >,
              AsyncValue<List<RentalLocation>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Rentable vehicle classes — product.md L2.

@ProviderFor(RentalVehicleClasses)
final rentalVehicleClassesProvider = RentalVehicleClassesProvider._();

/// Rentable vehicle classes — product.md L2.
final class RentalVehicleClassesProvider
    extends
        $AsyncNotifierProvider<RentalVehicleClasses, List<RentalVehicleClass>> {
  /// Rentable vehicle classes — product.md L2.
  RentalVehicleClassesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rentalVehicleClassesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rentalVehicleClassesHash();

  @$internal
  @override
  RentalVehicleClasses create() => RentalVehicleClasses();
}

String _$rentalVehicleClassesHash() =>
    r'0b695ce2d7453000fecb87a97fe2bdedf90397db';

/// Rentable vehicle classes — product.md L2.

abstract class _$RentalVehicleClasses
    extends $AsyncNotifier<List<RentalVehicleClass>> {
  FutureOr<List<RentalVehicleClass>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<RentalVehicleClass>>,
              List<RentalVehicleClass>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<RentalVehicleClass>>,
                List<RentalVehicleClass>
              >,
              AsyncValue<List<RentalVehicleClass>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Optional rental extras — product.md L3.

@ProviderFor(RentalAddons)
final rentalAddonsProvider = RentalAddonsProvider._();

/// Optional rental extras — product.md L3.
final class RentalAddonsProvider
    extends $AsyncNotifierProvider<RentalAddons, List<RentalAddon>> {
  /// Optional rental extras — product.md L3.
  RentalAddonsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rentalAddonsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rentalAddonsHash();

  @$internal
  @override
  RentalAddons create() => RentalAddons();
}

String _$rentalAddonsHash() => r'a39a51c4231a845398a24584fab3b492afd280c0';

/// Optional rental extras — product.md L3.

abstract class _$RentalAddons extends $AsyncNotifier<List<RentalAddon>> {
  FutureOr<List<RentalAddon>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<RentalAddon>>, List<RentalAddon>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<RentalAddon>>, List<RentalAddon>>,
              AsyncValue<List<RentalAddon>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
