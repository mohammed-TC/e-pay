// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_vehicle_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RentalVehicleClass {

 String get id; String get name; String get iconKey; int get seats; String get transmission; int get bags; Money get perDay; String get mileagePolicy;
/// Create a copy of RentalVehicleClass
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalVehicleClassCopyWith<RentalVehicleClass> get copyWith => _$RentalVehicleClassCopyWithImpl<RentalVehicleClass>(this as RentalVehicleClass, _$identity);

  /// Serializes this RentalVehicleClass to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalVehicleClass&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconKey, iconKey) || other.iconKey == iconKey)&&(identical(other.seats, seats) || other.seats == seats)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.bags, bags) || other.bags == bags)&&(identical(other.perDay, perDay) || other.perDay == perDay)&&(identical(other.mileagePolicy, mileagePolicy) || other.mileagePolicy == mileagePolicy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,iconKey,seats,transmission,bags,perDay,mileagePolicy);

@override
String toString() {
  return 'RentalVehicleClass(id: $id, name: $name, iconKey: $iconKey, seats: $seats, transmission: $transmission, bags: $bags, perDay: $perDay, mileagePolicy: $mileagePolicy)';
}


}

/// @nodoc
abstract mixin class $RentalVehicleClassCopyWith<$Res>  {
  factory $RentalVehicleClassCopyWith(RentalVehicleClass value, $Res Function(RentalVehicleClass) _then) = _$RentalVehicleClassCopyWithImpl;
@useResult
$Res call({
 String id, String name, String iconKey, int seats, String transmission, int bags, Money perDay, String mileagePolicy
});


$MoneyCopyWith<$Res> get perDay;

}
/// @nodoc
class _$RentalVehicleClassCopyWithImpl<$Res>
    implements $RentalVehicleClassCopyWith<$Res> {
  _$RentalVehicleClassCopyWithImpl(this._self, this._then);

  final RentalVehicleClass _self;
  final $Res Function(RentalVehicleClass) _then;

/// Create a copy of RentalVehicleClass
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? iconKey = null,Object? seats = null,Object? transmission = null,Object? bags = null,Object? perDay = null,Object? mileagePolicy = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconKey: null == iconKey ? _self.iconKey : iconKey // ignore: cast_nullable_to_non_nullable
as String,seats: null == seats ? _self.seats : seats // ignore: cast_nullable_to_non_nullable
as int,transmission: null == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String,bags: null == bags ? _self.bags : bags // ignore: cast_nullable_to_non_nullable
as int,perDay: null == perDay ? _self.perDay : perDay // ignore: cast_nullable_to_non_nullable
as Money,mileagePolicy: null == mileagePolicy ? _self.mileagePolicy : mileagePolicy // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of RentalVehicleClass
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get perDay {
  
  return $MoneyCopyWith<$Res>(_self.perDay, (value) {
    return _then(_self.copyWith(perDay: value));
  });
}
}


/// Adds pattern-matching-related methods to [RentalVehicleClass].
extension RentalVehicleClassPatterns on RentalVehicleClass {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalVehicleClass value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalVehicleClass() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalVehicleClass value)  $default,){
final _that = this;
switch (_that) {
case _RentalVehicleClass():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalVehicleClass value)?  $default,){
final _that = this;
switch (_that) {
case _RentalVehicleClass() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String iconKey,  int seats,  String transmission,  int bags,  Money perDay,  String mileagePolicy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalVehicleClass() when $default != null:
return $default(_that.id,_that.name,_that.iconKey,_that.seats,_that.transmission,_that.bags,_that.perDay,_that.mileagePolicy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String iconKey,  int seats,  String transmission,  int bags,  Money perDay,  String mileagePolicy)  $default,) {final _that = this;
switch (_that) {
case _RentalVehicleClass():
return $default(_that.id,_that.name,_that.iconKey,_that.seats,_that.transmission,_that.bags,_that.perDay,_that.mileagePolicy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String iconKey,  int seats,  String transmission,  int bags,  Money perDay,  String mileagePolicy)?  $default,) {final _that = this;
switch (_that) {
case _RentalVehicleClass() when $default != null:
return $default(_that.id,_that.name,_that.iconKey,_that.seats,_that.transmission,_that.bags,_that.perDay,_that.mileagePolicy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalVehicleClass implements RentalVehicleClass {
  const _RentalVehicleClass({required this.id, required this.name, required this.iconKey, required this.seats, required this.transmission, required this.bags, required this.perDay, required this.mileagePolicy});
  factory _RentalVehicleClass.fromJson(Map<String, dynamic> json) => _$RentalVehicleClassFromJson(json);

@override final  String id;
@override final  String name;
@override final  String iconKey;
@override final  int seats;
@override final  String transmission;
@override final  int bags;
@override final  Money perDay;
@override final  String mileagePolicy;

/// Create a copy of RentalVehicleClass
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalVehicleClassCopyWith<_RentalVehicleClass> get copyWith => __$RentalVehicleClassCopyWithImpl<_RentalVehicleClass>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalVehicleClassToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalVehicleClass&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconKey, iconKey) || other.iconKey == iconKey)&&(identical(other.seats, seats) || other.seats == seats)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.bags, bags) || other.bags == bags)&&(identical(other.perDay, perDay) || other.perDay == perDay)&&(identical(other.mileagePolicy, mileagePolicy) || other.mileagePolicy == mileagePolicy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,iconKey,seats,transmission,bags,perDay,mileagePolicy);

@override
String toString() {
  return 'RentalVehicleClass(id: $id, name: $name, iconKey: $iconKey, seats: $seats, transmission: $transmission, bags: $bags, perDay: $perDay, mileagePolicy: $mileagePolicy)';
}


}

/// @nodoc
abstract mixin class _$RentalVehicleClassCopyWith<$Res> implements $RentalVehicleClassCopyWith<$Res> {
  factory _$RentalVehicleClassCopyWith(_RentalVehicleClass value, $Res Function(_RentalVehicleClass) _then) = __$RentalVehicleClassCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String iconKey, int seats, String transmission, int bags, Money perDay, String mileagePolicy
});


@override $MoneyCopyWith<$Res> get perDay;

}
/// @nodoc
class __$RentalVehicleClassCopyWithImpl<$Res>
    implements _$RentalVehicleClassCopyWith<$Res> {
  __$RentalVehicleClassCopyWithImpl(this._self, this._then);

  final _RentalVehicleClass _self;
  final $Res Function(_RentalVehicleClass) _then;

/// Create a copy of RentalVehicleClass
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? iconKey = null,Object? seats = null,Object? transmission = null,Object? bags = null,Object? perDay = null,Object? mileagePolicy = null,}) {
  return _then(_RentalVehicleClass(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconKey: null == iconKey ? _self.iconKey : iconKey // ignore: cast_nullable_to_non_nullable
as String,seats: null == seats ? _self.seats : seats // ignore: cast_nullable_to_non_nullable
as int,transmission: null == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String,bags: null == bags ? _self.bags : bags // ignore: cast_nullable_to_non_nullable
as int,perDay: null == perDay ? _self.perDay : perDay // ignore: cast_nullable_to_non_nullable
as Money,mileagePolicy: null == mileagePolicy ? _self.mileagePolicy : mileagePolicy // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of RentalVehicleClass
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get perDay {
  
  return $MoneyCopyWith<$Res>(_self.perDay, (value) {
    return _then(_self.copyWith(perDay: value));
  });
}
}

// dart format on
