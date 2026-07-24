// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BillLineItem {

 String get label; Money get amount;
/// Create a copy of BillLineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillLineItemCopyWith<BillLineItem> get copyWith => _$BillLineItemCopyWithImpl<BillLineItem>(this as BillLineItem, _$identity);

  /// Serializes this BillLineItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillLineItem&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,amount);

@override
String toString() {
  return 'BillLineItem(label: $label, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $BillLineItemCopyWith<$Res>  {
  factory $BillLineItemCopyWith(BillLineItem value, $Res Function(BillLineItem) _then) = _$BillLineItemCopyWithImpl;
@useResult
$Res call({
 String label, Money amount
});


$MoneyCopyWith<$Res> get amount;

}
/// @nodoc
class _$BillLineItemCopyWithImpl<$Res>
    implements $BillLineItemCopyWith<$Res> {
  _$BillLineItemCopyWithImpl(this._self, this._then);

  final BillLineItem _self;
  final $Res Function(BillLineItem) _then;

/// Create a copy of BillLineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? amount = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of BillLineItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amount {
  
  return $MoneyCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// Adds pattern-matching-related methods to [BillLineItem].
extension BillLineItemPatterns on BillLineItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillLineItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillLineItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillLineItem value)  $default,){
final _that = this;
switch (_that) {
case _BillLineItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillLineItem value)?  $default,){
final _that = this;
switch (_that) {
case _BillLineItem() when $default != null:
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
case _BillLineItem() when $default != null:
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
case _BillLineItem():
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
case _BillLineItem() when $default != null:
return $default(_that.label,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BillLineItem implements BillLineItem {
  const _BillLineItem({required this.label, required this.amount});
  factory _BillLineItem.fromJson(Map<String, dynamic> json) => _$BillLineItemFromJson(json);

@override final  String label;
@override final  Money amount;

/// Create a copy of BillLineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillLineItemCopyWith<_BillLineItem> get copyWith => __$BillLineItemCopyWithImpl<_BillLineItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BillLineItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillLineItem&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,amount);

@override
String toString() {
  return 'BillLineItem(label: $label, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$BillLineItemCopyWith<$Res> implements $BillLineItemCopyWith<$Res> {
  factory _$BillLineItemCopyWith(_BillLineItem value, $Res Function(_BillLineItem) _then) = __$BillLineItemCopyWithImpl;
@override @useResult
$Res call({
 String label, Money amount
});


@override $MoneyCopyWith<$Res> get amount;

}
/// @nodoc
class __$BillLineItemCopyWithImpl<$Res>
    implements _$BillLineItemCopyWith<$Res> {
  __$BillLineItemCopyWithImpl(this._self, this._then);

  final _BillLineItem _self;
  final $Res Function(_BillLineItem) _then;

/// Create a copy of BillLineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? amount = null,}) {
  return _then(_BillLineItem(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of BillLineItem
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
mixin _$Bill {

 String get billerAccountId; Money get amountDue; DateTime get dueDate; List<BillLineItem> get lineItems;
/// Create a copy of Bill
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillCopyWith<Bill> get copyWith => _$BillCopyWithImpl<Bill>(this as Bill, _$identity);

  /// Serializes this Bill to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bill&&(identical(other.billerAccountId, billerAccountId) || other.billerAccountId == billerAccountId)&&(identical(other.amountDue, amountDue) || other.amountDue == amountDue)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&const DeepCollectionEquality().equals(other.lineItems, lineItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,billerAccountId,amountDue,dueDate,const DeepCollectionEquality().hash(lineItems));

@override
String toString() {
  return 'Bill(billerAccountId: $billerAccountId, amountDue: $amountDue, dueDate: $dueDate, lineItems: $lineItems)';
}


}

/// @nodoc
abstract mixin class $BillCopyWith<$Res>  {
  factory $BillCopyWith(Bill value, $Res Function(Bill) _then) = _$BillCopyWithImpl;
@useResult
$Res call({
 String billerAccountId, Money amountDue, DateTime dueDate, List<BillLineItem> lineItems
});


$MoneyCopyWith<$Res> get amountDue;

}
/// @nodoc
class _$BillCopyWithImpl<$Res>
    implements $BillCopyWith<$Res> {
  _$BillCopyWithImpl(this._self, this._then);

  final Bill _self;
  final $Res Function(Bill) _then;

/// Create a copy of Bill
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? billerAccountId = null,Object? amountDue = null,Object? dueDate = null,Object? lineItems = null,}) {
  return _then(_self.copyWith(
billerAccountId: null == billerAccountId ? _self.billerAccountId : billerAccountId // ignore: cast_nullable_to_non_nullable
as String,amountDue: null == amountDue ? _self.amountDue : amountDue // ignore: cast_nullable_to_non_nullable
as Money,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,lineItems: null == lineItems ? _self.lineItems : lineItems // ignore: cast_nullable_to_non_nullable
as List<BillLineItem>,
  ));
}
/// Create a copy of Bill
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amountDue {
  
  return $MoneyCopyWith<$Res>(_self.amountDue, (value) {
    return _then(_self.copyWith(amountDue: value));
  });
}
}


/// Adds pattern-matching-related methods to [Bill].
extension BillPatterns on Bill {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bill value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bill() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bill value)  $default,){
final _that = this;
switch (_that) {
case _Bill():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bill value)?  $default,){
final _that = this;
switch (_that) {
case _Bill() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String billerAccountId,  Money amountDue,  DateTime dueDate,  List<BillLineItem> lineItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bill() when $default != null:
return $default(_that.billerAccountId,_that.amountDue,_that.dueDate,_that.lineItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String billerAccountId,  Money amountDue,  DateTime dueDate,  List<BillLineItem> lineItems)  $default,) {final _that = this;
switch (_that) {
case _Bill():
return $default(_that.billerAccountId,_that.amountDue,_that.dueDate,_that.lineItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String billerAccountId,  Money amountDue,  DateTime dueDate,  List<BillLineItem> lineItems)?  $default,) {final _that = this;
switch (_that) {
case _Bill() when $default != null:
return $default(_that.billerAccountId,_that.amountDue,_that.dueDate,_that.lineItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Bill implements Bill {
  const _Bill({required this.billerAccountId, required this.amountDue, required this.dueDate, required final  List<BillLineItem> lineItems}): _lineItems = lineItems;
  factory _Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);

@override final  String billerAccountId;
@override final  Money amountDue;
@override final  DateTime dueDate;
 final  List<BillLineItem> _lineItems;
@override List<BillLineItem> get lineItems {
  if (_lineItems is EqualUnmodifiableListView) return _lineItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lineItems);
}


/// Create a copy of Bill
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillCopyWith<_Bill> get copyWith => __$BillCopyWithImpl<_Bill>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BillToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bill&&(identical(other.billerAccountId, billerAccountId) || other.billerAccountId == billerAccountId)&&(identical(other.amountDue, amountDue) || other.amountDue == amountDue)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&const DeepCollectionEquality().equals(other._lineItems, _lineItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,billerAccountId,amountDue,dueDate,const DeepCollectionEquality().hash(_lineItems));

@override
String toString() {
  return 'Bill(billerAccountId: $billerAccountId, amountDue: $amountDue, dueDate: $dueDate, lineItems: $lineItems)';
}


}

/// @nodoc
abstract mixin class _$BillCopyWith<$Res> implements $BillCopyWith<$Res> {
  factory _$BillCopyWith(_Bill value, $Res Function(_Bill) _then) = __$BillCopyWithImpl;
@override @useResult
$Res call({
 String billerAccountId, Money amountDue, DateTime dueDate, List<BillLineItem> lineItems
});


@override $MoneyCopyWith<$Res> get amountDue;

}
/// @nodoc
class __$BillCopyWithImpl<$Res>
    implements _$BillCopyWith<$Res> {
  __$BillCopyWithImpl(this._self, this._then);

  final _Bill _self;
  final $Res Function(_Bill) _then;

/// Create a copy of Bill
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? billerAccountId = null,Object? amountDue = null,Object? dueDate = null,Object? lineItems = null,}) {
  return _then(_Bill(
billerAccountId: null == billerAccountId ? _self.billerAccountId : billerAccountId // ignore: cast_nullable_to_non_nullable
as String,amountDue: null == amountDue ? _self.amountDue : amountDue // ignore: cast_nullable_to_non_nullable
as Money,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,lineItems: null == lineItems ? _self._lineItems : lineItems // ignore: cast_nullable_to_non_nullable
as List<BillLineItem>,
  ));
}

/// Create a copy of Bill
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get amountDue {
  
  return $MoneyCopyWith<$Res>(_self.amountDue, (value) {
    return _then(_self.copyWith(amountDue: value));
  });
}
}

// dart format on
