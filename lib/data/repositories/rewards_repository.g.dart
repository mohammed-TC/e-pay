// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(rewardsRepository)
final rewardsRepositoryProvider = RewardsRepositoryProvider._();

final class RewardsRepositoryProvider
    extends
        $FunctionalProvider<
          RewardsRepository,
          RewardsRepository,
          RewardsRepository
        >
    with $Provider<RewardsRepository> {
  RewardsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rewardsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rewardsRepositoryHash();

  @$internal
  @override
  $ProviderElement<RewardsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RewardsRepository create(Ref ref) {
    return rewardsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RewardsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RewardsRepository>(value),
    );
  }
}

String _$rewardsRepositoryHash() => r'd7b56b189065527298b2b72c452e59989fa8a2df';
