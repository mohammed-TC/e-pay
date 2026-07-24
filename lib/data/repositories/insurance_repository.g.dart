// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(insuranceRepository)
final insuranceRepositoryProvider = InsuranceRepositoryProvider._();

final class InsuranceRepositoryProvider
    extends
        $FunctionalProvider<
          InsuranceRepository,
          InsuranceRepository,
          InsuranceRepository
        >
    with $Provider<InsuranceRepository> {
  InsuranceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'insuranceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$insuranceRepositoryHash();

  @$internal
  @override
  $ProviderElement<InsuranceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InsuranceRepository create(Ref ref) {
    return insuranceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InsuranceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InsuranceRepository>(value),
    );
  }
}

String _$insuranceRepositoryHash() =>
    r'd9ecfdaae9295dc4c4044543ae3a454e4680a338';
