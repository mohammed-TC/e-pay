// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Reward points — architecture.md §3 `rewardsProvider`. Incremented on
/// payment success.

@ProviderFor(AppRewards)
final appRewardsProvider = AppRewardsProvider._();

/// Reward points — architecture.md §3 `rewardsProvider`. Incremented on
/// payment success.
final class AppRewardsProvider
    extends $AsyncNotifierProvider<AppRewards, Rewards> {
  /// Reward points — architecture.md §3 `rewardsProvider`. Incremented on
  /// payment success.
  AppRewardsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRewardsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRewardsHash();

  @$internal
  @override
  AppRewards create() => AppRewards();
}

String _$appRewardsHash() => r'd577520f5678ad2cfbfa0325be89e63feba4384c';

/// Reward points — architecture.md §3 `rewardsProvider`. Incremented on
/// payment success.

abstract class _$AppRewards extends $AsyncNotifier<Rewards> {
  FutureOr<Rewards> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Rewards>, Rewards>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Rewards>, Rewards>,
              AsyncValue<Rewards>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
