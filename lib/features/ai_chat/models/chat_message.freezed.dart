// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatMessage {

 String get id; String get text; DateTime get sentAt;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,text,sentAt);

@override
String toString() {
  return 'ChatMessage(id: $id, text: $text, sentAt: $sentAt)';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String id, String text, DateTime sentAt
});




}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? sentAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatUserMessage value)?  user,TResult Function( ChatAssistantTextMessage value)?  assistantText,TResult Function( ChatAssistantCardMessage value)?  assistantCard,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatUserMessage() when user != null:
return user(_that);case ChatAssistantTextMessage() when assistantText != null:
return assistantText(_that);case ChatAssistantCardMessage() when assistantCard != null:
return assistantCard(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatUserMessage value)  user,required TResult Function( ChatAssistantTextMessage value)  assistantText,required TResult Function( ChatAssistantCardMessage value)  assistantCard,}){
final _that = this;
switch (_that) {
case ChatUserMessage():
return user(_that);case ChatAssistantTextMessage():
return assistantText(_that);case ChatAssistantCardMessage():
return assistantCard(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatUserMessage value)?  user,TResult? Function( ChatAssistantTextMessage value)?  assistantText,TResult? Function( ChatAssistantCardMessage value)?  assistantCard,}){
final _that = this;
switch (_that) {
case ChatUserMessage() when user != null:
return user(_that);case ChatAssistantTextMessage() when assistantText != null:
return assistantText(_that);case ChatAssistantCardMessage() when assistantCard != null:
return assistantCard(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String text,  DateTime sentAt)?  user,TResult Function( String id,  String text,  DateTime sentAt)?  assistantText,TResult Function( String id,  String text,  ChatCardData card,  DateTime sentAt)?  assistantCard,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatUserMessage() when user != null:
return user(_that.id,_that.text,_that.sentAt);case ChatAssistantTextMessage() when assistantText != null:
return assistantText(_that.id,_that.text,_that.sentAt);case ChatAssistantCardMessage() when assistantCard != null:
return assistantCard(_that.id,_that.text,_that.card,_that.sentAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String text,  DateTime sentAt)  user,required TResult Function( String id,  String text,  DateTime sentAt)  assistantText,required TResult Function( String id,  String text,  ChatCardData card,  DateTime sentAt)  assistantCard,}) {final _that = this;
switch (_that) {
case ChatUserMessage():
return user(_that.id,_that.text,_that.sentAt);case ChatAssistantTextMessage():
return assistantText(_that.id,_that.text,_that.sentAt);case ChatAssistantCardMessage():
return assistantCard(_that.id,_that.text,_that.card,_that.sentAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String text,  DateTime sentAt)?  user,TResult? Function( String id,  String text,  DateTime sentAt)?  assistantText,TResult? Function( String id,  String text,  ChatCardData card,  DateTime sentAt)?  assistantCard,}) {final _that = this;
switch (_that) {
case ChatUserMessage() when user != null:
return user(_that.id,_that.text,_that.sentAt);case ChatAssistantTextMessage() when assistantText != null:
return assistantText(_that.id,_that.text,_that.sentAt);case ChatAssistantCardMessage() when assistantCard != null:
return assistantCard(_that.id,_that.text,_that.card,_that.sentAt);case _:
  return null;

}
}

}

/// @nodoc


class ChatUserMessage implements ChatMessage {
  const ChatUserMessage({required this.id, required this.text, required this.sentAt});
  

@override final  String id;
@override final  String text;
@override final  DateTime sentAt;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatUserMessageCopyWith<ChatUserMessage> get copyWith => _$ChatUserMessageCopyWithImpl<ChatUserMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatUserMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,text,sentAt);

@override
String toString() {
  return 'ChatMessage.user(id: $id, text: $text, sentAt: $sentAt)';
}


}

/// @nodoc
abstract mixin class $ChatUserMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory $ChatUserMessageCopyWith(ChatUserMessage value, $Res Function(ChatUserMessage) _then) = _$ChatUserMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, DateTime sentAt
});




}
/// @nodoc
class _$ChatUserMessageCopyWithImpl<$Res>
    implements $ChatUserMessageCopyWith<$Res> {
  _$ChatUserMessageCopyWithImpl(this._self, this._then);

  final ChatUserMessage _self;
  final $Res Function(ChatUserMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? sentAt = null,}) {
  return _then(ChatUserMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class ChatAssistantTextMessage implements ChatMessage {
  const ChatAssistantTextMessage({required this.id, required this.text, required this.sentAt});
  

@override final  String id;
@override final  String text;
@override final  DateTime sentAt;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatAssistantTextMessageCopyWith<ChatAssistantTextMessage> get copyWith => _$ChatAssistantTextMessageCopyWithImpl<ChatAssistantTextMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatAssistantTextMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,text,sentAt);

@override
String toString() {
  return 'ChatMessage.assistantText(id: $id, text: $text, sentAt: $sentAt)';
}


}

/// @nodoc
abstract mixin class $ChatAssistantTextMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory $ChatAssistantTextMessageCopyWith(ChatAssistantTextMessage value, $Res Function(ChatAssistantTextMessage) _then) = _$ChatAssistantTextMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, DateTime sentAt
});




}
/// @nodoc
class _$ChatAssistantTextMessageCopyWithImpl<$Res>
    implements $ChatAssistantTextMessageCopyWith<$Res> {
  _$ChatAssistantTextMessageCopyWithImpl(this._self, this._then);

  final ChatAssistantTextMessage _self;
  final $Res Function(ChatAssistantTextMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? sentAt = null,}) {
  return _then(ChatAssistantTextMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class ChatAssistantCardMessage implements ChatMessage {
  const ChatAssistantCardMessage({required this.id, required this.text, required this.card, required this.sentAt});
  

@override final  String id;
@override final  String text;
 final  ChatCardData card;
@override final  DateTime sentAt;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatAssistantCardMessageCopyWith<ChatAssistantCardMessage> get copyWith => _$ChatAssistantCardMessageCopyWithImpl<ChatAssistantCardMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatAssistantCardMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.card, card) || other.card == card)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,text,card,sentAt);

@override
String toString() {
  return 'ChatMessage.assistantCard(id: $id, text: $text, card: $card, sentAt: $sentAt)';
}


}

/// @nodoc
abstract mixin class $ChatAssistantCardMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory $ChatAssistantCardMessageCopyWith(ChatAssistantCardMessage value, $Res Function(ChatAssistantCardMessage) _then) = _$ChatAssistantCardMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, ChatCardData card, DateTime sentAt
});


$ChatCardDataCopyWith<$Res> get card;

}
/// @nodoc
class _$ChatAssistantCardMessageCopyWithImpl<$Res>
    implements $ChatAssistantCardMessageCopyWith<$Res> {
  _$ChatAssistantCardMessageCopyWithImpl(this._self, this._then);

  final ChatAssistantCardMessage _self;
  final $Res Function(ChatAssistantCardMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? card = null,Object? sentAt = null,}) {
  return _then(ChatAssistantCardMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as ChatCardData,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatCardDataCopyWith<$Res> get card {
  
  return $ChatCardDataCopyWith<$Res>(_self.card, (value) {
    return _then(_self.copyWith(card: value));
  });
}
}

// dart format on
