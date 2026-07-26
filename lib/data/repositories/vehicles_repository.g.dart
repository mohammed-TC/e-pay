// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(vehiclesRepository)
final vehiclesRepositoryProvider = VehiclesRepositoryProvider._();

final class VehiclesRepositoryProvider
    extends
        $FunctionalProvider<
          VehiclesRepository,
          VehiclesRepository,
          VehiclesRepository
        >
    with $Provider<VehiclesRepository> {
  VehiclesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vehiclesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vehiclesRepositoryHash();

  @$internal
  @override
  $ProviderElement<VehiclesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  VehiclesRepository create(Ref ref) {
    return vehiclesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VehiclesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VehiclesRepository>(value),
    );
  }
}

String _$vehiclesRepositoryHash() =>
    r'9c37ed5ff2ab1d9be186fbfdd504981b1077815a';
