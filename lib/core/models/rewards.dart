import 'package:freezed_annotation/freezed_annotation.dart';

part 'rewards.freezed.dart';
part 'rewards.g.dart';

/// Reward points state — product.md I1/I2.
@freezed
abstract class Rewards with _$Rewards {
  const factory Rewards({
    required int points,
    required int redemptionThreshold,
  }) = _Rewards;

  factory Rewards.fromJson(Map<String, dynamic> json) =>
      _$RewardsFromJson(json);
}
