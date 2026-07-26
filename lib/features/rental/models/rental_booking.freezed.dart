// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RentalBooking {

 String get id; String get locationId; String get locationName; String get vehicleClassId; String get vehicleClassName; DateTime get pickupDate; DateTime get returnDate; int get days; Money get baseCost; List<String> get addonNames; Money get addonsCost; int get pointsRedeemed; Money get pointsDiscount; Money get total; int get pointsEarned; DateTime get bookedAt;
/// Create a copy of RentalBooking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RentalBookingCopyWith<RentalBooking> get copyWith => _$RentalBookingCopyWithImpl<RentalBooking>(this as RentalBooking, _$identity);

  /// Serializes this RentalBooking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RentalBooking&&(identical(other.id, id) || other.id == id)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.vehicleClassId, vehicleClassId) || other.vehicleClassId == vehicleClassId)&&(identical(other.vehicleClassName, vehicleClassName) || other.vehicleClassName == vehicleClassName)&&(identical(other.pickupDate, pickupDate) || other.pickupDate == pickupDate)&&(identical(other.returnDate, returnDate) || other.returnDate == returnDate)&&(identical(other.days, days) || other.days == days)&&(identical(other.baseCost, baseCost) || other.baseCost == baseCost)&&const DeepCollectionEquality().equals(other.addonNames, addonNames)&&(identical(other.addonsCost, addonsCost) || other.addonsCost == addonsCost)&&(identical(other.pointsRedeemed, pointsRedeemed) || other.pointsRedeemed == pointsRedeemed)&&(identical(other.pointsDiscount, pointsDiscount) || other.pointsDiscount == pointsDiscount)&&(identical(other.total, total) || other.total == total)&&(identical(other.pointsEarned, pointsEarned) || other.pointsEarned == pointsEarned)&&(identical(other.bookedAt, bookedAt) || other.bookedAt == bookedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,locationId,locationName,vehicleClassId,vehicleClassName,pickupDate,returnDate,days,baseCost,const DeepCollectionEquality().hash(addonNames),addonsCost,pointsRedeemed,pointsDiscount,total,pointsEarned,bookedAt);

@override
String toString() {
  return 'RentalBooking(id: $id, locationId: $locationId, locationName: $locationName, vehicleClassId: $vehicleClassId, vehicleClassName: $vehicleClassName, pickupDate: $pickupDate, returnDate: $returnDate, days: $days, baseCost: $baseCost, addonNames: $addonNames, addonsCost: $addonsCost, pointsRedeemed: $pointsRedeemed, pointsDiscount: $pointsDiscount, total: $total, pointsEarned: $pointsEarned, bookedAt: $bookedAt)';
}


}

