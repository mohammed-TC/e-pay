import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/locale_provider.dart';
import '../../../core/utils/mock_latency.dart';
import '../../../l10n/app_localizations.dart';
import '../../payment/models/payment_request.dart';
import '../../payment/models/payment_result.dart';
import '../models/chat_message.dart';
import 'chat_intent_engine.dart';

part 'chat_provider.g.dart';

/// "Ask Emral" conversation state — architecture.md §3 `chatProvider`.
/// Session-only: resets on app restart, same as every other in-memory mock
/// store (architecture.md §8). Also holds the current [PendingOffer]
/// dialogue context (product.md K1 proactive nudges) — private notifier
/// fields, not provider state, since nothing outside `send`/
/// `onPaymentCompleted` needs to watch it.
@riverpod
class Chat extends _$Chat {
  PendingOffer _pendingOffer = PendingOffer.none;
  String? _pendingAccountId;
  String? _pendingVehicleId;
  bool _autoPayExplained = false;

  void _clearPending() {
    _pendingOffer = PendingOffer.none;
    _pendingAccountId = null;
    _pendingVehicleId = null;
    _autoPayExplained = false;
  }

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

  /// Appends [text] as a user turn, then a reply — the typing indicator
  /// (`chatTypingProvider`) brackets the "thinking" delay. When a
  /// [PendingOffer] is open and the reply isn't a forced quick-reply chip,
  /// the input resolves the offer (yes/no/later) instead of running the
  /// keyword intent engine.
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

    List<ChatMessage> reply;
    if (forcedIntent == null && _pendingOffer != PendingOffer.none) {
      final l10n = await AppLocalizations.delegate.load(locale);
      final resolution = resolveAffirmation(text);
      final result = await resolvePendingOffer(
        ref: ref,
        l10n: l10n,
        offer: _pendingOffer,
        resolution: resolution,
        accountId: _pendingAccountId,
        vehicleId: _pendingVehicleId,
        autoPayExplained: _autoPayExplained,
      );
      _pendingOffer = result.offer;
      _pendingAccountId = result.accountId;
      _pendingVehicleId = result.vehicleId;
      _autoPayExplained = result.autoPayExplained;
      reply = result.messages;
    } else {
      _clearPending();
      reply = await buildAssistantReply(
        ref: ref,
        locale: locale,
        rawInput: text,
        forcedIntent: forcedIntent,
      );
    }
    ref.read(chatTypingProvider.notifier).isTyping = false;

    final afterReply = state.value ?? const <ChatMessage>[];
    state = AsyncData([...afterReply, ...reply]);
  }

  /// Called by a chat card tile once its shared-payment-flow push returns —
  /// `bill_reminder_tile.dart` / `payment_shortcut_tile.dart`. On success,
  /// acknowledges the payment then opens a proactive follow-up nudge
  /// (product.md K1) if one applies.
  Future<void> onPaymentCompleted(
    PaymentResult result,
    PaymentRequest request,
  ) async {
    if (result is! PaymentSuccess) return;

    final locale = ref.read(appLocaleProvider);
    final l10n = await AppLocalizations.delegate.load(locale);
    final current = state.value ?? const <ChatMessage>[];
    state = AsyncData([
      ...current,
      ChatMessage.assistantText(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        text: l10n.chatPaymentCompletedAck(request.payeeName),
        sentAt: DateTime.now(),
      ),
    ]);

    final accountId = request.meta['billerAccountId'] as String?;
    final nudge = await buildPostPaymentNudge(
      ref: ref,
      l10n: l10n,
      locale: locale,
      completedType: request.type,
      completedAccountId: accountId,
    );
    if (nudge == null) return;

    _pendingOffer = nudge.offer;
    _pendingAccountId = nudge.accountId;
    _pendingVehicleId = nudge.vehicleId;
    _autoPayExplained = nudge.autoPayExplained;

    final afterAck = state.value ?? const <ChatMessage>[];
    state = AsyncData([...afterAck, ...nudge.messages]);
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
