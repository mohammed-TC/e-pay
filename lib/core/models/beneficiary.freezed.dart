// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beneficiary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Beneficiary {

 String get id; String get name; String get bankName; String get accountNumber; String get countryCode; String get relationship; String get purpose;
/// Create a copy of Beneficiary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BeneficiaryCopyWith<Beneficiary> get copyWith => _$BeneficiaryCopyWithImpl<Beneficiary>(this as Beneficiary, _$identity);

  /// Serializes this Beneficiary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Beneficiary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.purpose, purpose) || other.purpose == purpose));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,bankName,accountNumber,countryCode,relationship,purpose);

@override
String toString() {
  return 'Beneficiary(id: $id, name: $name, bankName: $bankName, accountNumber: $accountNumber, countryCode: $countryCode, relationship: $relationship, purpose: $purpose)';
}


}

/// @nodoc
abstract mixin class $BeneficiaryCopyWith<$Res>  {
  factory $BeneficiaryCopyWith(Beneficiary value, $Res Function(Beneficiary) _then) = _$BeneficiaryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String bankName, String accountNumber, String countryCode, String relationship, String purpose
});




}
/// @nodoc
class _$BeneficiaryCopyWithImpl<$Res>
    implements $BeneficiaryCopyWith<$Res> {
  _$BeneficiaryCopyWithImpl(this._self, this._then);

  final Beneficiary _self;
  final $Res Function(Beneficiary) _then;

/// Create a copy of Beneficiary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? bankName = null,Object? accountNumber = null,Object? countryCode = null,Object? relationship = null,Object? purpose = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as String,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Beneficiary].
extension BeneficiaryPatterns on Beneficiary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Beneficiary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Beneficiary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Beneficiary value)  $default,){
final _that = this;
switch (_that) {
case _Beneficiary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Beneficiary value)?  $default,){
final _that = this;
switch (_that) {
case _Beneficiary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String bankName,  String accountNumber,  String countryCode,  String relationship,  String purpose)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Beneficiary() when $default != null:
return $default(_that.id,_that.name,_that.bankName,_that.accountNumber,_that.countryCode,_that.relationship,_that.purpose);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String bankName,  String accountNumber,  String countryCode,  String relationship,  String purpose)  $default,) {final _that = this;
switch (_that) {
case _Beneficiary():
return $default(_that.id,_that.name,_that.bankName,_that.accountNumber,_that.countryCode,_that.relationship,_that.purpose);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String bankName,  String accountNumber,  String countryCode,  String relationship,  String purpose)?  $default,) {final _that = this;
switch (_that) {
case _Beneficiary() when $default != null:
return $default(_that.id,_that.name,_that.bankName,_that.accountNumber,_that.countryCode,_that.relationship,_that.purpose);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Beneficiary implements Beneficiary {
  const _Beneficiary({required this.id, required this.name, required this.bankName, required this.accountNumber, required this.countryCode, required this.relationship, required this.purpose});
  factory _Beneficiary.fromJson(Map<String, dynamic> json) => _$BeneficiaryFromJson(json);

@override final  String id;
@override final  String name;
@override final  String bankName;
@override final  String accountNumber;
@override final  String countryCode;
@override final  String relationship;
@override final  String purpose;

/// Create a copy of Beneficiary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BeneficiaryCopyWith<_Beneficiary> get copyWith => __$BeneficiaryCopyWithImpl<_Beneficiary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BeneficiaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Beneficiary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.purpose, purpose) || other.purpose == purpose));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,bankName,accountNumber,countryCode,relationship,purpose);

@override
String toString() {
  return 'Beneficiary(id: $id, name: $name, bankName: $bankName, accountNumber: $accountNumber, countryCode: $countryCode, relationship: $relationship, purpose: $purpose)';
}


}

/// @nodoc
abstract mixin class _$BeneficiaryCopyWith<$Res> implements $BeneficiaryCopyWith<$Res> {
  factory _$BeneficiaryCopyWith(_Beneficiary value, $Res Function(_Beneficiary) _then) = __$BeneficiaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String bankName, String accountNumber, String countryCode, String relationship, String purpose
});




}
/// @nodoc
class __$BeneficiaryCopyWithImpl<$Res>
    implements _$BeneficiaryCopyWith<$Res> {
  __$BeneficiaryCopyWithImpl(this._self, this._then);

  final _Beneficiary _self;
  final $Res Function(_Beneficiary) _then;

/// Create a copy of Beneficiary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? bankName = null,Object? accountNumber = null,Object? countryCode = null,Object? relationship = null,Object? purpose = null,}) {
  return _then(_Beneficiary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as String,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
