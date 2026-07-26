// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RentalLocation _$RentalLocationFromJson(Map<String, dynamic> json) =>
    _RentalLocation(
      id: json['id'] as String,
      name: json['name'] as String,
      subtitle: json['subtitle'] as String,
      isAirport: json['isAirport'] as bool,
    );

Map<String, dynamic> _$RentalLocationToJson(_RentalLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subtitle': instance.subtitle,
      'isAirport': instance.isAirport,
    };
