// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedCard {

 String get id; String get maskedNumber; String get brand; String get expiry; bool get isDefault;
/// Create a copy of SavedCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedCardCopyWith<SavedCard> get copyWith => _$SavedCardCopyWithImpl<SavedCard>(this as SavedCard, _$identity);

  /// Serializes this SavedCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedCard&&(identical(other.id, id) || other.id == id)&&(identical(other.maskedNumber, maskedNumber) || other.maskedNumber == maskedNumber)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.expiry, expiry) || other.expiry == expiry)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,maskedNumber,brand,expiry,isDefault);

@override
String toString() {
  return 'SavedCard(id: $id, maskedNumber: $maskedNumber, brand: $brand, expiry: $expiry, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $SavedCardCopyWith<$Res>  {
  factory $SavedCardCopyWith(SavedCard value, $Res Function(SavedCard) _then) = _$SavedCardCopyWithImpl;
@useResult
$Res call({
 String id, String maskedNumber, String brand, String expiry, bool isDefault
});




}
/// @nodoc
class _$SavedCardCopyWithImpl<$Res>
    implements $SavedCardCopyWith<$Res> {
  _$SavedCardCopyWithImpl(this._self, this._then);

  final SavedCard _self;
  final $Res Function(SavedCard) _then;

/// Create a copy of SavedCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? maskedNumber = null,Object? brand = null,Object? expiry = null,Object? isDefault = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,maskedNumber: null == maskedNumber ? _self.maskedNumber : maskedNumber // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,expiry: null == expiry ? _self.expiry : expiry // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedCard].
extension SavedCardPatterns on SavedCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedCard value)  $default,){
final _that = this;
switch (_that) {
case _SavedCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedCard value)?  $default,){
final _that = this;
switch (_that) {
case _SavedCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String maskedNumber,  String brand,  String expiry,  bool isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedCard() when $default != null:
return $default(_that.id,_that.maskedNumber,_that.brand,_that.expiry,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String maskedNumber,  String brand,  String expiry,  bool isDefault)  $default,) {final _that = this;
switch (_that) {
case _SavedCard():
return $default(_that.id,_that.maskedNumber,_that.brand,_that.expiry,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String maskedNumber,  String brand,  String expiry,  bool isDefault)?  $default,) {final _that = this;
switch (_that) {
case _SavedCard() when $default != null:
return $default(_that.id,_that.maskedNumber,_that.brand,_that.expiry,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedCard implements SavedCard {
  const _SavedCard({required this.id, required this.maskedNumber, required this.brand, required this.expiry, required this.isDefault});
  factory _SavedCard.fromJson(Map<String, dynamic> json) => _$SavedCardFromJson(json);

@override final  String id;
@override final  String maskedNumber;
@override final  String brand;
@override final  String expiry;
@override final  bool isDefault;

/// Create a copy of SavedCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedCardCopyWith<_SavedCard> get copyWith => __$SavedCardCopyWithImpl<_SavedCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedCardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedCard&&(identical(other.id, id) || other.id == id)&&(identical(other.maskedNumber, maskedNumber) || other.maskedNumber == maskedNumber)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.expiry, expiry) || other.expiry == expiry)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,maskedNumber,brand,expiry,isDefault);

@override
String toString() {
  return 'SavedCard(id: $id, maskedNumber: $maskedNumber, brand: $brand, expiry: $expiry, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$SavedCardCopyWith<$Res> implements $SavedCardCopyWith<$Res> {
  factory _$SavedCardCopyWith(_SavedCard value, $Res Function(_SavedCard) _then) = __$SavedCardCopyWithImpl;
@override @useResult
$Res call({
 String id, String maskedNumber, String brand, String expiry, bool isDefault
});




}
/// @nodoc
class __$SavedCardCopyWithImpl<$Res>
    implements _$SavedCardCopyWith<$Res> {
  __$SavedCardCopyWithImpl(this._self, this._then);

  final _SavedCard _self;
  final $Res Function(_SavedCard) _then;

/// Create a copy of SavedCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? maskedNumber = null,Object? brand = null,Object? expiry = null,Object? isDefault = null,}) {
  return _then(_SavedCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,maskedNumber: null == maskedNumber ? _self.maskedNumber : maskedNumber // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,expiry: null == expiry ? _self.expiry : expiry // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
