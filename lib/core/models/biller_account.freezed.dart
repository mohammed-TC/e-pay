// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biller_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BillerAccount {

 String get id; String get billerId; String get accountNumber; String get nickname; DateTime get savedAt;
/// Create a copy of BillerAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillerAccountCopyWith<BillerAccount> get copyWith => _$BillerAccountCopyWithImpl<BillerAccount>(this as BillerAccount, _$identity);

  /// Serializes this BillerAccount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillerAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.billerId, billerId) || other.billerId == billerId)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,billerId,accountNumber,nickname,savedAt);

@override
String toString() {
  return 'BillerAccount(id: $id, billerId: $billerId, accountNumber: $accountNumber, nickname: $nickname, savedAt: $savedAt)';
}


}

/// @nodoc
abstract mixin class $BillerAccountCopyWith<$Res>  {
  factory $BillerAccountCopyWith(BillerAccount value, $Res Function(BillerAccount) _then) = _$BillerAccountCopyWithImpl;
@useResult
$Res call({
 String id, String billerId, String accountNumber, String nickname, DateTime savedAt
});




}
/// @nodoc
class _$BillerAccountCopyWithImpl<$Res>
    implements $BillerAccountCopyWith<$Res> {
  _$BillerAccountCopyWithImpl(this._self, this._then);

  final BillerAccount _self;
  final $Res Function(BillerAccount) _then;

/// Create a copy of BillerAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? billerId = null,Object? accountNumber = null,Object? nickname = null,Object? savedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,billerId: null == billerId ? _self.billerId : billerId // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BillerAccount].
extension BillerAccountPatterns on BillerAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillerAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillerAccount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillerAccount value)  $default,){
final _that = this;
switch (_that) {
case _BillerAccount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillerAccount value)?  $default,){
final _that = this;
switch (_that) {
case _BillerAccount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String billerId,  String accountNumber,  String nickname,  DateTime savedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillerAccount() when $default != null:
return $default(_that.id,_that.billerId,_that.accountNumber,_that.nickname,_that.savedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String billerId,  String accountNumber,  String nickname,  DateTime savedAt)  $default,) {final _that = this;
switch (_that) {
case _BillerAccount():
return $default(_that.id,_that.billerId,_that.accountNumber,_that.nickname,_that.savedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String billerId,  String accountNumber,  String nickname,  DateTime savedAt)?  $default,) {final _that = this;
switch (_that) {
case _BillerAccount() when $default != null:
return $default(_that.id,_that.billerId,_that.accountNumber,_that.nickname,_that.savedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BillerAccount implements BillerAccount {
  const _BillerAccount({required this.id, required this.billerId, required this.accountNumber, required this.nickname, required this.savedAt});
  factory _BillerAccount.fromJson(Map<String, dynamic> json) => _$BillerAccountFromJson(json);

@override final  String id;
@override final  String billerId;
@override final  String accountNumber;
@override final  String nickname;
@override final  DateTime savedAt;

/// Create a copy of BillerAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillerAccountCopyWith<_BillerAccount> get copyWith => __$BillerAccountCopyWithImpl<_BillerAccount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BillerAccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillerAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.billerId, billerId) || other.billerId == billerId)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,billerId,accountNumber,nickname,savedAt);

@override
String toString() {
  return 'BillerAccount(id: $id, billerId: $billerId, accountNumber: $accountNumber, nickname: $nickname, savedAt: $savedAt)';
}


}

/// @nodoc
abstract mixin class _$BillerAccountCopyWith<$Res> implements $BillerAccountCopyWith<$Res> {
  factory _$BillerAccountCopyWith(_BillerAccount value, $Res Function(_BillerAccount) _then) = __$BillerAccountCopyWithImpl;
@override @useResult
$Res call({
 String id, String billerId, String accountNumber, String nickname, DateTime savedAt
});




}
/// @nodoc
class __$BillerAccountCopyWithImpl<$Res>
    implements _$BillerAccountCopyWith<$Res> {
  __$BillerAccountCopyWithImpl(this._self, this._then);

  final _BillerAccount _self;
  final $Res Function(_BillerAccount) _then;

/// Create a copy of BillerAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? billerId = null,Object? accountNumber = null,Object? nickname = null,Object? savedAt = null,}) {
  return _then(_BillerAccount(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,billerId: null == billerId ? _self.billerId : billerId // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