/// @nodoc
abstract mixin class $RentalBookingCopyWith<$Res>  {
  factory $RentalBookingCopyWith(RentalBooking value, $Res Function(RentalBooking) _then) = _$RentalBookingCopyWithImpl;
@useResult
$Res call({
 String id, String locationId, String locationName, String vehicleClassId, String vehicleClassName, DateTime pickupDate, DateTime returnDate, int days, Money baseCost, List<String> addonNames, Money addonsCost, int pointsRedeemed, Money pointsDiscount, Money total, int pointsEarned, DateTime bookedAt
});


$MoneyCopyWith<$Res> get baseCost;$MoneyCopyWith<$Res> get addonsCost;$MoneyCopyWith<$Res> get pointsDiscount;$MoneyCopyWith<$Res> get total;

}
/// @nodoc
class _$RentalBookingCopyWithImpl<$Res>
    implements $RentalBookingCopyWith<$Res> {
  _$RentalBookingCopyWithImpl(this._self, this._then);

  final RentalBooking _self;
  final $Res Function(RentalBooking) _then;

/// Create a copy of RentalBooking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? locationId = null,Object? locationName = null,Object? vehicleClassId = null,Object? vehicleClassName = null,Object? pickupDate = null,Object? returnDate = null,Object? days = null,Object? baseCost = null,Object? addonNames = null,Object? addonsCost = null,Object? pointsRedeemed = null,Object? pointsDiscount = null,Object? total = null,Object? pointsEarned = null,Object? bookedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,vehicleClassId: null == vehicleClassId ? _self.vehicleClassId : vehicleClassId // ignore: cast_nullable_to_non_nullable
as String,vehicleClassName: null == vehicleClassName ? _self.vehicleClassName : vehicleClassName // ignore: cast_nullable_to_non_nullable
as String,pickupDate: null == pickupDate ? _self.pickupDate : pickupDate // ignore: cast_nullable_to_non_nullable
as DateTime,returnDate: null == returnDate ? _self.returnDate : returnDate // ignore: cast_nullable_to_non_nullable
as DateTime,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,baseCost: null == baseCost ? _self.baseCost : baseCost // ignore: cast_nullable_to_non_nullable
as Money,addonNames: null == addonNames ? _self.addonNames : addonNames // ignore: cast_nullable_to_non_nullable
as List<String>,addonsCost: null == addonsCost ? _self.addonsCost : addonsCost // ignore: cast_nullable_to_non_nullable
as Money,pointsRedeemed: null == pointsRedeemed ? _self.pointsRedeemed : pointsRedeemed // ignore: cast_nullable_to_non_nullable
as int,pointsDiscount: null == pointsDiscount ? _self.pointsDiscount : pointsDiscount // ignore: cast_nullable_to_non_nullable
as Money,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,pointsEarned: null == pointsEarned ? _self.pointsEarned : pointsEarned // ignore: cast_nullable_to_non_nullable
as int,bookedAt: null == bookedAt ? _self.bookedAt : bookedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of RentalBooking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get baseCost {
  
  return $MoneyCopyWith<$Res>(_self.baseCost, (value) {
    return _then(_self.copyWith(baseCost: value));
  });
}/// Create a copy of RentalBooking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get addonsCost {
  
  return $MoneyCopyWith<$Res>(_self.addonsCost, (value) {
    return _then(_self.copyWith(addonsCost: value));
  });
}/// Create a copy of RentalBooking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get pointsDiscount {
  
  return $MoneyCopyWith<$Res>(_self.pointsDiscount, (value) {
    return _then(_self.copyWith(pointsDiscount: value));
  });
}/// Create a copy of RentalBooking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get total {
  
  return $MoneyCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}
}


