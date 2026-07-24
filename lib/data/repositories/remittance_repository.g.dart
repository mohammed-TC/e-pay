// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remittance_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(remittanceRepository)
final remittanceRepositoryProvider = RemittanceRepositoryProvider._();

final class RemittanceRepositoryProvider
    extends
        $FunctionalProvider<
          RemittanceRepository,
          RemittanceRepository,
          RemittanceRepository
        >
    with $Provider<RemittanceRepository> {
  RemittanceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remittanceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remittanceRepositoryHash();

  @$internal
  @override
  $ProviderElement<RemittanceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RemittanceRepository create(Ref ref) {
    return remittanceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemittanceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemittanceRepository>(value),
    );
  }
}

String _$remittanceRepositoryHash() =>
    r'ca9a0c3ad6256eb87871ce5440187aa775ce051b';
