// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_addon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RentalAddon {

 String get id; String get name; String get description; AddonPricingBasis get pricingBasis; Money get price; int get loyaltyMultiplier;
/// Create a copy of RentalAddon
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalAddonCopyWith<RentalAddon> get copyWith => _$RentalAddonCopyWithImpl<RentalAddon>(this as RentalAddon, _$identity);

  /// Serializes this RentalAddon to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalAddon&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.pricingBasis, pricingBasis) || other.pricingBasis == pricingBasis)&&(identical(other.price, price) || other.price == price)&&(identical(other.loyaltyMultiplier, loyaltyMultiplier) || other.loyaltyMultiplier == loyaltyMultiplier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,pricingBasis,price,loyaltyMultiplier);

@override
String toString() {
  return 'RentalAddon(id: $id, name: $name, description: $description, pricingBasis: $pricingBasis, price: $price, loyaltyMultiplier: $loyaltyMultiplier)';
}


}

/// @nodoc
abstract mixin class $RentalAddonCopyWith<$Res>  {
  factory $RentalAddonCopyWith(RentalAddon value, $Res Function(RentalAddon) _then) = _$RentalAddonCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, AddonPricingBasis pricingBasis, Money price, int loyaltyMultiplier
});


$MoneyCopyWith<$Res> get price;

}
/// @nodoc
class _$RentalAddonCopyWithImpl<$Res>
    implements $RentalAddonCopyWith<$Res> {
  _$RentalAddonCopyWithImpl(this._self, this._then);

  final RentalAddon _self;
  final $Res Function(RentalAddon) _then;

/// Create a copy of RentalAddon
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? pricingBasis = null,Object? price = null,Object? loyaltyMultiplier = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,pricingBasis: null == pricingBasis ? _self.pricingBasis : pricingBasis // ignore: cast_nullable_to_non_nullable
as AddonPricingBasis,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,loyaltyMultiplier: null == loyaltyMultiplier ? _self.loyaltyMultiplier : loyaltyMultiplier // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RentalAddon
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}


/// Adds pattern-matching-related methods to [RentalAddon].
extension RentalAddonPatterns on RentalAddon {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalAddon value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalAddon() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalAddon value)  $default,){
final _that = this;
switch (_that) {
case _RentalAddon():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalAddon value)?  $default,){
final _that = this;
switch (_that) {
case _RentalAddon() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  AddonPricingBasis pricingBasis,  Money price,  int loyaltyMultiplier)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalAddon() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.pricingBasis,_that.price,_that.loyaltyMultiplier);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  AddonPricingBasis pricingBasis,  Money price,  int loyaltyMultiplier)  $default,) {final _that = this;
switch (_that) {
case _RentalAddon():
return $default(_that.id,_that.name,_that.description,_that.pricingBasis,_that.price,_that.loyaltyMultiplier);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  AddonPricingBasis pricingBasis,  Money price,  int loyaltyMultiplier)?  $default,) {final _that = this;
switch (_that) {
case _RentalAddon() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.pricingBasis,_that.price,_that.loyaltyMultiplier);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalAddon implements RentalAddon {
  const _RentalAddon({required this.id, required this.name, required this.description, required this.pricingBasis, required this.price, required this.loyaltyMultiplier});
  factory _RentalAddon.fromJson(Map<String, dynamic> json) => _$RentalAddonFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  AddonPricingBasis pricingBasis;
@override final  Money price;
@override final  int loyaltyMultiplier;

/// Create a copy of RentalAddon
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalAddonCopyWith<_RentalAddon> get copyWith => __$RentalAddonCopyWithImpl<_RentalAddon>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalAddonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalAddon&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.pricingBasis, pricingBasis) || other.pricingBasis == pricingBasis)&&(identical(other.price, price) || other.price == price)&&(identical(other.loyaltyMultiplier, loyaltyMultiplier) || other.loyaltyMultiplier == loyaltyMultiplier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,pricingBasis,price,loyaltyMultiplier);

@override
String toString() {
  return 'RentalAddon(id: $id, name: $name, description: $description, pricingBasis: $pricingBasis, price: $price, loyaltyMultiplier: $loyaltyMultiplier)';
}


}

/// @nodoc
abstract mixin class _$RentalAddonCopyWith<$Res> implements $RentalAddonCopyWith<$Res> {
  factory _$RentalAddonCopyWith(_RentalAddon value, $Res Function(_RentalAddon) _then) = __$RentalAddonCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, AddonPricingBasis pricingBasis, Money price, int loyaltyMultiplier
});


@override $MoneyCopyWith<$Res> get price;

}
/// @nodoc
class __$RentalAddonCopyWithImpl<$Res>
    implements _$RentalAddonCopyWith<$Res> {
  __$RentalAddonCopyWithImpl(this._self, this._then);

  final _RentalAddon _self;
  final $Res Function(_RentalAddon) _then;

/// Create a copy of RentalAddon
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? pricingBasis = null,Object? price = null,Object? loyaltyMultiplier = null,}) {
  return _then(_RentalAddon(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,pricingBasis: null == pricingBasis ? _self.pricingBasis : pricingBasis // ignore: cast_nullable_to_non_nullable
as AddonPricingBasis,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,loyaltyMultiplier: null == loyaltyMultiplier ? _self.loyaltyMultiplier : loyaltyMultiplier // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RentalAddon
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}

// dart format on
