// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(rentalRepository)
final rentalRepositoryProvider = RentalRepositoryProvider._();

final class RentalRepositoryProvider
    extends
        $FunctionalProvider<
          RentalRepository,
          RentalRepository,
          RentalRepository
        >
    with $Provider<RentalRepository> {
  RentalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rentalRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rentalRepositoryHash();

  @$internal
  @override
  $ProviderElement<RentalRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RentalRepository create(Ref ref) {
    return rentalRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RentalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RentalRepository>(value),
    );
  }
}

String _$rentalRepositoryHash() => r'9302e0a0cf7f58256898b33bc684982a11edce3b';
