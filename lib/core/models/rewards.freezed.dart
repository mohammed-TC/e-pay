// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rewards.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Rewards {

 int get points; int get redemptionThreshold;
/// Create a copy of Rewards
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardsCopyWith<Rewards> get copyWith => _$RewardsCopyWithImpl<Rewards>(this as Rewards, _$identity);

  /// Serializes this Rewards to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Rewards&&(identical(other.points, points) || other.points == points)&&(identical(other.redemptionThreshold, redemptionThreshold) || other.redemptionThreshold == redemptionThreshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points,redemptionThreshold);

@override
String toString() {
  return 'Rewards(points: $points, redemptionThreshold: $redemptionThreshold)';
}


}

/// @nodoc
abstract mixin class $RewardsCopyWith<$Res>  {
  factory $RewardsCopyWith(Rewards value, $Res Function(Rewards) _then) = _$RewardsCopyWithImpl;
@useResult
$Res call({
 int points, int redemptionThreshold
});




}
/// @nodoc
class _$RewardsCopyWithImpl<$Res>
    implements $RewardsCopyWith<$Res> {
  _$RewardsCopyWithImpl(this._self, this._then);

  final Rewards _self;
  final $Res Function(Rewards) _then;

/// Create a copy of Rewards
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? redemptionThreshold = null,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,redemptionThreshold: null == redemptionThreshold ? _self.redemptionThreshold : redemptionThreshold // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Rewards].
extension RewardsPatterns on Rewards {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Rewards value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Rewards() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Rewards value)  $default,){
final _that = this;
switch (_that) {
case _Rewards():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Rewards value)?  $default,){
final _that = this;
switch (_that) {
case _Rewards() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int points,  int redemptionThreshold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Rewards() when $default != null:
return $default(_that.points,_that.redemptionThreshold);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int points,  int redemptionThreshold)  $default,) {final _that = this;
switch (_that) {
case _Rewards():
return $default(_that.points,_that.redemptionThreshold);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int points,  int redemptionThreshold)?  $default,) {final _that = this;
switch (_that) {
case _Rewards() when $default != null:
return $default(_that.points,_that.redemptionThreshold);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Rewards implements Rewards {
  const _Rewards({required this.points, required this.redemptionThreshold});
  factory _Rewards.fromJson(Map<String, dynamic> json) => _$RewardsFromJson(json);

@override final  int points;
@override final  int redemptionThreshold;

/// Create a copy of Rewards
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardsCopyWith<_Rewards> get copyWith => __$RewardsCopyWithImpl<_Rewards>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RewardsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Rewards&&(identical(other.points, points) || other.points == points)&&(identical(other.redemptionThreshold, redemptionThreshold) || other.redemptionThreshold == redemptionThreshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,points,redemptionThreshold);

@override
String toString() {
  return 'Rewards(points: $points, redemptionThreshold: $redemptionThreshold)';
}


}

/// @nodoc
abstract mixin class _$RewardsCopyWith<$Res> implements $RewardsCopyWith<$Res> {
  factory _$RewardsCopyWith(_Rewards value, $Res Function(_Rewards) _then) = __$RewardsCopyWithImpl;
@override @useResult
$Res call({
 int points, int redemptionThreshold
});




}
/// @nodoc
class __$RewardsCopyWithImpl<$Res>
    implements _$RewardsCopyWith<$Res> {
  __$RewardsCopyWithImpl(this._self, this._then);

  final _Rewards _self;
  final $Res Function(_Rewards) _then;

/// Create a copy of Rewards
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? redemptionThreshold = null,}) {
  return _then(_Rewards(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,redemptionThreshold: null == redemptionThreshold ? _self.redemptionThreshold : redemptionThreshold // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
