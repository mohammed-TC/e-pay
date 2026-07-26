// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RentalLocation {

 String get id; String get name; String get subtitle; bool get isAirport;
/// Create a copy of RentalLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalLocationCopyWith<RentalLocation> get copyWith => _$RentalLocationCopyWithImpl<RentalLocation>(this as RentalLocation, _$identity);

  /// Serializes this RentalLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.isAirport, isAirport) || other.isAirport == isAirport));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,subtitle,isAirport);

@override
String toString() {
  return 'RentalLocation(id: $id, name: $name, subtitle: $subtitle, isAirport: $isAirport)';
}


}

/// @nodoc
abstract mixin class $RentalLocationCopyWith<$Res>  {
  factory $RentalLocationCopyWith(RentalLocation value, $Res Function(RentalLocation) _then) = _$RentalLocationCopyWithImpl;
@useResult
$Res call({
 String id, String name, String subtitle, bool isAirport
});




}
/// @nodoc
class _$RentalLocationCopyWithImpl<$Res>
    implements $RentalLocationCopyWith<$Res> {
  _$RentalLocationCopyWithImpl(this._self, this._then);

  final RentalLocation _self;
  final $Res Function(RentalLocation) _then;

/// Create a copy of RentalLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? subtitle = null,Object? isAirport = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,isAirport: null == isAirport ? _self.isAirport : isAirport // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RentalLocation].
extension RentalLocationPatterns on RentalLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalLocation value)  $default,){
final _that = this;
switch (_that) {
case _RentalLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalLocation value)?  $default,){
final _that = this;
switch (_that) {
case _RentalLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String subtitle,  bool isAirport)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalLocation() when $default != null:
return $default(_that.id,_that.name,_that.subtitle,_that.isAirport);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String subtitle,  bool isAirport)  $default,) {final _that = this;
switch (_that) {
case _RentalLocation():
return $default(_that.id,_that.name,_that.subtitle,_that.isAirport);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String subtitle,  bool isAirport)?  $default,) {final _that = this;
switch (_that) {
case _RentalLocation() when $default != null:
return $default(_that.id,_that.name,_that.subtitle,_that.isAirport);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalLocation implements RentalLocation {
  const _RentalLocation({required this.id, required this.name, required this.subtitle, required this.isAirport});
  factory _RentalLocation.fromJson(Map<String, dynamic> json) => _$RentalLocationFromJson(json);

@override final  String id;
@override final  String name;
@override final  String subtitle;
@override final  bool isAirport;

/// Create a copy of RentalLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalLocationCopyWith<_RentalLocation> get copyWith => __$RentalLocationCopyWithImpl<_RentalLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.isAirport, isAirport) || other.isAirport == isAirport));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,subtitle,isAirport);

@override
String toString() {
  return 'RentalLocation(id: $id, name: $name, subtitle: $subtitle, isAirport: $isAirport)';
}


}

/// @nodoc
abstract mixin class _$RentalLocationCopyWith<$Res> implements $RentalLocationCopyWith<$Res> {
  factory _$RentalLocationCopyWith(_RentalLocation value, $Res Function(_RentalLocation) _then) = __$RentalLocationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String subtitle, bool isAirport
});




}
/// @nodoc
class __$RentalLocationCopyWithImpl<$Res>
    implements _$RentalLocationCopyWith<$Res> {
  __$RentalLocationCopyWithImpl(this._self, this._then);

  final _RentalLocation _self;
  final $Res Function(_RentalLocation) _then;

/// Create a copy of RentalLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? subtitle = null,Object? isAirport = null,}) {
  return _then(_RentalLocation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,isAirport: null == isAirport ? _self.isAirport : isAirport // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
