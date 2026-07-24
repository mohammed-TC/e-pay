// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Rewards _$RewardsFromJson(Map<String, dynamic> json) => _Rewards(
  points: (json['points'] as num).toInt(),
  redemptionThreshold: (json['redemptionThreshold'] as num).toInt(),
);

Map<String, dynamic> _$RewardsToJson(_Rewards instance) => <String, dynamic>{
  'points': instance.points,
  'redemptionThreshold': instance.redemptionThreshold,
};
