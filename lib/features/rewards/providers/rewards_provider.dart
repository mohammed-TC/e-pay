import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/rewards.dart';
import '../../../data/repositories/rewards_repository.dart';

part 'rewards_provider.g.dart';

/// Reward points — architecture.md §3 `rewardsProvider`. Incremented on
/// payment success.
@Riverpod(keepAlive: true)
class AppRewards extends _$AppRewards {
  @override
  Future<Rewards> build() => ref.read(rewardsRepositoryProvider).fetchRewards();

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () => ref.read(rewardsRepositoryProvider).fetchRewards(),
    );
  }
}
