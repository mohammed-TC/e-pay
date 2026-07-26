// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_addon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RentalAddon _$RentalAddonFromJson(Map<String, dynamic> json) => _RentalAddon(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  pricingBasis: $enumDecode(_$AddonPricingBasisEnumMap, json['pricingBasis']),
  price: Money.fromJson(json['price'] as Map<String, dynamic>),
  loyaltyMultiplier: (json['loyaltyMultiplier'] as num).toInt(),
);

Map<String, dynamic> _$RentalAddonToJson(_RentalAddon instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'pricingBasis': _$AddonPricingBasisEnumMap[instance.pricingBasis]!,
      'price': instance.price,
      'loyaltyMultiplier': instance.loyaltyMultiplier,
    };

const _$AddonPricingBasisEnumMap = {
  AddonPricingBasis.flat: 'flat',
  AddonPricingBasis.perDay: 'perDay',
};
