import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/constants/demo_constants.dart';
import '../../core/models/rewards.dart';
import '../../core/utils/mock_latency.dart';

part 'rewards_repository.g.dart';

/// In-memory reward points — architecture.md §8. No JSON asset: seed
/// values come from `DemoConstants` (CLAUDE.md "Demo constants").
class RewardsRepository {
  int _points = DemoConstants.seedRewardPoints;

  Future<Rewards> fetchRewards() async {
    await simulateLatency();
    return Rewards(
      points: _points,
      redemptionThreshold: DemoConstants.rewardRedemptionThreshold,
    );
  }

  void credit(int points) => _points += points;
}

@Riverpod(keepAlive: true)
RewardsRepository rewardsRepository(Ref ref) => RewardsRepository();
