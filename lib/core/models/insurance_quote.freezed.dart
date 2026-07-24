// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insurance_quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InsuranceQuote {

 String get id; String get vehicleId; String get provider; Money get premium; List<String> get coverageDetails;
/// Create a copy of InsuranceQuote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InsuranceQuoteCopyWith<InsuranceQuote> get copyWith => _$InsuranceQuoteCopyWithImpl<InsuranceQuote>(this as InsuranceQuote, _$identity);

  /// Serializes this InsuranceQuote to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsuranceQuote&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.premium, premium) || other.premium == premium)&&const DeepCollectionEquality().equals(other.coverageDetails, coverageDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleId,provider,premium,const DeepCollectionEquality().hash(coverageDetails));

@override
String toString() {
  return 'InsuranceQuote(id: $id, vehicleId: $vehicleId, provider: $provider, premium: $premium, coverageDetails: $coverageDetails)';
}


}

/// @nodoc
abstract mixin class $InsuranceQuoteCopyWith<$Res>  {
  factory $InsuranceQuoteCopyWith(InsuranceQuote value, $Res Function(InsuranceQuote) _then) = _$InsuranceQuoteCopyWithImpl;
@useResult
$Res call({
 String id, String vehicleId, String provider, Money premium, List<String> coverageDetails
});


$MoneyCopyWith<$Res> get premium;

}
/// @nodoc
class _$InsuranceQuoteCopyWithImpl<$Res>
    implements $InsuranceQuoteCopyWith<$Res> {
  _$InsuranceQuoteCopyWithImpl(this._self, this._then);

  final InsuranceQuote _self;
  final $Res Function(InsuranceQuote) _then;

/// Create a copy of InsuranceQuote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vehicleId = null,Object? provider = null,Object? premium = null,Object? coverageDetails = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,premium: null == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as Money,coverageDetails: null == coverageDetails ? _self.coverageDetails : coverageDetails // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of InsuranceQuote
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get premium {
  
  return $MoneyCopyWith<$Res>(_self.premium, (value) {
    return _then(_self.copyWith(premium: value));
  });
}
}


/// Adds pattern-matching-related methods to [InsuranceQuote].
extension InsuranceQuotePatterns on InsuranceQuote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InsuranceQuote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InsuranceQuote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InsuranceQuote value)  $default,){
final _that = this;
switch (_that) {
case _InsuranceQuote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InsuranceQuote value)?  $default,){
final _that = this;
switch (_that) {
case _InsuranceQuote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String vehicleId,  String provider,  Money premium,  List<String> coverageDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InsuranceQuote() when $default != null:
return $default(_that.id,_that.vehicleId,_that.provider,_that.premium,_that.coverageDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String vehicleId,  String provider,  Money premium,  List<String> coverageDetails)  $default,) {final _that = this;
switch (_that) {
case _InsuranceQuote():
return $default(_that.id,_that.vehicleId,_that.provider,_that.premium,_that.coverageDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String vehicleId,  String provider,  Money premium,  List<String> coverageDetails)?  $default,) {final _that = this;
switch (_that) {
case _InsuranceQuote() when $default != null:
return $default(_that.id,_that.vehicleId,_that.provider,_that.premium,_that.coverageDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InsuranceQuote implements InsuranceQuote {
  const _InsuranceQuote({required this.id, required this.vehicleId, required this.provider, required this.premium, required final  List<String> coverageDetails}): _coverageDetails = coverageDetails;
  factory _InsuranceQuote.fromJson(Map<String, dynamic> json) => _$InsuranceQuoteFromJson(json);

@override final  String id;
@override final  String vehicleId;
@override final  String provider;
@override final  Money premium;
 final  List<String> _coverageDetails;
@override List<String> get coverageDetails {
  if (_coverageDetails is EqualUnmodifiableListView) return _coverageDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coverageDetails);
}


/// Create a copy of InsuranceQuote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InsuranceQuoteCopyWith<_InsuranceQuote> get copyWith => __$InsuranceQuoteCopyWithImpl<_InsuranceQuote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InsuranceQuoteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InsuranceQuote&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.premium, premium) || other.premium == premium)&&const DeepCollectionEquality().equals(other._coverageDetails, _coverageDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleId,provider,premium,const DeepCollectionEquality().hash(_coverageDetails));

@override
String toString() {
  return 'InsuranceQuote(id: $id, vehicleId: $vehicleId, provider: $provider, premium: $premium, coverageDetails: $coverageDetails)';
}


}

/// @nodoc
abstract mixin class _$InsuranceQuoteCopyWith<$Res> implements $InsuranceQuoteCopyWith<$Res> {
  factory _$InsuranceQuoteCopyWith(_InsuranceQuote value, $Res Function(_InsuranceQuote) _then) = __$InsuranceQuoteCopyWithImpl;
@override @useResult
$Res call({
 String id, String vehicleId, String provider, Money premium, List<String> coverageDetails
});


@override $MoneyCopyWith<$Res> get premium;

}
/// @nodoc
class __$InsuranceQuoteCopyWithImpl<$Res>
    implements _$InsuranceQuoteCopyWith<$Res> {
  __$InsuranceQuoteCopyWithImpl(this._self, this._then);

  final _InsuranceQuote _self;
  final $Res Function(_InsuranceQuote) _then;

/// Create a copy of InsuranceQuote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vehicleId = null,Object? provider = null,Object? premium = null,Object? coverageDetails = null,}) {
  return _then(_InsuranceQuote(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,premium: null == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as Money,coverageDetails: null == coverageDetails ? _self._coverageDetails : coverageDetails // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of InsuranceQuote
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get premium {
  
  return $MoneyCopyWith<$Res>(_self.premium, (value) {
    return _then(_self.copyWith(premium: value));
  });
}
}

// dart format on
