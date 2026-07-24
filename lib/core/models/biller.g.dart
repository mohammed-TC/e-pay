// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Biller _$BillerFromJson(Map<String, dynamic> json) => _Biller(
  id: json['id'] as String,
  name: json['name'] as String,
  category: $enumDecode(_$BillerCategoryEnumMap, json['category']),
  brandColorHex: json['brandColorHex'] as String,
);

Map<String, dynamic> _$BillerToJson(_Biller instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': _$BillerCategoryEnumMap[instance.category]!,
  'brandColorHex': instance.brandColorHex,
};

const _$BillerCategoryEnumMap = {
  BillerCategory.electricity: 'electricity',
  BillerCategory.water: 'water',
  BillerCategory.telecom: 'telecom',
  BillerCategory.internet: 'internet',
  BillerCategory.tvEntertainment: 'tvEntertainment',
};
