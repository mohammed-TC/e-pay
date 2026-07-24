// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// "Ask Emral" conversation state — architecture.md §3 `chatProvider`.
/// Session-only: resets on app restart, same as every other in-memory mock
/// store (architecture.md §8).

@ProviderFor(Chat)
final chatProvider = ChatProvider._();

/// "Ask Emral" conversation state — architecture.md §3 `chatProvider`.
/// Session-only: resets on app restart, same as every other in-memory mock
/// store (architecture.md §8).
final class ChatProvider
    extends $AsyncNotifierProvider<Chat, List<ChatMessage>> {
  /// "Ask Emral" conversation state — architecture.md §3 `chatProvider`.
  /// Session-only: resets on app restart, same as every other in-memory mock
  /// store (architecture.md §8).
  ChatProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatHash();

  @$internal
  @override
  Chat create() => Chat();
}

String _$chatHash() => r'a0e2829f14ca69e2eaeeabc3f734b742179c2cce';

/// "Ask Emral" conversation state — architecture.md §3 `chatProvider`.
/// Session-only: resets on app restart, same as every other in-memory mock
/// store (architecture.md §8).

abstract class _$Chat extends $AsyncNotifier<List<ChatMessage>> {
  FutureOr<List<ChatMessage>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ChatMessage>>, List<ChatMessage>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ChatMessage>>, List<ChatMessage>>,
              AsyncValue<List<ChatMessage>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Whether the assistant's typing-dots indicator is showing — plain UI
/// signal, separate from [Chat]'s message list so the list doesn't need a
/// synthetic "typing" message.

@ProviderFor(ChatTyping)
final chatTypingProvider = ChatTypingProvider._();

/// Whether the assistant's typing-dots indicator is showing — plain UI
/// signal, separate from [Chat]'s message list so the list doesn't need a
/// synthetic "typing" message.
final class ChatTypingProvider extends $NotifierProvider<ChatTyping, bool> {
  /// Whether the assistant's typing-dots indicator is showing — plain UI
  /// signal, separate from [Chat]'s message list so the list doesn't need a
  /// synthetic "typing" message.
  ChatTypingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatTypingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatTypingHash();

  @$internal
  @override
  ChatTyping create() => ChatTyping();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$chatTypingHash() => r'acedcedf063071dabc540071e01e4e3291fa1ce6';

/// Whether the assistant's typing-dots indicator is showing — plain UI
/// signal, separate from [Chat]'s message list so the list doesn't need a
/// synthetic "typing" message.

abstract class _$ChatTyping extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
