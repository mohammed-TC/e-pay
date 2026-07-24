// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentLineItem {

 String get label; Money get amount;
/// Create a copy of PaymentLineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentLineItemCopyWith<PaymentLineItem> get copyWith => _$PaymentLineItemCopyWithImpl<PaymentLineItem>(this as PaymentLineItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentLineItem&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,label,amount);

@override
String toString() {
  return 'PaymentLineItem(label: $label, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $PaymentLineItemCopyWith<$Res>  {
  factory $PaymentLineItemCopyWith(PaymentLineItem value, $Res Function(PaymentLineItem) _then) = _$PaymentLineItemCopyWithImpl;
@useResult
$Res call({
 String label, Money amount
});


$MoneyCopyWith<$Res> get amount;

}
/// @nodoc
class _$PaymentLineItemCopyWithImpl<$Res>
    implements $PaymentLineItemCopyWith<$Res> {
  _$PaymentLineItemCopyWithImpl(this._self, this._then);

  final PaymentLineItem _self;
  final $Res Function(PaymentLineItem) _then;

/// Create a copy of PaymentLineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? amount = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of PaymentLineItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaymentLineItem].
extension PaymentLineItemPatterns on PaymentLineItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentLineItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentLineItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentLineItem value)  $default,){
final _that = this;
switch (_that) {
case _PaymentLineItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentLineItem value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentLineItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  Money amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentLineItem() when $default != null:
return $default(_that.label,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  Money amount)  $default,) {final _that = this;
switch (_that) {
case _PaymentLineItem():
return $default(_that.label,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  Money amount)?  $default,) {final _that = this;
switch (_that) {
case _PaymentLineItem() when $default != null:
return $default(_that.label,_that.amount);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentLineItem implements PaymentLineItem {
  const _PaymentLineItem({required this.label, required this.amount});
  

@override final  String label;
@override final  Money amount;

/// Create a copy of PaymentLineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentLineItemCopyWith<_PaymentLineItem> get copyWith => __$PaymentLineItemCopyWithImpl<_PaymentLineItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentLineItem&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,label,amount);

@override
String toString() {
  return 'PaymentLineItem(label: $label, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$PaymentLineItemCopyWith<$Res> implements $PaymentLineItemCopyWith<$Res> {
  factory _$PaymentLineItemCopyWith(_PaymentLineItem value, $Res Function(_PaymentLineItem) _then) = __$PaymentLineItemCopyWithImpl;
@override @useResult
$Res call({
 String label, Money amount
});


@override $MoneyCopyWith<$Res> get amount;

}
/// @nodoc
class __$PaymentLineItemCopyWithImpl<$Res>
    implements _$PaymentLineItemCopyWith<$Res> {
  __$PaymentLineItemCopyWithImpl(this._self, this._then);

  final _PaymentLineItem _self;
  final $Res Function(_PaymentLineItem) _then;

/// Create a copy of PaymentLineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? amount = null,}) {
  return _then(_PaymentLineItem(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of PaymentLineItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}

/// @nodoc
mixin _$PaymentRequest {

 TxnType get type; String get payeeName; String get payeeSubtitle; List<PaymentLineItem> get lineItems; Money get amount; Money get fee; Map<String, dynamic> get meta;
/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentRequestCopyWith<PaymentRequest> get copyWith => _$PaymentRequestCopyWithImpl<PaymentRequest>(this as PaymentRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentRequest&&(identical(other.type, type) || other.type == type)&&(identical(other.payeeName, payeeName) || other.payeeName == payeeName)&&(identical(other.payeeSubtitle, payeeSubtitle) || other.payeeSubtitle == payeeSubtitle)&&const DeepCollectionEquality().equals(other.lineItems, lineItems)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.fee, fee) || other.fee == fee)&&const DeepCollectionEquality().equals(other.meta, meta));
}


@override
int get hashCode => Object.hash(runtimeType,type,payeeName,payeeSubtitle,const DeepCollectionEquality().hash(lineItems),amount,fee,const DeepCollectionEquality().hash(meta));

@override
String toString() {
  return 'PaymentRequest(type: $type, payeeName: $payeeName, payeeSubtitle: $payeeSubtitle, lineItems: $lineItems, amount: $amount, fee: $fee, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $PaymentRequestCopyWith<$Res>  {
  factory $PaymentRequestCopyWith(PaymentRequest value, $Res Function(PaymentRequest) _then) = _$PaymentRequestCopyWithImpl;
@useResult
$Res call({
 TxnType type, String payeeName, String payeeSubtitle, List<PaymentLineItem> lineItems, Money amount, Money fee, Map<String, dynamic> meta
});


$MoneyCopyWith<$Res> get amount;$MoneyCopyWith<$Res> get fee;

}
/// @nodoc
class _$PaymentRequestCopyWithImpl<$Res>
    implements $PaymentRequestCopyWith<$Res> {
  _$PaymentRequestCopyWithImpl(this._self, this._then);

  final PaymentRequest _self;
  final $Res Function(PaymentRequest) _then;

/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? payeeName = null,Object? payeeSubtitle = null,Object? lineItems = null,Object? amount = null,Object? fee = null,Object? meta = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TxnType,payeeName: null == payeeName ? _self.payeeName : payeeName // ignore: cast_nullable_to_non_nullable
as String,payeeSubtitle: null == payeeSubtitle ? _self.payeeSubtitle : payeeSubtitle // ignore: cast_nullable_to_non_nullable
as String,lineItems: null == lineItems ? _self.lineItems : lineItems // ignore: cast_nullable_to_non_nullable
as List<PaymentLineItem>,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as Money,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}
/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get fee {
  
  return $MoneyCopyWith<$Res>(_self.fee, (value) {
    return _then(_self.copyWith(fee: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaymentRequest].
extension PaymentRequestPatterns on PaymentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentRequest value)  $default,){
final _that = this;
switch (_that) {
case _PaymentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TxnType type,  String payeeName,  String payeeSubtitle,  List<PaymentLineItem> lineItems,  Money amount,  Money fee,  Map<String, dynamic> meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentRequest() when $default != null:
return $default(_that.type,_that.payeeName,_that.payeeSubtitle,_that.lineItems,_that.amount,_that.fee,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TxnType type,  String payeeName,  String payeeSubtitle,  List<PaymentLineItem> lineItems,  Money amount,  Money fee,  Map<String, dynamic> meta)  $default,) {final _that = this;
switch (_that) {
case _PaymentRequest():
return $default(_that.type,_that.payeeName,_that.payeeSubtitle,_that.lineItems,_that.amount,_that.fee,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TxnType type,  String payeeName,  String payeeSubtitle,  List<PaymentLineItem> lineItems,  Money amount,  Money fee,  Map<String, dynamic> meta)?  $default,) {final _that = this;
switch (_that) {
case _PaymentRequest() when $default != null:
return $default(_that.type,_that.payeeName,_that.payeeSubtitle,_that.lineItems,_that.amount,_that.fee,_that.meta);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentRequest implements PaymentRequest {
  const _PaymentRequest({required this.type, required this.payeeName, required this.payeeSubtitle, required final  List<PaymentLineItem> lineItems, required this.amount, required this.fee, final  Map<String, dynamic> meta = const <String, dynamic>{}}): _lineItems = lineItems,_meta = meta;
  

@override final  TxnType type;
@override final  String payeeName;
@override final  String payeeSubtitle;
 final  List<PaymentLineItem> _lineItems;
@override List<PaymentLineItem> get lineItems {
  if (_lineItems is EqualUnmodifiableListView) return _lineItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lineItems);
}

@override final  Money amount;
@override final  Money fee;
 final  Map<String, dynamic> _meta;
@override@JsonKey() Map<String, dynamic> get meta {
  if (_meta is EqualUnmodifiableMapView) return _meta;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_meta);
}


/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentRequestCopyWith<_PaymentRequest> get copyWith => __$PaymentRequestCopyWithImpl<_PaymentRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentRequest&&(identical(other.type, type) || other.type == type)&&(identical(other.payeeName, payeeName) || other.payeeName == payeeName)&&(identical(other.payeeSubtitle, payeeSubtitle) || other.payeeSubtitle == payeeSubtitle)&&const DeepCollectionEquality().equals(other._lineItems, _lineItems)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.fee, fee) || other.fee == fee)&&const DeepCollectionEquality().equals(other._meta, _meta));
}


@override
int get hashCode => Object.hash(runtimeType,type,payeeName,payeeSubtitle,const DeepCollectionEquality().hash(_lineItems),amount,fee,const DeepCollectionEquality().hash(_meta));

@override
String toString() {
  return 'PaymentRequest(type: $type, payeeName: $payeeName, payeeSubtitle: $payeeSubtitle, lineItems: $lineItems, amount: $amount, fee: $fee, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$PaymentRequestCopyWith<$Res> implements $PaymentRequestCopyWith<$Res> {
  factory _$PaymentRequestCopyWith(_PaymentRequest value, $Res Function(_PaymentRequest) _then) = __$PaymentRequestCopyWithImpl;
@override @useResult
$Res call({
 TxnType type, String payeeName, String payeeSubtitle, List<PaymentLineItem> lineItems, Money amount, Money fee, Map<String, dynamic> meta
});


@override $MoneyCopyWith<$Res> get amount;@override $MoneyCopyWith<$Res> get fee;

}
/// @nodoc
class __$PaymentRequestCopyWithImpl<$Res>
    implements _$PaymentRequestCopyWith<$Res> {
  __$PaymentRequestCopyWithImpl(this._self, this._then);

  final _PaymentRequest _self;
  final $Res Function(_PaymentRequest) _then;

/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? payeeName = null,Object? payeeSubtitle = null,Object? lineItems = null,Object? amount = null,Object? fee = null,Object? meta = null,}) {
  return _then(_PaymentRequest(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TxnType,payeeName: null == payeeName ? _self.payeeName : payeeName // ignore: cast_nullable_to_non_nullable
as String,payeeSubtitle: null == payeeSubtitle ? _self.payeeSubtitle : payeeSubtitle // ignore: cast_nullable_to_non_nullable
as String,lineItems: null == lineItems ? _self._lineItems : lineItems // ignore: cast_nullable_to_non_nullable
as List<PaymentLineItem>,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as Money,meta: null == meta ? _self._meta : meta // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}/// Create a copy of PaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get fee {
  
  return $MoneyCopyWith<$Res>(_self.fee, (value) {
    return _then(_self.copyWith(fee: value));
  });
}
}

// dart format on
