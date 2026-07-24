// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_card_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatCardData {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCardData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatCardData()';
}


}

/// @nodoc
class $ChatCardDataCopyWith<$Res>  {
$ChatCardDataCopyWith(ChatCardData _, $Res Function(ChatCardData) __);
}


/// Adds pattern-matching-related methods to [ChatCardData].
extension ChatCardDataPatterns on ChatCardData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatBillReminderCard value)?  billReminder,TResult Function( ChatWalletSummaryCard value)?  walletSummary,TResult Function( ChatRewardsStatusCard value)?  rewardsStatus,TResult Function( ChatPaymentShortcutCard value)?  paymentShortcut,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatBillReminderCard() when billReminder != null:
return billReminder(_that);case ChatWalletSummaryCard() when walletSummary != null:
return walletSummary(_that);case ChatRewardsStatusCard() when rewardsStatus != null:
return rewardsStatus(_that);case ChatPaymentShortcutCard() when paymentShortcut != null:
return paymentShortcut(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatBillReminderCard value)  billReminder,required TResult Function( ChatWalletSummaryCard value)  walletSummary,required TResult Function( ChatRewardsStatusCard value)  rewardsStatus,required TResult Function( ChatPaymentShortcutCard value)  paymentShortcut,}){
final _that = this;
switch (_that) {
case ChatBillReminderCard():
return billReminder(_that);case ChatWalletSummaryCard():
return walletSummary(_that);case ChatRewardsStatusCard():
return rewardsStatus(_that);case ChatPaymentShortcutCard():
return paymentShortcut(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatBillReminderCard value)?  billReminder,TResult? Function( ChatWalletSummaryCard value)?  walletSummary,TResult? Function( ChatRewardsStatusCard value)?  rewardsStatus,TResult? Function( ChatPaymentShortcutCard value)?  paymentShortcut,}){
final _that = this;
switch (_that) {
case ChatBillReminderCard() when billReminder != null:
return billReminder(_that);case ChatWalletSummaryCard() when walletSummary != null:
return walletSummary(_that);case ChatRewardsStatusCard() when rewardsStatus != null:
return rewardsStatus(_that);case ChatPaymentShortcutCard() when paymentShortcut != null:
return paymentShortcut(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String billerName,  String accountLabel,  DateTime dueDate,  PaymentRequest request)?  billReminder,TResult Function( Money balance)?  walletSummary,TResult Function( int points,  int threshold)?  rewardsStatus,TResult Function( String title,  String subtitle,  PaymentRequest request)?  paymentShortcut,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatBillReminderCard() when billReminder != null:
return billReminder(_that.billerName,_that.accountLabel,_that.dueDate,_that.request);case ChatWalletSummaryCard() when walletSummary != null:
return walletSummary(_that.balance);case ChatRewardsStatusCard() when rewardsStatus != null:
return rewardsStatus(_that.points,_that.threshold);case ChatPaymentShortcutCard() when paymentShortcut != null:
return paymentShortcut(_that.title,_that.subtitle,_that.request);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String billerName,  String accountLabel,  DateTime dueDate,  PaymentRequest request)  billReminder,required TResult Function( Money balance)  walletSummary,required TResult Function( int points,  int threshold)  rewardsStatus,required TResult Function( String title,  String subtitle,  PaymentRequest request)  paymentShortcut,}) {final _that = this;
switch (_that) {
case ChatBillReminderCard():
return billReminder(_that.billerName,_that.accountLabel,_that.dueDate,_that.request);case ChatWalletSummaryCard():
return walletSummary(_that.balance);case ChatRewardsStatusCard():
return rewardsStatus(_that.points,_that.threshold);case ChatPaymentShortcutCard():
return paymentShortcut(_that.title,_that.subtitle,_that.request);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String billerName,  String accountLabel,  DateTime dueDate,  PaymentRequest request)?  billReminder,TResult? Function( Money balance)?  walletSummary,TResult? Function( int points,  int threshold)?  rewardsStatus,TResult? Function( String title,  String subtitle,  PaymentRequest request)?  paymentShortcut,}) {final _that = this;
switch (_that) {
case ChatBillReminderCard() when billReminder != null:
return billReminder(_that.billerName,_that.accountLabel,_that.dueDate,_that.request);case ChatWalletSummaryCard() when walletSummary != null:
return walletSummary(_that.balance);case ChatRewardsStatusCard() when rewardsStatus != null:
return rewardsStatus(_that.points,_that.threshold);case ChatPaymentShortcutCard() when paymentShortcut != null:
return paymentShortcut(_that.title,_that.subtitle,_that.request);case _:
  return null;

}
}

}

