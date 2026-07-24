// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Fine _$FineFromJson(Map<String, dynamic> json) => _Fine(
  id: json['id'] as String,
  plateNumber: json['plateNumber'] as String,
  description: json['description'] as String,
  amount: Money.fromJson(json['amount'] as Map<String, dynamic>),
  issuedDate: DateTime.parse(json['issuedDate'] as String),
  location: json['location'] as String,
);

Map<String, dynamic> _$FineToJson(_Fine instance) => <String, dynamic>{
  'id': instance.id,
  'plateNumber': instance.plateNumber,
  'description': instance.description,
  'amount': instance.amount,
  'issuedDate': instance.issuedDate.toIso8601String(),
  'location': instance.location,
};
