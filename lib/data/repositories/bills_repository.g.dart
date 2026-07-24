// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bills_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(billsRepository)
final billsRepositoryProvider = BillsRepositoryProvider._();

final class BillsRepositoryProvider
    extends
        $FunctionalProvider<BillsRepository, BillsRepository, BillsRepository>
    with $Provider<BillsRepository> {
  BillsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'billsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$billsRepositoryHash();

  @$internal
  @override
  $ProviderElement<BillsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BillsRepository create(Ref ref) {
    return billsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BillsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BillsRepository>(value),
    );
  }
}

String _$billsRepositoryHash() => r'cd8b61fa5c82562fa9be0c5be83af5259758460f';
