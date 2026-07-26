import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_reminders_provider.g.dart';

/// Topic keys the assistant has already nudged about or the user deferred
/// this session — product.md K1 proactive nudges. Mock-only: no real
/// reminder backend (product.md §7 excludes push notifications), this just
/// stops the same nudge repeating every session, mirroring [ChatTyping]'s
/// plain in-memory UI-signal shape (`chat_provider.dart`).
@riverpod
class ChatReminders extends _$ChatReminders {
  @override
  Set<String> build() => const {};

  void markSeen(String key) => state = {...state, key};

  bool hasSeen(String key) => state.contains(key);
}
