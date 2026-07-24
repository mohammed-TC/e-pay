// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BillLineItem _$BillLineItemFromJson(Map<String, dynamic> json) =>
    _BillLineItem(
      label: json['label'] as String,
      amount: Money.fromJson(json['amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BillLineItemToJson(_BillLineItem instance) =>
    <String, dynamic>{'label': instance.label, 'amount': instance.amount};

_Bill _$BillFromJson(Map<String, dynamic> json) => _Bill(
  billerAccountId: json['billerAccountId'] as String,
  amountDue: Money.fromJson(json['amountDue'] as Map<String, dynamic>),
  dueDate: DateTime.parse(json['dueDate'] as String),
  lineItems: (json['lineItems'] as List<dynamic>)
      .map((e) => BillLineItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BillToJson(_Bill instance) => <String, dynamic>{
  'billerAccountId': instance.billerAccountId,
  'amountDue': instance.amountDue,
  'dueDate': instance.dueDate.toIso8601String(),
  'lineItems': instance.lineItems,
};
