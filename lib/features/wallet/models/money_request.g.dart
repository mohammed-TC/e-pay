// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MoneyRequest _$MoneyRequestFromJson(Map<String, dynamic> json) =>
    _MoneyRequest(
      id: json['id'] as String,
      direction: $enumDecode(_$RequestDirectionEnumMap, json['direction']),
      counterpartyName: json['counterpartyName'] as String,
      counterpartyContactId: json['counterpartyContactId'] as String?,
      amount: Money.fromJson(json['amount'] as Map<String, dynamic>),
      note: json['note'] as String,
      status: $enumDecode(_$RequestStatusEnumMap, json['status']),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$MoneyRequestToJson(_MoneyRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'direction': _$RequestDirectionEnumMap[instance.direction]!,
      'counterpartyName': instance.counterpartyName,
      'counterpartyContactId': instance.counterpartyContactId,
      'amount': instance.amount,
      'note': instance.note,
      'status': _$RequestStatusEnumMap[instance.status]!,
      'date': instance.date.toIso8601String(),
    };

const _$RequestDirectionEnumMap = {
  RequestDirection.incoming: 'incoming',
  RequestDirection.outgoing: 'outgoing',
};

const _$RequestStatusEnumMap = {
  RequestStatus.pending: 'pending',
  RequestStatus.accepted: 'accepted',
  RequestStatus.declined: 'declined',
};
