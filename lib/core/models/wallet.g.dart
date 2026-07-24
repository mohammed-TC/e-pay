// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Wallet _$WalletFromJson(Map<String, dynamic> json) => _Wallet(
  balance: Money.fromJson(json['balance'] as Map<String, dynamic>),
  savedCards: (json['savedCards'] as List<dynamic>)
      .map((e) => SavedCard.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WalletToJson(_Wallet instance) => <String, dynamic>{
  'balance': instance.balance,
  'savedCards': instance.savedCards,
};
