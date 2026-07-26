// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biller_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BillerAccount _$BillerAccountFromJson(Map<String, dynamic> json) =>
    _BillerAccount(
      id: json['id'] as String,
      billerId: json['billerId'] as String,
      accountNumber: json['accountNumber'] as String,
      nickname: json['nickname'] as String,
      savedAt: DateTime.parse(json['savedAt'] as String),
      autoPayEnabled: json['autoPayEnabled'] as bool? ?? false,
    );

Map<String, dynamic> _$BillerAccountToJson(_BillerAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'billerId': instance.billerId,
      'accountNumber': instance.accountNumber,
      'nickname': instance.nickname,
      'savedAt': instance.savedAt.toIso8601String(),
      'autoPayEnabled': instance.autoPayEnabled,
    };