/// Adds pattern-matching-related methods to [RentalBooking].
extension RentalBookingPatterns on RentalBooking {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RentalBooking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RentalBooking() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RentalBooking value)  $default,){
final _that = this;
switch (_that) {
case _RentalBooking():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RentalBooking value)?  $default,){
final _that = this;
switch (_that) {
case _RentalBooking() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String locationId,  String locationName,  String vehicleClassId,  String vehicleClassName,  DateTime pickupDate,  DateTime returnDate,  int days,  Money baseCost,  List<String> addonNames,  Money addonsCost,  int pointsRedeemed,  Money pointsDiscount,  Money total,  int pointsEarned,  DateTime bookedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RentalBooking() when $default != null:
return $default(_that.id,_that.locationId,_that.locationName,_that.vehicleClassId,_that.vehicleClassName,_that.pickupDate,_that.returnDate,_that.days,_that.baseCost,_that.addonNames,_that.addonsCost,_that.pointsRedeemed,_that.pointsDiscount,_that.total,_that.pointsEarned,_that.bookedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String locationId,  String locationName,  String vehicleClassId,  String vehicleClassName,  DateTime pickupDate,  DateTime returnDate,  int days,  Money baseCost,  List<String> addonNames,  Money addonsCost,  int pointsRedeemed,  Money pointsDiscount,  Money total,  int pointsEarned,  DateTime bookedAt)  $default,) {final _that = this;
switch (_that) {
case _RentalBooking():
return $default(_that.id,_that.locationId,_that.locationName,_that.vehicleClassId,_that.vehicleClassName,_that.pickupDate,_that.returnDate,_that.days,_that.baseCost,_that.addonNames,_that.addonsCost,_that.pointsRedeemed,_that.pointsDiscount,_that.total,_that.pointsEarned,_that.bookedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String locationId,  String locationName,  String vehicleClassId,  String vehicleClassName,  DateTime pickupDate,  DateTime returnDate,  int days,  Money baseCost,  List<String> addonNames,  Money addonsCost,  int pointsRedeemed,  Money pointsDiscount,  Money total,  int pointsEarned,  DateTime bookedAt)?  $default,) {final _that = this;
switch (_that) {
case _RentalBooking() when $default != null:
return $default(_that.id,_that.locationId,_that.locationName,_that.vehicleClassId,_that.vehicleClassName,_that.pickupDate,_that.returnDate,_that.days,_that.baseCost,_that.addonNames,_that.addonsCost,_that.pointsRedeemed,_that.pointsDiscount,_that.total,_that.pointsEarned,_that.bookedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RentalBooking implements RentalBooking {
  const _RentalBooking({required this.id, required this.locationId, required this.locationName, required this.vehicleClassId, required this.vehicleClassName, required this.pickupDate, required this.returnDate, required this.days, required this.baseCost, required final  List<String> addonNames, required this.addonsCost, required this.pointsRedeemed, required this.pointsDiscount, required this.total, required this.pointsEarned, required this.bookedAt}): _addonNames = addonNames;
  factory _RentalBooking.fromJson(Map<String, dynamic> json) => _$RentalBookingFromJson(json);

@override final  String id;
@override final  String locationId;
@override final  String locationName;
@override final  String vehicleClassId;
@override final  String vehicleClassName;
@override final  DateTime pickupDate;
@override final  DateTime returnDate;
@override final  int days;
@override final  Money baseCost;
 final  List<String> _addonNames;
@override List<String> get addonNames {
  if (_addonNames is EqualUnmodifiableListView) return _addonNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addonNames);
}

@override final  Money addonsCost;
@override final  int pointsRedeemed;
@override final  Money pointsDiscount;
@override final  Money total;
@override final  int pointsEarned;
@override final  DateTime bookedAt;

/// Create a copy of RentalBooking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RentalBookingCopyWith<_RentalBooking> get copyWith => __$RentalBookingCopyWithImpl<_RentalBooking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RentalBookingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RentalBooking&&(identical(other.id, id) || other.id == id)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.vehicleClassId, vehicleClassId) || other.vehicleClassId == vehicleClassId)&&(identical(other.vehicleClassName, vehicleClassName) || other.vehicleClassName == vehicleClassName)&&(identical(other.pickupDate, pickupDate) || other.pickupDate == pickupDate)&&(identical(other.returnDate, returnDate) || other.returnDate == returnDate)&&(identical(other.days, days) || other.days == days)&&(identical(other.baseCost, baseCost) || other.baseCost == baseCost)&&const DeepCollectionEquality().equals(other._addonNames, _addonNames)&&(identical(other.addonsCost, addonsCost) || other.addonsCost == addonsCost)&&(identical(other.pointsRedeemed, pointsRedeemed) || other.pointsRedeemed == pointsRedeemed)&&(identical(other.pointsDiscount, pointsDiscount) || other.pointsDiscount == pointsDiscount)&&(identical(other.total, total) || other.total == total)&&(identical(other.pointsEarned, pointsEarned) || other.pointsEarned == pointsEarned)&&(identical(other.bookedAt, bookedAt) || other.bookedAt == bookedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,locationId,locationName,vehicleClassId,vehicleClassName,pickupDate,returnDate,days,baseCost,const DeepCollectionEquality().hash(_addonNames),addonsCost,pointsRedeemed,pointsDiscount,total,pointsEarned,bookedAt);

@override
String toString() {
  return 'RentalBooking(id: $id, locationId: $locationId, locationName: $locationName, vehicleClassId: $vehicleClassId, vehicleClassName: $vehicleClassName, pickupDate: $pickupDate, returnDate: $returnDate, days: $days, baseCost: $baseCost, addonNames: $addonNames, addonsCost: $addonsCost, pointsRedeemed: $pointsRedeemed, pointsDiscount: $pointsDiscount, total: $total, pointsEarned: $pointsEarned, bookedAt: $bookedAt)';
}


}

/// @nodoc
abstract mixin class _$RentalBookingCopyWith<$Res> implements $RentalBookingCopyWith<$Res> {
  factory _$RentalBookingCopyWith(_RentalBooking value, $Res Function(_RentalBooking) _then) = __$RentalBookingCopyWithImpl;
@override @useResult
$Res call({
 String id, String locationId, String locationName, String vehicleClassId, String vehicleClassName, DateTime pickupDate, DateTime returnDate, int days, Money baseCost, List<String> addonNames, Money addonsCost, int pointsRedeemed, Money pointsDiscount, Money total, int pointsEarned, DateTime bookedAt
});


@override $MoneyCopyWith<$Res> get baseCost;@override $MoneyCopyWith<$Res> get addonsCost;@override $MoneyCopyWith<$Res> get pointsDiscount;@override $MoneyCopyWith<$Res> get total;

}
/// @nodoc
class __$RentalBookingCopyWithImpl<$Res>
    implements _$RentalBookingCopyWith<$Res> {
  __$RentalBookingCopyWithImpl(this._self, this._then);

  final _RentalBooking _self;
  final $Res Function(_RentalBooking) _then;

/// Create a copy of RentalBooking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? locationId = null,Object? locationName = null,Object? vehicleClassId = null,Object? vehicleClassName = null,Object? pickupDate = null,Object? returnDate = null,Object? days = null,Object? baseCost = null,Object? addonNames = null,Object? addonsCost = null,Object? pointsRedeemed = null,Object? pointsDiscount = null,Object? total = null,Object? pointsEarned = null,Object? bookedAt = null,}) {
  return _then(_RentalBooking(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,vehicleClassId: null == vehicleClassId ? _self.vehicleClassId : vehicleClassId // ignore: cast_nullable_to_non_nullable
as String,vehicleClassName: null == vehicleClassName ? _self.vehicleClassName : vehicleClassName // ignore: cast_nullable_to_non_nullable
as String,pickupDate: null == pickupDate ? _self.pickupDate : pickupDate // ignore: cast_nullable_to_non_nullable
as DateTime,returnDate: null == returnDate ? _self.returnDate : returnDate // ignore: cast_nullable_to_non_nullable
as DateTime,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,baseCost: null == baseCost ? _self.baseCost : baseCost // ignore: cast_nullable_to_non_nullable
as Money,addonNames: null == addonNames ? _self._addonNames : addonNames // ignore: cast_nullable_to_non_nullable
as List<String>,addonsCost: null == addonsCost ? _self.addonsCost : addonsCost // ignore: cast_nullable_to_non_nullable
as Money,pointsRedeemed: null == pointsRedeemed ? _self.pointsRedeemed : pointsRedeemed // ignore: cast_nullable_to_non_nullable
as int,pointsDiscount: null == pointsDiscount ? _self.pointsDiscount : pointsDiscount // ignore: cast_nullable_to_non_nullable
as Money,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,pointsEarned: null == pointsEarned ? _self.pointsEarned : pointsEarned // ignore: cast_nullable_to_non_nullable
as int,bookedAt: null == bookedAt ? _self.bookedAt : bookedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of RentalBooking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get baseCost {
  
  return $MoneyCopyWith<$Res>(_self.baseCost, (value) {
    return _then(_self.copyWith(baseCost: value));
  });
}/// Create a copy of RentalBooking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get addonsCost {
  
  return $MoneyCopyWith<$Res>(_self.addonsCost, (value) {
    return _then(_self.copyWith(addonsCost: value));
  });
}/// Create a copy of RentalBooking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get pointsDiscount {
  
  return $MoneyCopyWith<$Res>(_self.pointsDiscount, (value) {
    return _then(_self.copyWith(pointsDiscount: value));
  });
}/// Create a copy of RentalBooking
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get total {
  
  return $MoneyCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}
}

// dart format on
