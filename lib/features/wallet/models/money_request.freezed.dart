// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'money_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoneyRequest {

 String get id; RequestDirection get direction; String get counterpartyName; String? get counterpartyContactId; Money get amount; String get note; RequestStatus get status; DateTime get date;
/// Create a copy of MoneyRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoneyRequestCopyWith<MoneyRequest> get copyWith => _$MoneyRequestCopyWithImpl<MoneyRequest>(this as MoneyRequest, _$identity);

  /// Serializes this MoneyRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.counterpartyName, counterpartyName) || other.counterpartyName == counterpartyName)&&(identical(other.counterpartyContactId, counterpartyContactId) || other.counterpartyContactId == counterpartyContactId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.note, note) || other.note == note)&&(identical(other.status, status) || other.status == status)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,direction,counterpartyName,counterpartyContactId,amount,note,status,date);

@override
String toString() {
  return 'MoneyRequest(id: $id, direction: $direction, counterpartyName: $counterpartyName, counterpartyContactId: $counterpartyContactId, amount: $amount, note: $note, status: $status, date: $date)';
}


}

/// @nodoc
abstract mixin class $MoneyRequestCopyWith<$Res>  {
  factory $MoneyRequestCopyWith(MoneyRequest value, $Res Function(MoneyRequest) _then) = _$MoneyRequestCopyWithImpl;
@useResult
$Res call({
 String id, RequestDirection direction, String counterpartyName, String? counterpartyContactId, Money amount, String note, RequestStatus status, DateTime date
});


$MoneyCopyWith<$Res> get amount;

}
/// @nodoc
class _$MoneyRequestCopyWithImpl<$Res>
    implements $MoneyRequestCopyWith<$Res> {
  _$MoneyRequestCopyWithImpl(this._self, this._then);

  final MoneyRequest _self;
  final $Res Function(MoneyRequest) _then;

/// Create a copy of MoneyRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? direction = null,Object? counterpartyName = null,Object? counterpartyContactId = freezed,Object? amount = null,Object? note = null,Object? status = null,Object? date = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as RequestDirection,counterpartyName: null == counterpartyName ? _self.counterpartyName : counterpartyName // ignore: cast_nullable_to_non_nullable
as String,counterpartyContactId: freezed == counterpartyContactId ? _self.counterpartyContactId : counterpartyContactId // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequestStatus,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of MoneyRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// Adds pattern-matching-related methods to [MoneyRequest].
extension MoneyRequestPatterns on MoneyRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoneyRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoneyRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoneyRequest value)  $default,){
final _that = this;
switch (_that) {
case _MoneyRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoneyRequest value)?  $default,){
final _that = this;
switch (_that) {
case _MoneyRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  RequestDirection direction,  String counterpartyName,  String? counterpartyContactId,  Money amount,  String note,  RequestStatus status,  DateTime date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoneyRequest() when $default != null:
return $default(_that.id,_that.direction,_that.counterpartyName,_that.counterpartyContactId,_that.amount,_that.note,_that.status,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  RequestDirection direction,  String counterpartyName,  String? counterpartyContactId,  Money amount,  String note,  RequestStatus status,  DateTime date)  $default,) {final _that = this;
switch (_that) {
case _MoneyRequest():
return $default(_that.id,_that.direction,_that.counterpartyName,_that.counterpartyContactId,_that.amount,_that.note,_that.status,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  RequestDirection direction,  String counterpartyName,  String? counterpartyContactId,  Money amount,  String note,  RequestStatus status,  DateTime date)?  $default,) {final _that = this;
switch (_that) {
case _MoneyRequest() when $default != null:
return $default(_that.id,_that.direction,_that.counterpartyName,_that.counterpartyContactId,_that.amount,_that.note,_that.status,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MoneyRequest implements MoneyRequest {
  const _MoneyRequest({required this.id, required this.direction, required this.counterpartyName, required this.counterpartyContactId, required this.amount, required this.note, required this.status, required this.date});
  factory _MoneyRequest.fromJson(Map<String, dynamic> json) => _$MoneyRequestFromJson(json);

@override final  String id;
@override final  RequestDirection direction;
@override final  String counterpartyName;
@override final  String? counterpartyContactId;
@override final  Money amount;
@override final  String note;
@override final  RequestStatus status;
@override final  DateTime date;

/// Create a copy of MoneyRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoneyRequestCopyWith<_MoneyRequest> get copyWith => __$MoneyRequestCopyWithImpl<_MoneyRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoneyRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoneyRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.counterpartyName, counterpartyName) || other.counterpartyName == counterpartyName)&&(identical(other.counterpartyContactId, counterpartyContactId) || other.counterpartyContactId == counterpartyContactId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.note, note) || other.note == note)&&(identical(other.status, status) || other.status == status)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,direction,counterpartyName,counterpartyContactId,amount,note,status,date);

@override
String toString() {
  return 'MoneyRequest(id: $id, direction: $direction, counterpartyName: $counterpartyName, counterpartyContactId: $counterpartyContactId, amount: $amount, note: $note, status: $status, date: $date)';
}


}

/// @nodoc
abstract mixin class _$MoneyRequestCopyWith<$Res> implements $MoneyRequestCopyWith<$Res> {
  factory _$MoneyRequestCopyWith(_MoneyRequest value, $Res Function(_MoneyRequest) _then) = __$MoneyRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, RequestDirection direction, String counterpartyName, String? counterpartyContactId, Money amount, String note, RequestStatus status, DateTime date
});


@override $MoneyCopyWith<$Res> get amount;

}
/// @nodoc
class __$MoneyRequestCopyWithImpl<$Res>
    implements _$MoneyRequestCopyWith<$Res> {
  __$MoneyRequestCopyWithImpl(this._self, this._then);

  final _MoneyRequest _self;
  final $Res Function(_MoneyRequest) _then;

/// Create a copy of MoneyRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? direction = null,Object? counterpartyName = null,Object? counterpartyContactId = freezed,Object? amount = null,Object? note = null,Object? status = null,Object? date = null,}) {
  return _then(_MoneyRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as RequestDirection,counterpartyName: null == counterpartyName ? _self.counterpartyName : counterpartyName // ignore: cast_nullable_to_non_nullable
as String,counterpartyContactId: freezed == counterpartyContactId ? _self.counterpartyContactId : counterpartyContactId // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequestStatus,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of MoneyRequest
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
