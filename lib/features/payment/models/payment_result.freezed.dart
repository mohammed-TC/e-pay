// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentResult()';
}


}

/// @nodoc
class $PaymentResultCopyWith<$Res>  {
$PaymentResultCopyWith(PaymentResult _, $Res Function(PaymentResult) __);
}


/// Adds pattern-matching-related methods to [PaymentResult].
extension PaymentResultPatterns on PaymentResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PaymentSuccess value)?  success,TResult Function( PaymentInsufficientFunds value)?  insufficientFunds,TResult Function( PaymentFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PaymentSuccess() when success != null:
return success(_that);case PaymentInsufficientFunds() when insufficientFunds != null:
return insufficientFunds(_that);case PaymentFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PaymentSuccess value)  success,required TResult Function( PaymentInsufficientFunds value)  insufficientFunds,required TResult Function( PaymentFailed value)  failed,}){
final _that = this;
switch (_that) {
case PaymentSuccess():
return success(_that);case PaymentInsufficientFunds():
return insufficientFunds(_that);case PaymentFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PaymentSuccess value)?  success,TResult? Function( PaymentInsufficientFunds value)?  insufficientFunds,TResult? Function( PaymentFailed value)?  failed,}){
final _that = this;
switch (_that) {
case PaymentSuccess() when success != null:
return success(_that);case PaymentInsufficientFunds() when insufficientFunds != null:
return insufficientFunds(_that);case PaymentFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Txn txn)?  success,TResult Function()?  insufficientFunds,TResult Function( String reason)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PaymentSuccess() when success != null:
return success(_that.txn);case PaymentInsufficientFunds() when insufficientFunds != null:
return insufficientFunds();case PaymentFailed() when failed != null:
return failed(_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Txn txn)  success,required TResult Function()  insufficientFunds,required TResult Function( String reason)  failed,}) {final _that = this;
switch (_that) {
case PaymentSuccess():
return success(_that.txn);case PaymentInsufficientFunds():
return insufficientFunds();case PaymentFailed():
return failed(_that.reason);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Txn txn)?  success,TResult? Function()?  insufficientFunds,TResult? Function( String reason)?  failed,}) {final _that = this;
switch (_that) {
case PaymentSuccess() when success != null:
return success(_that.txn);case PaymentInsufficientFunds() when insufficientFunds != null:
return insufficientFunds();case PaymentFailed() when failed != null:
return failed(_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class PaymentSuccess implements PaymentResult {
  const PaymentSuccess({required this.txn});
  

 final  Txn txn;

/// Create a copy of PaymentResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentSuccessCopyWith<PaymentSuccess> get copyWith => _$PaymentSuccessCopyWithImpl<PaymentSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentSuccess&&(identical(other.txn, txn) || other.txn == txn));
}


@override
int get hashCode => Object.hash(runtimeType,txn);

@override
String toString() {
  return 'PaymentResult.success(txn: $txn)';
}


}

/// @nodoc
abstract mixin class $PaymentSuccessCopyWith<$Res> implements $PaymentResultCopyWith<$Res> {
  factory $PaymentSuccessCopyWith(PaymentSuccess value, $Res Function(PaymentSuccess) _then) = _$PaymentSuccessCopyWithImpl;
@useResult
$Res call({
 Txn txn
});


$TxnCopyWith<$Res> get txn;

}
/// @nodoc
class _$PaymentSuccessCopyWithImpl<$Res>
    implements $PaymentSuccessCopyWith<$Res> {
  _$PaymentSuccessCopyWithImpl(this._self, this._then);

  final PaymentSuccess _self;
  final $Res Function(PaymentSuccess) _then;

/// Create a copy of PaymentResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? txn = null,}) {
  return _then(PaymentSuccess(
txn: null == txn ? _self.txn : txn // ignore: cast_nullable_to_non_nullable
as Txn,
  ));
}

/// Create a copy of PaymentResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TxnCopyWith<$Res> get txn {
  
  return $TxnCopyWith<$Res>(_self.txn, (value) {
    return _then(_self.copyWith(txn: value));
  });
}
}

/// @nodoc


class PaymentInsufficientFunds implements PaymentResult {
  const PaymentInsufficientFunds();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentInsufficientFunds);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentResult.insufficientFunds()';
}


}




/// @nodoc


class PaymentFailed implements PaymentResult {
  const PaymentFailed({required this.reason});
  

 final  String reason;

/// Create a copy of PaymentResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentFailedCopyWith<PaymentFailed> get copyWith => _$PaymentFailedCopyWithImpl<PaymentFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentFailed&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'PaymentResult.failed(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $PaymentFailedCopyWith<$Res> implements $PaymentResultCopyWith<$Res> {
  factory $PaymentFailedCopyWith(PaymentFailed value, $Res Function(PaymentFailed) _then) = _$PaymentFailedCopyWithImpl;
@useResult
$Res call({
 String reason
});




}
/// @nodoc
class _$PaymentFailedCopyWithImpl<$Res>
    implements $PaymentFailedCopyWith<$Res> {
  _$PaymentFailedCopyWithImpl(this._self, this._then);

  final PaymentFailed _self;
  final $Res Function(PaymentFailed) _then;

/// Create a copy of PaymentResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(PaymentFailed(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
