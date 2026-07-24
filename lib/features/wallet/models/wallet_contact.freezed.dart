// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletContact {

 String get id; String get name; String get mobileNumber; String get walletId; String get avatarInitial;
/// Create a copy of WalletContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletContactCopyWith<WalletContact> get copyWith => _$WalletContactCopyWithImpl<WalletContact>(this as WalletContact, _$identity);

  /// Serializes this WalletContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletContact&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.mobileNumber, mobileNumber) || other.mobileNumber == mobileNumber)&&(identical(other.walletId, walletId) || other.walletId == walletId)&&(identical(other.avatarInitial, avatarInitial) || other.avatarInitial == avatarInitial));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,mobileNumber,walletId,avatarInitial);

@override
String toString() {
  return 'WalletContact(id: $id, name: $name, mobileNumber: $mobileNumber, walletId: $walletId, avatarInitial: $avatarInitial)';
}


}

/// @nodoc
abstract mixin class $WalletContactCopyWith<$Res>  {
  factory $WalletContactCopyWith(WalletContact value, $Res Function(WalletContact) _then) = _$WalletContactCopyWithImpl;
@useResult
$Res call({
 String id, String name, String mobileNumber, String walletId, String avatarInitial
});




}
/// @nodoc
class _$WalletContactCopyWithImpl<$Res>
    implements $WalletContactCopyWith<$Res> {
  _$WalletContactCopyWithImpl(this._self, this._then);

  final WalletContact _self;
  final $Res Function(WalletContact) _then;

/// Create a copy of WalletContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? mobileNumber = null,Object? walletId = null,Object? avatarInitial = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,mobileNumber: null == mobileNumber ? _self.mobileNumber : mobileNumber // ignore: cast_nullable_to_non_nullable
as String,walletId: null == walletId ? _self.walletId : walletId // ignore: cast_nullable_to_non_nullable
as String,avatarInitial: null == avatarInitial ? _self.avatarInitial : avatarInitial // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletContact].
extension WalletContactPatterns on WalletContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletContact value)  $default,){
final _that = this;
switch (_that) {
case _WalletContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletContact value)?  $default,){
final _that = this;
switch (_that) {
case _WalletContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String mobileNumber,  String walletId,  String avatarInitial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletContact() when $default != null:
return $default(_that.id,_that.name,_that.mobileNumber,_that.walletId,_that.avatarInitial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String mobileNumber,  String walletId,  String avatarInitial)  $default,) {final _that = this;
switch (_that) {
case _WalletContact():
return $default(_that.id,_that.name,_that.mobileNumber,_that.walletId,_that.avatarInitial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String mobileNumber,  String walletId,  String avatarInitial)?  $default,) {final _that = this;
switch (_that) {
case _WalletContact() when $default != null:
return $default(_that.id,_that.name,_that.mobileNumber,_that.walletId,_that.avatarInitial);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletContact implements WalletContact {
  const _WalletContact({required this.id, required this.name, required this.mobileNumber, required this.walletId, required this.avatarInitial});
  factory _WalletContact.fromJson(Map<String, dynamic> json) => _$WalletContactFromJson(json);

@override final  String id;
@override final  String name;
@override final  String mobileNumber;
@override final  String walletId;
@override final  String avatarInitial;

/// Create a copy of WalletContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletContactCopyWith<_WalletContact> get copyWith => __$WalletContactCopyWithImpl<_WalletContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletContact&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.mobileNumber, mobileNumber) || other.mobileNumber == mobileNumber)&&(identical(other.walletId, walletId) || other.walletId == walletId)&&(identical(other.avatarInitial, avatarInitial) || other.avatarInitial == avatarInitial));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,mobileNumber,walletId,avatarInitial);

@override
String toString() {
  return 'WalletContact(id: $id, name: $name, mobileNumber: $mobileNumber, walletId: $walletId, avatarInitial: $avatarInitial)';
}


}

/// @nodoc
abstract mixin class _$WalletContactCopyWith<$Res> implements $WalletContactCopyWith<$Res> {
  factory _$WalletContactCopyWith(_WalletContact value, $Res Function(_WalletContact) _then) = __$WalletContactCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String mobileNumber, String walletId, String avatarInitial
});




}
/// @nodoc
class __$WalletContactCopyWithImpl<$Res>
    implements _$WalletContactCopyWith<$Res> {
  __$WalletContactCopyWithImpl(this._self, this._then);

  final _WalletContact _self;
  final $Res Function(_WalletContact) _then;

/// Create a copy of WalletContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? mobileNumber = null,Object? walletId = null,Object? avatarInitial = null,}) {
  return _then(_WalletContact(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,mobileNumber: null == mobileNumber ? _self.mobileNumber : mobileNumber // ignore: cast_nullable_to_non_nullable
as String,walletId: null == walletId ? _self.walletId : walletId // ignore: cast_nullable_to_non_nullable
as String,avatarInitial: null == avatarInitial ? _self.avatarInitial : avatarInitial // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
