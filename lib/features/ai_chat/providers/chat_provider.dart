import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/locale_provider.dart';
import '../../../core/utils/mock_latency.dart';
import '../../../l10n/app_localizations.dart';
import '../models/chat_message.dart';
import 'chat_intent_engine.dart';

part 'chat_provider.g.dart';

/// "Ask Emral" conversation state — architecture.md §3 `chatProvider`.
/// Session-only: resets on app restart, same as every other in-memory mock
/// store (architecture.md §8).
@riverpod
class Chat extends _$Chat {
  @override
  Future<List<ChatMessage>> build() async {
    await simulateLatency();
    final locale = ref.read(appLocaleProvider);
    final l10n = await AppLocalizations.delegate.load(locale);
    return [
      ChatMessage.assistantText(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        text: l10n.chatReplyGreeting,
        sentAt: DateTime.now(),
      ),
    ];
  }

  /// Appends [text] as a user turn, then the engine's reply — the typing
  /// indicator (`chatTypingProvider`) brackets the "thinking" delay.
  Future<void> send(String text, {ChatIntent? forcedIntent}) async {
    final current = state.value ?? const <ChatMessage>[];
    final userMessage = ChatMessage.user(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      text: text,
      sentAt: DateTime.now(),
    );
    state = AsyncData([...current, userMessage]);

    ref.read(chatTypingProvider.notifier).isTyping = true;
    await simulateLatency();
    final locale = ref.read(appLocaleProvider);
    final reply = await buildAssistantReply(
      ref: ref,
      locale: locale,
      rawInput: text,
      forcedIntent: forcedIntent,
    );
    ref.read(chatTypingProvider.notifier).isTyping = false;

    final afterReply = state.value ?? const <ChatMessage>[];
    state = AsyncData([...afterReply, ...reply]);
  }
}

/// Whether the assistant's typing-dots indicator is showing — plain UI
/// signal, separate from [Chat]'s message list so the list doesn't need a
/// synthetic "typing" message.
@riverpod
class ChatTyping extends _$ChatTyping {
  @override
  bool build() => false;

  bool get isTyping => state;

  set isTyping(bool value) => state = value;
}