/// @nodoc


class ChatBillReminderCard implements ChatCardData {
  const ChatBillReminderCard({required this.billerName, required this.accountLabel, required this.dueDate, required this.request});
  

 final  String billerName;
 final  String accountLabel;
 final  DateTime dueDate;
 final  PaymentRequest request;

/// Create a copy of ChatCardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatBillReminderCardCopyWith<ChatBillReminderCard> get copyWith => _$ChatBillReminderCardCopyWithImpl<ChatBillReminderCard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatBillReminderCard&&(identical(other.billerName, billerName) || other.billerName == billerName)&&(identical(other.accountLabel, accountLabel) || other.accountLabel == accountLabel)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,billerName,accountLabel,dueDate,request);

@override
String toString() {
  return 'ChatCardData.billReminder(billerName: $billerName, accountLabel: $accountLabel, dueDate: $dueDate, request: $request)';
}


}

/// @nodoc
abstract mixin class $ChatBillReminderCardCopyWith<$Res> implements $ChatCardDataCopyWith<$Res> {
  factory $ChatBillReminderCardCopyWith(ChatBillReminderCard value, $Res Function(ChatBillReminderCard) _then) = _$ChatBillReminderCardCopyWithImpl;
@useResult
$Res call({
 String billerName, String accountLabel, DateTime dueDate, PaymentRequest request
});


$PaymentRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$ChatBillReminderCardCopyWithImpl<$Res>
    implements $ChatBillReminderCardCopyWith<$Res> {
  _$ChatBillReminderCardCopyWithImpl(this._self, this._then);

  final ChatBillReminderCard _self;
  final $Res Function(ChatBillReminderCard) _then;

/// Create a copy of ChatCardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? billerName = null,Object? accountLabel = null,Object? dueDate = null,Object? request = null,}) {
  return _then(ChatBillReminderCard(
billerName: null == billerName ? _self.billerName : billerName // ignore: cast_nullable_to_non_nullable
as String,accountLabel: null == accountLabel ? _self.accountLabel : accountLabel // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as PaymentRequest,
  ));
}

/// Create a copy of ChatCardData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentRequestCopyWith<$Res> get request {
  
  return $PaymentRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class ChatWalletSummaryCard implements ChatCardData {
  const ChatWalletSummaryCard({required this.balance});
  

 final  Money balance;

/// Create a copy of ChatCardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatWalletSummaryCardCopyWith<ChatWalletSummaryCard> get copyWith => _$ChatWalletSummaryCardCopyWithImpl<ChatWalletSummaryCard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatWalletSummaryCard&&(identical(other.balance, balance) || other.balance == balance));
}


@override
int get hashCode => Object.hash(runtimeType,balance);

@override
String toString() {
  return 'ChatCardData.walletSummary(balance: $balance)';
}


}

