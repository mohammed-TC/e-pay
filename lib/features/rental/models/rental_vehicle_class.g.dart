// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_vehicle_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RentalVehicleClass _$RentalVehicleClassFromJson(Map<String, dynamic> json) =>
    _RentalVehicleClass(
      id: json['id'] as String,
      name: json['name'] as String,
      iconKey: json['iconKey'] as String,
      seats: (json['seats'] as num).toInt(),
      transmission: json['transmission'] as String,
      bags: (json['bags'] as num).toInt(),
      perDay: Money.fromJson(json['perDay'] as Map<String, dynamic>),
      mileagePolicy: json['mileagePolicy'] as String,
    );

Map<String, dynamic> _$RentalVehicleClassToJson(_RentalVehicleClass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconKey': instance.iconKey,
      'seats': instance.seats,
      'transmission': instance.transmission,
      'bags': instance.bags,
      'perDay': instance.perDay,
      'mileagePolicy': instance.mileagePolicy,
    };
