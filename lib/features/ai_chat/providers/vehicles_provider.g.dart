// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Registered vehicles — product.md F3. Only the chat proactive nudge
/// (K1) reads this today; the Vehicle Renewal screen itself is not yet
/// built (`Routes.govRenewal` is a placeholder).

@ProviderFor(Vehicles)
final vehiclesProvider = VehiclesProvider._();

/// Registered vehicles — product.md F3. Only the chat proactive nudge
/// (K1) reads this today; the Vehicle Renewal screen itself is not yet
/// built (`Routes.govRenewal` is a placeholder).
final class VehiclesProvider
    extends $AsyncNotifierProvider<Vehicles, List<Vehicle>> {
  /// Registered vehicles — product.md F3. Only the chat proactive nudge
  /// (K1) reads this today; the Vehicle Renewal screen itself is not yet
  /// built (`Routes.govRenewal` is a placeholder).
  VehiclesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vehiclesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vehiclesHash();

  @$internal
  @override
  Vehicles create() => Vehicles();
}

String _$vehiclesHash() => r'63b93f5fb887a7b9be651ca30713790ff8e4b0dd';

/// Registered vehicles — product.md F3. Only the chat proactive nudge
/// (K1) reads this today; the Vehicle Renewal screen itself is not yet
/// built (`Routes.govRenewal` is a placeholder).

abstract class _$Vehicles extends $AsyncNotifier<List<Vehicle>> {
  FutureOr<List<Vehicle>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Vehicle>>, List<Vehicle>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Vehicle>>, List<Vehicle>>,
              AsyncValue<List<Vehicle>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
