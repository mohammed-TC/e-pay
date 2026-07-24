// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recharge_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RechargePlan {

 String get id; String get billerId; String get label; String get description; Money get price; bool get isPopular;
/// Create a copy of RechargePlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RechargePlanCopyWith<RechargePlan> get copyWith => _$RechargePlanCopyWithImpl<RechargePlan>(this as RechargePlan, _$identity);

  /// Serializes this RechargePlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RechargePlan&&(identical(other.id, id) || other.id == id)&&(identical(other.billerId, billerId) || other.billerId == billerId)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,billerId,label,description,price,isPopular);

@override
String toString() {
  return 'RechargePlan(id: $id, billerId: $billerId, label: $label, description: $description, price: $price, isPopular: $isPopular)';
}


}

/// @nodoc
abstract mixin class $RechargePlanCopyWith<$Res>  {
  factory $RechargePlanCopyWith(RechargePlan value, $Res Function(RechargePlan) _then) = _$RechargePlanCopyWithImpl;
@useResult
$Res call({
 String id, String billerId, String label, String description, Money price, bool isPopular
});


$MoneyCopyWith<$Res> get price;

}
/// @nodoc
class _$RechargePlanCopyWithImpl<$Res>
    implements $RechargePlanCopyWith<$Res> {
  _$RechargePlanCopyWithImpl(this._self, this._then);

  final RechargePlan _self;
  final $Res Function(RechargePlan) _then;

/// Create a copy of RechargePlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? billerId = null,Object? label = null,Object? description = null,Object? price = null,Object? isPopular = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,billerId: null == billerId ? _self.billerId : billerId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of RechargePlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}


/// Adds pattern-matching-related methods to [RechargePlan].
extension RechargePlanPatterns on RechargePlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RechargePlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RechargePlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RechargePlan value)  $default,){
final _that = this;
switch (_that) {
case _RechargePlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RechargePlan value)?  $default,){
final _that = this;
switch (_that) {
case _RechargePlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String billerId,  String label,  String description,  Money price,  bool isPopular)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RechargePlan() when $default != null:
return $default(_that.id,_that.billerId,_that.label,_that.description,_that.price,_that.isPopular);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String billerId,  String label,  String description,  Money price,  bool isPopular)  $default,) {final _that = this;
switch (_that) {
case _RechargePlan():
return $default(_that.id,_that.billerId,_that.label,_that.description,_that.price,_that.isPopular);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String billerId,  String label,  String description,  Money price,  bool isPopular)?  $default,) {final _that = this;
switch (_that) {
case _RechargePlan() when $default != null:
return $default(_that.id,_that.billerId,_that.label,_that.description,_that.price,_that.isPopular);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RechargePlan implements RechargePlan {
  const _RechargePlan({required this.id, required this.billerId, required this.label, required this.description, required this.price, required this.isPopular});
  factory _RechargePlan.fromJson(Map<String, dynamic> json) => _$RechargePlanFromJson(json);

@override final  String id;
@override final  String billerId;
@override final  String label;
@override final  String description;
@override final  Money price;
@override final  bool isPopular;

/// Create a copy of RechargePlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RechargePlanCopyWith<_RechargePlan> get copyWith => __$RechargePlanCopyWithImpl<_RechargePlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RechargePlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RechargePlan&&(identical(other.id, id) || other.id == id)&&(identical(other.billerId, billerId) || other.billerId == billerId)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,billerId,label,description,price,isPopular);

@override
String toString() {
  return 'RechargePlan(id: $id, billerId: $billerId, label: $label, description: $description, price: $price, isPopular: $isPopular)';
}


}

/// @nodoc
abstract mixin class _$RechargePlanCopyWith<$Res> implements $RechargePlanCopyWith<$Res> {
  factory _$RechargePlanCopyWith(_RechargePlan value, $Res Function(_RechargePlan) _then) = __$RechargePlanCopyWithImpl;
@override @useResult
$Res call({
 String id, String billerId, String label, String description, Money price, bool isPopular
});


@override $MoneyCopyWith<$Res> get price;

}
/// @nodoc
class __$RechargePlanCopyWithImpl<$Res>
    implements _$RechargePlanCopyWith<$Res> {
  __$RechargePlanCopyWithImpl(this._self, this._then);

  final _RechargePlan _self;
  final $Res Function(_RechargePlan) _then;

/// Create a copy of RechargePlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? billerId = null,Object? label = null,Object? description = null,Object? price = null,Object? isPopular = null,}) {
  return _then(_RechargePlan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,billerId: null == billerId ? _self.billerId : billerId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of RechargePlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get price {
  
  return $MoneyCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}

// dart format on
