// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'txn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Txn {

 String get id; TxnType get type; String get title; String get subtitle; Money get amount; Money get fee; TxnStatus get status; DateTime get date; String get referenceNo; int get rewardPointsEarned; Map<String, dynamic> get meta;
/// Create a copy of Txn
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TxnCopyWith<Txn> get copyWith => _$TxnCopyWithImpl<Txn>(this as Txn, _$identity);

  /// Serializes this Txn to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Txn&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.status, status) || other.status == status)&&(identical(other.date, date) || other.date == date)&&(identical(other.referenceNo, referenceNo) || other.referenceNo == referenceNo)&&(identical(other.rewardPointsEarned, rewardPointsEarned) || other.rewardPointsEarned == rewardPointsEarned)&&const DeepCollectionEquality().equals(other.meta, meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,subtitle,amount,fee,status,date,referenceNo,rewardPointsEarned,const DeepCollectionEquality().hash(meta));

@override
String toString() {
  return 'Txn(id: $id, type: $type, title: $title, subtitle: $subtitle, amount: $amount, fee: $fee, status: $status, date: $date, referenceNo: $referenceNo, rewardPointsEarned: $rewardPointsEarned, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $TxnCopyWith<$Res>  {
  factory $TxnCopyWith(Txn value, $Res Function(Txn) _then) = _$TxnCopyWithImpl;
@useResult
$Res call({
 String id, TxnType type, String title, String subtitle, Money amount, Money fee, TxnStatus status, DateTime date, String referenceNo, int rewardPointsEarned, Map<String, dynamic> meta
});


$MoneyCopyWith<$Res> get amount;$MoneyCopyWith<$Res> get fee;

}
/// @nodoc
class _$TxnCopyWithImpl<$Res>
    implements $TxnCopyWith<$Res> {
  _$TxnCopyWithImpl(this._self, this._then);

  final Txn _self;
  final $Res Function(Txn) _then;

/// Create a copy of Txn
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? subtitle = null,Object? amount = null,Object? fee = null,Object? status = null,Object? date = null,Object? referenceNo = null,Object? rewardPointsEarned = null,Object? meta = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TxnType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as Money,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TxnStatus,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,referenceNo: null == referenceNo ? _self.referenceNo : referenceNo // ignore: cast_nullable_to_non_nullable
as String,rewardPointsEarned: null == rewardPointsEarned ? _self.rewardPointsEarned : rewardPointsEarned // ignore: cast_nullable_to_non_nullable
as int,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}
/// Create a copy of Txn
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}/// Create a copy of Txn
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get fee {
  
  return $MoneyCopyWith<$Res>(_self.fee, (value) {
    return _then(_self.copyWith(fee: value));
  });
}
}


/// Adds pattern-matching-related methods to [Txn].
extension TxnPatterns on Txn {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Txn value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Txn() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Txn value)  $default,){
final _that = this;
switch (_that) {
case _Txn():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Txn value)?  $default,){
final _that = this;
switch (_that) {
case _Txn() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  TxnType type,  String title,  String subtitle,  Money amount,  Money fee,  TxnStatus status,  DateTime date,  String referenceNo,  int rewardPointsEarned,  Map<String, dynamic> meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Txn() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.subtitle,_that.amount,_that.fee,_that.status,_that.date,_that.referenceNo,_that.rewardPointsEarned,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  TxnType type,  String title,  String subtitle,  Money amount,  Money fee,  TxnStatus status,  DateTime date,  String referenceNo,  int rewardPointsEarned,  Map<String, dynamic> meta)  $default,) {final _that = this;
switch (_that) {
case _Txn():
return $default(_that.id,_that.type,_that.title,_that.subtitle,_that.amount,_that.fee,_that.status,_that.date,_that.referenceNo,_that.rewardPointsEarned,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  TxnType type,  String title,  String subtitle,  Money amount,  Money fee,  TxnStatus status,  DateTime date,  String referenceNo,  int rewardPointsEarned,  Map<String, dynamic> meta)?  $default,) {final _that = this;
switch (_that) {
case _Txn() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.subtitle,_that.amount,_that.fee,_that.status,_that.date,_that.referenceNo,_that.rewardPointsEarned,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Txn implements Txn {
  const _Txn({required this.id, required this.type, required this.title, required this.subtitle, required this.amount, required this.fee, required this.status, required this.date, required this.referenceNo, required this.rewardPointsEarned, final  Map<String, dynamic> meta = const <String, dynamic>{}}): _meta = meta;
  factory _Txn.fromJson(Map<String, dynamic> json) => _$TxnFromJson(json);

@override final  String id;
@override final  TxnType type;
@override final  String title;
@override final  String subtitle;
@override final  Money amount;
@override final  Money fee;
@override final  TxnStatus status;
@override final  DateTime date;
@override final  String referenceNo;
@override final  int rewardPointsEarned;
 final  Map<String, dynamic> _meta;
@override@JsonKey() Map<String, dynamic> get meta {
  if (_meta is EqualUnmodifiableMapView) return _meta;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_meta);
}


/// Create a copy of Txn
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TxnCopyWith<_Txn> get copyWith => __$TxnCopyWithImpl<_Txn>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TxnToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Txn&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.status, status) || other.status == status)&&(identical(other.date, date) || other.date == date)&&(identical(other.referenceNo, referenceNo) || other.referenceNo == referenceNo)&&(identical(other.rewardPointsEarned, rewardPointsEarned) || other.rewardPointsEarned == rewardPointsEarned)&&const DeepCollectionEquality().equals(other._meta, _meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,subtitle,amount,fee,status,date,referenceNo,rewardPointsEarned,const DeepCollectionEquality().hash(_meta));

@override
String toString() {
  return 'Txn(id: $id, type: $type, title: $title, subtitle: $subtitle, amount: $amount, fee: $fee, status: $status, date: $date, referenceNo: $referenceNo, rewardPointsEarned: $rewardPointsEarned, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$TxnCopyWith<$Res> implements $TxnCopyWith<$Res> {
  factory _$TxnCopyWith(_Txn value, $Res Function(_Txn) _then) = __$TxnCopyWithImpl;
@override @useResult
$Res call({
 String id, TxnType type, String title, String subtitle, Money amount, Money fee, TxnStatus status, DateTime date, String referenceNo, int rewardPointsEarned, Map<String, dynamic> meta
});


@override $MoneyCopyWith<$Res> get amount;@override $MoneyCopyWith<$Res> get fee;

}
/// @nodoc
class __$TxnCopyWithImpl<$Res>
    implements _$TxnCopyWith<$Res> {
  __$TxnCopyWithImpl(this._self, this._then);

  final _Txn _self;
  final $Res Function(_Txn) _then;

/// Create a copy of Txn
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? subtitle = null,Object? amount = null,Object? fee = null,Object? status = null,Object? date = null,Object? referenceNo = null,Object? rewardPointsEarned = null,Object? meta = null,}) {
  return _then(_Txn(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TxnType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as Money,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TxnStatus,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,referenceNo: null == referenceNo ? _self.referenceNo : referenceNo // ignore: cast_nullable_to_non_nullable
as String,rewardPointsEarned: null == rewardPointsEarned ? _self.rewardPointsEarned : rewardPointsEarned // ignore: cast_nullable_to_non_nullable
as int,meta: null == meta ? _self._meta : meta // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

/// Create a copy of Txn
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}/// Create a copy of Txn
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get fee {
  
  return $MoneyCopyWith<$Res>(_self.fee, (value) {
    return _then(_self.copyWith(fee: value));
  });
}
}

// dart format on
