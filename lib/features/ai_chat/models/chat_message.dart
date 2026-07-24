import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_card_data.dart';

part 'chat_message.freezed.dart';

/// One message in the "Ask Emral" conversation — product.md K1. The variant
/// itself carries the role (mirrors `AuthState`'s shape — no separate
/// role enum needed).
@freezed
sealed class ChatMessage with _$ChatMessage {
  const factory ChatMessage.user({
    required String id,
    required String text,
    required DateTime sentAt,
  }) = ChatUserMessage;

  const factory ChatMessage.assistantText({
    required String id,
    required String text,
    required DateTime sentAt,
  }) = ChatAssistantTextMessage;

  /// [text] is the lead-in line above [card]; empty when the card speaks
  /// for itself.
  const factory ChatMessage.assistantCard({
    required String id,
    required String text,
    required ChatCardData card,
    required DateTime sentAt,
  }) = ChatAssistantCardMessage;
}
