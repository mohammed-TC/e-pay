// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletContact _$WalletContactFromJson(Map<String, dynamic> json) =>
    _WalletContact(
      id: json['id'] as String,
      name: json['name'] as String,
      mobileNumber: json['mobileNumber'] as String,
      walletId: json['walletId'] as String,
      avatarInitial: json['avatarInitial'] as String,
    );

Map<String, dynamic> _$WalletContactToJson(_WalletContact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mobileNumber': instance.mobileNumber,
      'walletId': instance.walletId,
      'avatarInitial': instance.avatarInitial,
    };
