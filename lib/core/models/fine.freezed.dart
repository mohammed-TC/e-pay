// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Fine {

 String get id; String get plateNumber; String get description; Money get amount; DateTime get issuedDate; String get location;
/// Create a copy of Fine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FineCopyWith<Fine> get copyWith => _$FineCopyWithImpl<Fine>(this as Fine, _$identity);

  /// Serializes this Fine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Fine&&(identical(other.id, id) || other.id == id)&&(identical(other.plateNumber, plateNumber) || other.plateNumber == plateNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.issuedDate, issuedDate) || other.issuedDate == issuedDate)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,plateNumber,description,amount,issuedDate,location);

@override
String toString() {
  return 'Fine(id: $id, plateNumber: $plateNumber, description: $description, amount: $amount, issuedDate: $issuedDate, location: $location)';
}


}

/// @nodoc
abstract mixin class $FineCopyWith<$Res>  {
  factory $FineCopyWith(Fine value, $Res Function(Fine) _then) = _$FineCopyWithImpl;
@useResult
$Res call({
 String id, String plateNumber, String description, Money amount, DateTime issuedDate, String location
});


$MoneyCopyWith<$Res> get amount;

}
/// @nodoc
class _$FineCopyWithImpl<$Res>
    implements $FineCopyWith<$Res> {
  _$FineCopyWithImpl(this._self, this._then);

  final Fine _self;
  final $Res Function(Fine) _then;

/// Create a copy of Fine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? plateNumber = null,Object? description = null,Object? amount = null,Object? issuedDate = null,Object? location = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,plateNumber: null == plateNumber ? _self.plateNumber : plateNumber // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,issuedDate: null == issuedDate ? _self.issuedDate : issuedDate // ignore: cast_nullable_to_non_nullable
as DateTime,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Fine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// Adds pattern-matching-related methods to [Fine].
extension FinePatterns on Fine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Fine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Fine value)  $default,){
final _that = this;
switch (_that) {
case _Fine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Fine value)?  $default,){
final _that = this;
switch (_that) {
case _Fine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String plateNumber,  String description,  Money amount,  DateTime issuedDate,  String location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fine() when $default != null:
return $default(_that.id,_that.plateNumber,_that.description,_that.amount,_that.issuedDate,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String plateNumber,  String description,  Money amount,  DateTime issuedDate,  String location)  $default,) {final _that = this;
switch (_that) {
case _Fine():
return $default(_that.id,_that.plateNumber,_that.description,_that.amount,_that.issuedDate,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String plateNumber,  String description,  Money amount,  DateTime issuedDate,  String location)?  $default,) {final _that = this;
switch (_that) {
case _Fine() when $default != null:
return $default(_that.id,_that.plateNumber,_that.description,_that.amount,_that.issuedDate,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Fine implements Fine {
  const _Fine({required this.id, required this.plateNumber, required this.description, required this.amount, required this.issuedDate, required this.location});
  factory _Fine.fromJson(Map<String, dynamic> json) => _$FineFromJson(json);

@override final  String id;
@override final  String plateNumber;
@override final  String description;
@override final  Money amount;
@override final  DateTime issuedDate;
@override final  String location;

/// Create a copy of Fine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FineCopyWith<_Fine> get copyWith => __$FineCopyWithImpl<_Fine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fine&&(identical(other.id, id) || other.id == id)&&(identical(other.plateNumber, plateNumber) || other.plateNumber == plateNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.issuedDate, issuedDate) || other.issuedDate == issuedDate)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,plateNumber,description,amount,issuedDate,location);

@override
String toString() {
  return 'Fine(id: $id, plateNumber: $plateNumber, description: $description, amount: $amount, issuedDate: $issuedDate, location: $location)';
}


}

/// @nodoc
abstract mixin class _$FineCopyWith<$Res> implements $FineCopyWith<$Res> {
  factory _$FineCopyWith(_Fine value, $Res Function(_Fine) _then) = __$FineCopyWithImpl;
@override @useResult
$Res call({
 String id, String plateNumber, String description, Money amount, DateTime issuedDate, String location
});


@override $MoneyCopyWith<$Res> get amount;

}
/// @nodoc
class __$FineCopyWithImpl<$Res>
    implements _$FineCopyWith<$Res> {
  __$FineCopyWithImpl(this._self, this._then);

  final _Fine _self;
  final $Res Function(_Fine) _then;

/// Create a copy of Fine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? plateNumber = null,Object? description = null,Object? amount = null,Object? issuedDate = null,Object? location = null,}) {
  return _then(_Fine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,plateNumber: null == plateNumber ? _self.plateNumber : plateNumber // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,issuedDate: null == issuedDate ? _self.issuedDate : issuedDate // ignore: cast_nullable_to_non_nullable
as DateTime,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Fine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}

// dart format on
