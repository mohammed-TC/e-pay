// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Beneficiary _$BeneficiaryFromJson(Map<String, dynamic> json) => _Beneficiary(
  id: json['id'] as String,
  name: json['name'] as String,
  bankName: json['bankName'] as String,
  accountNumber: json['accountNumber'] as String,
  countryCode: json['countryCode'] as String,
  relationship: json['relationship'] as String,
  purpose: json['purpose'] as String,
);

Map<String, dynamic> _$BeneficiaryToJson(_Beneficiary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bankName': instance.bankName,
      'accountNumber': instance.accountNumber,
      'countryCode': instance.countryCode,
      'relationship': instance.relationship,
      'purpose': instance.purpose,
    };
