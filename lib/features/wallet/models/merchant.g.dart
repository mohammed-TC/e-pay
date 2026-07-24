// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Merchant _$MerchantFromJson(Map<String, dynamic> json) => _Merchant(
  id: json['id'] as String,
  name: json['name'] as String,
  category: json['category'] as String,
  qrCode: json['qrCode'] as String,
  fixedAmount: json['fixedAmount'] == null
      ? null
      : Money.fromJson(json['fixedAmount'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MerchantToJson(_Merchant instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': instance.category,
  'qrCode': instance.qrCode,
  'fixedAmount': instance.fixedAmount,
};
