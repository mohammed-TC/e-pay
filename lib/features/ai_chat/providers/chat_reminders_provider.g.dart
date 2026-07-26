// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_reminders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Topic keys the assistant has already nudged about or the user deferred
/// this session — product.md K1 proactive nudges. Mock-only: no real
/// reminder backend (product.md §7 excludes push notifications), this just
/// stops the same nudge repeating every session, mirroring [ChatTyping]'s
/// plain in-memory UI-signal shape (`chat_provider.dart`).

@ProviderFor(ChatReminders)
final chatRemindersProvider = ChatRemindersProvider._();

/// Topic keys the assistant has already nudged about or the user deferred
/// this session — product.md K1 proactive nudges. Mock-only: no real
/// reminder backend (product.md §7 excludes push notifications), this just
/// stops the same nudge repeating every session, mirroring [ChatTyping]'s
/// plain in-memory UI-signal shape (`chat_provider.dart`).
final class ChatRemindersProvider
    extends $NotifierProvider<ChatReminders, Set<String>> {
  /// Topic keys the assistant has already nudged about or the user deferred
  /// this session — product.md K1 proactive nudges. Mock-only: no real
  /// reminder backend (product.md §7 excludes push notifications), this just
  /// stops the same nudge repeating every session, mirroring [ChatTyping]'s
  /// plain in-memory UI-signal shape (`chat_provider.dart`).
  ChatRemindersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatRemindersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatRemindersHash();

  @$internal
  @override
  ChatReminders create() => ChatReminders();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$chatRemindersHash() => r'931f63cd6dbc6fcb75faa23629efc74065af4911';

/// Topic keys the assistant has already nudged about or the user deferred
/// this session — product.md K1 proactive nudges. Mock-only: no real
/// reminder backend (product.md §7 excludes push notifications), this just
/// stops the same nudge repeating every session, mirroring [ChatTyping]'s
/// plain in-memory UI-signal shape (`chat_provider.dart`).

abstract class _$ChatReminders extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
