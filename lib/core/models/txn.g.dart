// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'txn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Txn _$TxnFromJson(Map<String, dynamic> json) => _Txn(
  id: json['id'] as String,
  type: $enumDecode(_$TxnTypeEnumMap, json['type']),
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  amount: Money.fromJson(json['amount'] as Map<String, dynamic>),
  fee: Money.fromJson(json['fee'] as Map<String, dynamic>),
  status: $enumDecode(_$TxnStatusEnumMap, json['status']),
  date: DateTime.parse(json['date'] as String),
  referenceNo: json['referenceNo'] as String,
  rewardPointsEarned: (json['rewardPointsEarned'] as num).toInt(),
  meta: json['meta'] as Map<String, dynamic>? ?? const <String, dynamic>{},
);

Map<String, dynamic> _$TxnToJson(_Txn instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$TxnTypeEnumMap[instance.type]!,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'amount': instance.amount,
  'fee': instance.fee,
  'status': _$TxnStatusEnumMap[instance.status]!,
  'date': instance.date.toIso8601String(),
  'referenceNo': instance.referenceNo,
  'rewardPointsEarned': instance.rewardPointsEarned,
  'meta': instance.meta,
};

const _$TxnTypeEnumMap = {
  TxnType.bill: 'bill',
  TxnType.prepaidRecharge: 'prepaidRecharge',
  TxnType.smartMeterRecharge: 'smartMeterRecharge',
  TxnType.trafficFine: 'trafficFine',
  TxnType.vehicleRenewal: 'vehicleRenewal',
  TxnType.judiciary: 'judiciary',
  TxnType.socialProtection: 'socialProtection',
  TxnType.insurance: 'insurance',
  TxnType.education: 'education',
  TxnType.walletTopup: 'walletTopup',
  TxnType.walletSend: 'walletSend',
  TxnType.walletRequest: 'walletRequest',
  TxnType.remittance: 'remittance',
  TxnType.qrPay: 'qrPay',
  TxnType.carRental: 'carRental',
};

const _$TxnStatusEnumMap = {
  TxnStatus.success: 'success',
  TxnStatus.pending: 'pending',
  TxnStatus.failed: 'failed',
};
