// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Institution _$InstitutionFromJson(Map<String, dynamic> json) => _Institution(
  id: json['id'] as String,
  name: json['name'] as String,
  type: $enumDecode(_$InstitutionTypeEnumMap, json['type']),
  students: (json['students'] as List<dynamic>)
      .map((e) => Student.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$InstitutionToJson(_Institution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$InstitutionTypeEnumMap[instance.type]!,
      'students': instance.students,
    };

const _$InstitutionTypeEnumMap = {
  InstitutionType.school: 'school',
  InstitutionType.university: 'university',
};
