// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RentalBooking _$RentalBookingFromJson(Map<String, dynamic> json) =>
    _RentalBooking(
      id: json['id'] as String,
      locationId: json['locationId'] as String,
      locationName: json['locationName'] as String,
      vehicleClassId: json['vehicleClassId'] as String,
      vehicleClassName: json['vehicleClassName'] as String,
      pickupDate: DateTime.parse(json['pickupDate'] as String),
      returnDate: DateTime.parse(json['returnDate'] as String),
      days: (json['days'] as num).toInt(),
      baseCost: Money.fromJson(json['baseCost'] as Map<String, dynamic>),
      addonNames: (json['addonNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      addonsCost: Money.fromJson(json['addonsCost'] as Map<String, dynamic>),
      pointsRedeemed: (json['pointsRedeemed'] as num).toInt(),
      pointsDiscount: Money.fromJson(
        json['pointsDiscount'] as Map<String, dynamic>,
      ),
      total: Money.fromJson(json['total'] as Map<String, dynamic>),
      pointsEarned: (json['pointsEarned'] as num).toInt(),
      bookedAt: DateTime.parse(json['bookedAt'] as String),
    );

Map<String, dynamic> _$RentalBookingToJson(_RentalBooking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locationId': instance.locationId,
      'locationName': instance.locationName,
      'vehicleClassId': instance.vehicleClassId,
      'vehicleClassName': instance.vehicleClassName,
      'pickupDate': instance.pickupDate.toIso8601String(),
      'returnDate': instance.returnDate.toIso8601String(),
      'days': instance.days,
      'baseCost': instance.baseCost,
      'addonNames': instance.addonNames,
      'addonsCost': instance.addonsCost,
      'pointsRedeemed': instance.pointsRedeemed,
      'pointsDiscount': instance.pointsDiscount,
      'total': instance.total,
      'pointsEarned': instance.pointsEarned,
      'bookedAt': instance.bookedAt.toIso8601String(),
    };
