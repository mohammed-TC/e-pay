// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InsuranceQuote _$InsuranceQuoteFromJson(Map<String, dynamic> json) =>
    _InsuranceQuote(
      id: json['id'] as String,
      vehicleId: json['vehicleId'] as String,
      provider: json['provider'] as String,
      premium: Money.fromJson(json['premium'] as Map<String, dynamic>),
      coverageDetails: (json['coverageDetails'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$InsuranceQuoteToJson(_InsuranceQuote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'provider': instance.provider,
      'premium': instance.premium,
      'coverageDetails': instance.coverageDetails,
    };
