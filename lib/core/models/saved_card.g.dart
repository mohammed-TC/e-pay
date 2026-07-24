// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedCard _$SavedCardFromJson(Map<String, dynamic> json) => _SavedCard(
  id: json['id'] as String,
  maskedNumber: json['maskedNumber'] as String,
  brand: json['brand'] as String,
  expiry: json['expiry'] as String,
  isDefault: json['isDefault'] as bool,
);

Map<String, dynamic> _$SavedCardToJson(_SavedCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'maskedNumber': instance.maskedNumber,
      'brand': instance.brand,
      'expiry': instance.expiry,
      'isDefault': instance.isDefault,
    };
