// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gov_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(govRepository)
final govRepositoryProvider = GovRepositoryProvider._();

final class GovRepositoryProvider
    extends $FunctionalProvider<GovRepository, GovRepository, GovRepository>
    with $Provider<GovRepository> {
  GovRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'govRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$govRepositoryHash();

  @$internal
  @override
  $ProviderElement<GovRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GovRepository create(Ref ref) {
    return govRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GovRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GovRepository>(value),
    );
  }
}

String _$govRepositoryHash() => r'46fe9297a9993163b03218651cf121b047f48443';
