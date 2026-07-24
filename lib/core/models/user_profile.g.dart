// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  id: json['id'] as String,
  fullName: json['fullName'] as String,
  mobileNumber: json['mobileNumber'] as String,
  email: json['email'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
    };
