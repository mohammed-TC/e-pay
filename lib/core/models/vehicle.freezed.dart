// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Vehicle {

 String get id; String get plateNumber; String get make; String get model; int get year; bool get insuranceValid; DateTime get registrationExpiry;
/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleCopyWith<Vehicle> get copyWith => _$VehicleCopyWithImpl<Vehicle>(this as Vehicle, _$identity);

  /// Serializes this Vehicle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vehicle&&(identical(other.id, id) || other.id == id)&&(identical(other.plateNumber, plateNumber) || other.plateNumber == plateNumber)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.insuranceValid, insuranceValid) || other.insuranceValid == insuranceValid)&&(identical(other.registrationExpiry, registrationExpiry) || other.registrationExpiry == registrationExpiry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,plateNumber,make,model,year,insuranceValid,registrationExpiry);

@override
String toString() {
  return 'Vehicle(id: $id, plateNumber: $plateNumber, make: $make, model: $model, year: $year, insuranceValid: $insuranceValid, registrationExpiry: $registrationExpiry)';
}


}

/// @nodoc
abstract mixin class $VehicleCopyWith<$Res>  {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) _then) = _$VehicleCopyWithImpl;
@useResult
$Res call({
 String id, String plateNumber, String make, String model, int year, bool insuranceValid, DateTime registrationExpiry
});




}
/// @nodoc
class _$VehicleCopyWithImpl<$Res>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._self, this._then);

  final Vehicle _self;
  final $Res Function(Vehicle) _then;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? plateNumber = null,Object? make = null,Object? model = null,Object? year = null,Object? insuranceValid = null,Object? registrationExpiry = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,plateNumber: null == plateNumber ? _self.plateNumber : plateNumber // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,insuranceValid: null == insuranceValid ? _self.insuranceValid : insuranceValid // ignore: cast_nullable_to_non_nullable
as bool,registrationExpiry: null == registrationExpiry ? _self.registrationExpiry : registrationExpiry // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Vehicle].
extension VehiclePatterns on Vehicle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vehicle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vehicle value)  $default,){
final _that = this;
switch (_that) {
case _Vehicle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vehicle value)?  $default,){
final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String plateNumber,  String make,  String model,  int year,  bool insuranceValid,  DateTime registrationExpiry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that.id,_that.plateNumber,_that.make,_that.model,_that.year,_that.insuranceValid,_that.registrationExpiry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String plateNumber,  String make,  String model,  int year,  bool insuranceValid,  DateTime registrationExpiry)  $default,) {final _that = this;
switch (_that) {
case _Vehicle():
return $default(_that.id,_that.plateNumber,_that.make,_that.model,_that.year,_that.insuranceValid,_that.registrationExpiry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String plateNumber,  String make,  String model,  int year,  bool insuranceValid,  DateTime registrationExpiry)?  $default,) {final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that.id,_that.plateNumber,_that.make,_that.model,_that.year,_that.insuranceValid,_that.registrationExpiry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Vehicle implements Vehicle {
  const _Vehicle({required this.id, required this.plateNumber, required this.make, required this.model, required this.year, required this.insuranceValid, required this.registrationExpiry});
  factory _Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);

@override final  String id;
@override final  String plateNumber;
@override final  String make;
@override final  String model;
@override final  int year;
@override final  bool insuranceValid;
@override final  DateTime registrationExpiry;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleCopyWith<_Vehicle> get copyWith => __$VehicleCopyWithImpl<_Vehicle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vehicle&&(identical(other.id, id) || other.id == id)&&(identical(other.plateNumber, plateNumber) || other.plateNumber == plateNumber)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.year, year) || other.year == year)&&(identical(other.insuranceValid, insuranceValid) || other.insuranceValid == insuranceValid)&&(identical(other.registrationExpiry, registrationExpiry) || other.registrationExpiry == registrationExpiry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,plateNumber,make,model,year,insuranceValid,registrationExpiry);

@override
String toString() {
  return 'Vehicle(id: $id, plateNumber: $plateNumber, make: $make, model: $model, year: $year, insuranceValid: $insuranceValid, registrationExpiry: $registrationExpiry)';
}


}

/// @nodoc
abstract mixin class _$VehicleCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$VehicleCopyWith(_Vehicle value, $Res Function(_Vehicle) _then) = __$VehicleCopyWithImpl;
@override @useResult
$Res call({
 String id, String plateNumber, String make, String model, int year, bool insuranceValid, DateTime registrationExpiry
});




}
/// @nodoc
class __$VehicleCopyWithImpl<$Res>
    implements _$VehicleCopyWith<$Res> {
  __$VehicleCopyWithImpl(this._self, this._then);

  final _Vehicle _self;
  final $Res Function(_Vehicle) _then;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? plateNumber = null,Object? make = null,Object? model = null,Object? year = null,Object? insuranceValid = null,Object? registrationExpiry = null,}) {
  return _then(_Vehicle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,plateNumber: null == plateNumber ? _self.plateNumber : plateNumber // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,insuranceValid: null == insuranceValid ? _self.insuranceValid : insuranceValid // ignore: cast_nullable_to_non_nullable
as bool,registrationExpiry: null == registrationExpiry ? _self.registrationExpiry : registrationExpiry // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
