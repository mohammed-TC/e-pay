// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Vehicle _$VehicleFromJson(Map<String, dynamic> json) => _Vehicle(
  id: json['id'] as String,
  plateNumber: json['plateNumber'] as String,
  make: json['make'] as String,
  model: json['model'] as String,
  year: (json['year'] as num).toInt(),
  insuranceValid: json['insuranceValid'] as bool,
  registrationExpiry: DateTime.parse(json['registrationExpiry'] as String),
);

Map<String, dynamic> _$VehicleToJson(_Vehicle instance) => <String, dynamic>{
  'id': instance.id,
  'plateNumber': instance.plateNumber,
  'make': instance.make,
  'model': instance.model,
  'year': instance.year,
  'insuranceValid': instance.insuranceValid,
  'registrationExpiry': instance.registrationExpiry.toIso8601String(),
};