/// @nodoc
abstract mixin class $ChatWalletSummaryCardCopyWith<$Res> implements $ChatCardDataCopyWith<$Res> {
  factory $ChatWalletSummaryCardCopyWith(ChatWalletSummaryCard value, $Res Function(ChatWalletSummaryCard) _then) = _$ChatWalletSummaryCardCopyWithImpl;
@useResult
$Res call({
 Money balance
});


$MoneyCopyWith<$Res> get balance;

}
/// @nodoc
class _$ChatWalletSummaryCardCopyWithImpl<$Res>
    implements $ChatWalletSummaryCardCopyWith<$Res> {
  _$ChatWalletSummaryCardCopyWithImpl(this._self, this._then);

  final ChatWalletSummaryCard _self;
  final $Res Function(ChatWalletSummaryCard) _then;

/// Create a copy of ChatCardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? balance = null,}) {
  return _then(ChatWalletSummaryCard(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of ChatCardData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get balance {
  
  return $MoneyCopyWith<$Res>(_self.balance, (value) {
    return _then(_self.copyWith(balance: value));
  });
}
}

/// @nodoc


class ChatRewardsStatusCard implements ChatCardData {
  const ChatRewardsStatusCard({required this.points, required this.threshold});
  

 final  int points;
 final  int threshold;

/// Create a copy of ChatCardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRewardsStatusCardCopyWith<ChatRewardsStatusCard> get copyWith => _$ChatRewardsStatusCardCopyWithImpl<ChatRewardsStatusCard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRewardsStatusCard&&(identical(other.points, points) || other.points == points)&&(identical(other.threshold, threshold) || other.threshold == threshold));
}


@override
int get hashCode => Object.hash(runtimeType,points,threshold);

@override
String toString() {
  return 'ChatCardData.rewardsStatus(points: $points, threshold: $threshold)';
}


}

/// @nodoc
abstract mixin class $ChatRewardsStatusCardCopyWith<$Res> implements $ChatCardDataCopyWith<$Res> {
  factory $ChatRewardsStatusCardCopyWith(ChatRewardsStatusCard value, $Res Function(ChatRewardsStatusCard) _then) = _$ChatRewardsStatusCardCopyWithImpl;
@useResult
$Res call({
 int points, int threshold
});




}
/// @nodoc
class _$ChatRewardsStatusCardCopyWithImpl<$Res>
    implements $ChatRewardsStatusCardCopyWith<$Res> {
  _$ChatRewardsStatusCardCopyWithImpl(this._self, this._then);

  final ChatRewardsStatusCard _self;
  final $Res Function(ChatRewardsStatusCard) _then;

/// Create a copy of ChatCardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? points = null,Object? threshold = null,}) {
  return _then(ChatRewardsStatusCard(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ChatPaymentShortcutCard implements ChatCardData {
  const ChatPaymentShortcutCard({required this.title, required this.subtitle, required this.request});
  

 final  String title;
 final  String subtitle;
 final  PaymentRequest request;

/// Create a copy of ChatCardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatPaymentShortcutCardCopyWith<ChatPaymentShortcutCard> get copyWith => _$ChatPaymentShortcutCardCopyWithImpl<ChatPaymentShortcutCard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatPaymentShortcutCard&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,request);

@override
String toString() {
  return 'ChatCardData.paymentShortcut(title: $title, subtitle: $subtitle, request: $request)';
}


}

/// @nodoc
abstract mixin class $ChatPaymentShortcutCardCopyWith<$Res> implements $ChatCardDataCopyWith<$Res> {
  factory $ChatPaymentShortcutCardCopyWith(ChatPaymentShortcutCard value, $Res Function(ChatPaymentShortcutCard) _then) = _$ChatPaymentShortcutCardCopyWithImpl;
@useResult
$Res call({
 String title, String subtitle, PaymentRequest request
});


$PaymentRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$ChatPaymentShortcutCardCopyWithImpl<$Res>
    implements $ChatPaymentShortcutCardCopyWith<$Res> {
  _$ChatPaymentShortcutCardCopyWithImpl(this._self, this._then);

  final ChatPaymentShortcutCard _self;
  final $Res Function(ChatPaymentShortcutCard) _then;

/// Create a copy of ChatCardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = null,Object? request = null,}) {
  return _then(ChatPaymentShortcutCard(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as PaymentRequest,
  ));
}

/// Create a copy of ChatCardData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentRequestCopyWith<$Res> get request {
  
  return $PaymentRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

// dart format on
