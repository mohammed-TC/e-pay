// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthLoggedOut value)?  loggedOut,TResult Function( AuthOtpPending value)?  otpPending,TResult Function( AuthNeedsPin value)?  needsPin,TResult Function( AuthAuthed value)?  authed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthLoggedOut() when loggedOut != null:
return loggedOut(_that);case AuthOtpPending() when otpPending != null:
return otpPending(_that);case AuthNeedsPin() when needsPin != null:
return needsPin(_that);case AuthAuthed() when authed != null:
return authed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthLoggedOut value)  loggedOut,required TResult Function( AuthOtpPending value)  otpPending,required TResult Function( AuthNeedsPin value)  needsPin,required TResult Function( AuthAuthed value)  authed,}){
final _that = this;
switch (_that) {
case AuthLoggedOut():
return loggedOut(_that);case AuthOtpPending():
return otpPending(_that);case AuthNeedsPin():
return needsPin(_that);case AuthAuthed():
return authed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthLoggedOut value)?  loggedOut,TResult? Function( AuthOtpPending value)?  otpPending,TResult? Function( AuthNeedsPin value)?  needsPin,TResult? Function( AuthAuthed value)?  authed,}){
final _that = this;
switch (_that) {
case AuthLoggedOut() when loggedOut != null:
return loggedOut(_that);case AuthOtpPending() when otpPending != null:
return otpPending(_that);case AuthNeedsPin() when needsPin != null:
return needsPin(_that);case AuthAuthed() when authed != null:
return authed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loggedOut,TResult Function( String mobileNumber)?  otpPending,TResult Function( UserProfile profile)?  needsPin,TResult Function( UserProfile profile)?  authed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthLoggedOut() when loggedOut != null:
return loggedOut();case AuthOtpPending() when otpPending != null:
return otpPending(_that.mobileNumber);case AuthNeedsPin() when needsPin != null:
return needsPin(_that.profile);case AuthAuthed() when authed != null:
return authed(_that.profile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loggedOut,required TResult Function( String mobileNumber)  otpPending,required TResult Function( UserProfile profile)  needsPin,required TResult Function( UserProfile profile)  authed,}) {final _that = this;
switch (_that) {
case AuthLoggedOut():
return loggedOut();case AuthOtpPending():
return otpPending(_that.mobileNumber);case AuthNeedsPin():
return needsPin(_that.profile);case AuthAuthed():
return authed(_that.profile);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loggedOut,TResult? Function( String mobileNumber)?  otpPending,TResult? Function( UserProfile profile)?  needsPin,TResult? Function( UserProfile profile)?  authed,}) {final _that = this;
switch (_that) {
case AuthLoggedOut() when loggedOut != null:
return loggedOut();case AuthOtpPending() when otpPending != null:
return otpPending(_that.mobileNumber);case AuthNeedsPin() when needsPin != null:
return needsPin(_that.profile);case AuthAuthed() when authed != null:
return authed(_that.profile);case _:
  return null;

}
}

}

/// @nodoc


class AuthLoggedOut implements AuthState {
  const AuthLoggedOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoggedOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loggedOut()';
}


}




/// @nodoc


class AuthOtpPending implements AuthState {
  const AuthOtpPending({required this.mobileNumber});
  

 final  String mobileNumber;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthOtpPendingCopyWith<AuthOtpPending> get copyWith => _$AuthOtpPendingCopyWithImpl<AuthOtpPending>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthOtpPending&&(identical(other.mobileNumber, mobileNumber) || other.mobileNumber == mobileNumber));
}


@override
int get hashCode => Object.hash(runtimeType,mobileNumber);

@override
String toString() {
  return 'AuthState.otpPending(mobileNumber: $mobileNumber)';
}


}

/// @nodoc
abstract mixin class $AuthOtpPendingCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthOtpPendingCopyWith(AuthOtpPending value, $Res Function(AuthOtpPending) _then) = _$AuthOtpPendingCopyWithImpl;
@useResult
$Res call({
 String mobileNumber
});




}
/// @nodoc
class _$AuthOtpPendingCopyWithImpl<$Res>
    implements $AuthOtpPendingCopyWith<$Res> {
  _$AuthOtpPendingCopyWithImpl(this._self, this._then);

  final AuthOtpPending _self;
  final $Res Function(AuthOtpPending) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mobileNumber = null,}) {
  return _then(AuthOtpPending(
mobileNumber: null == mobileNumber ? _self.mobileNumber : mobileNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthNeedsPin implements AuthState {
  const AuthNeedsPin({required this.profile});
  

 final  UserProfile profile;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthNeedsPinCopyWith<AuthNeedsPin> get copyWith => _$AuthNeedsPinCopyWithImpl<AuthNeedsPin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthNeedsPin&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'AuthState.needsPin(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $AuthNeedsPinCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthNeedsPinCopyWith(AuthNeedsPin value, $Res Function(AuthNeedsPin) _then) = _$AuthNeedsPinCopyWithImpl;
@useResult
$Res call({
 UserProfile profile
});


$UserProfileCopyWith<$Res> get profile;

}
/// @nodoc
class _$AuthNeedsPinCopyWithImpl<$Res>
    implements $AuthNeedsPinCopyWith<$Res> {
  _$AuthNeedsPinCopyWithImpl(this._self, this._then);

  final AuthNeedsPin _self;
  final $Res Function(AuthNeedsPin) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(AuthNeedsPin(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res> get profile {
  
  return $UserProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

/// @nodoc


class AuthAuthed implements AuthState {
  const AuthAuthed({required this.profile});
  

 final  UserProfile profile;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthAuthedCopyWith<AuthAuthed> get copyWith => _$AuthAuthedCopyWithImpl<AuthAuthed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAuthed&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'AuthState.authed(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $AuthAuthedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthAuthedCopyWith(AuthAuthed value, $Res Function(AuthAuthed) _then) = _$AuthAuthedCopyWithImpl;
@useResult
$Res call({
 UserProfile profile
});


$UserProfileCopyWith<$Res> get profile;

}
/// @nodoc
class _$AuthAuthedCopyWithImpl<$Res>
    implements $AuthAuthedCopyWith<$Res> {
  _$AuthAuthedCopyWithImpl(this._self, this._then);

  final AuthAuthed _self;
  final $Res Function(AuthAuthed) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(AuthAuthed(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res> get profile {
  
  return $UserProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

// dart format on
