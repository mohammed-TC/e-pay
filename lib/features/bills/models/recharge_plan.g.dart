// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recharge_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RechargePlan _$RechargePlanFromJson(Map<String, dynamic> json) =>
    _RechargePlan(
      id: json['id'] as String,
      billerId: json['billerId'] as String,
      label: json['label'] as String,
      description: json['description'] as String,
      price: Money.fromJson(json['price'] as Map<String, dynamic>),
      isPopular: json['isPopular'] as bool,
    );

Map<String, dynamic> _$RechargePlanToJson(_RechargePlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'billerId': instance.billerId,
      'label': instance.label,
      'description': instance.description,
      'price': instance.price,
      'isPopular': instance.isPopular,
    };
