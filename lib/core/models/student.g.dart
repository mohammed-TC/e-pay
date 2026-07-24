// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Student _$StudentFromJson(Map<String, dynamic> json) => _Student(
  id: json['id'] as String,
  institutionId: json['institutionId'] as String,
  name: json['name'] as String,
  outstandingFee: Money.fromJson(
    json['outstandingFee'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$StudentToJson(_Student instance) => <String, dynamic>{
  'id': instance.id,
  'institutionId': instance.institutionId,
  'name': instance.name,
  'outstandingFee': instance.outstandingFee,
};
