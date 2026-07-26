import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/locale_provider.dart';
import '../../../core/models/money.dart';
import '../../../core/models/txn_type.dart';
import '../../../core/utils/mock_latency.dart';
import '../../../data/repositories/rewards_repository.dart';
import '../../../l10n/app_localizations.dart';
import '../../payment/models/payment_request.dart';
import '../../payment/models/payment_result.dart';
import '../../rental/models/rental_booking.dart';
import '../../rental/providers/rental_bookings_provider.dart';
import '../../rewards/providers/rewards_provider.dart';
import '../models/chat_message.dart';
import 'chat_intent_engine.dart';
import 'chat_rental_flow.dart';

part 'chat_provider.g.dart';

/// Mirrors `Money.format(context)` without a `BuildContext` — same
/// workaround as `chat_intent_engine.dart`'s `_formatMoney`.
String _formatMoney(Money money, Locale locale) {
  final formatter = NumberFormat.decimalPatternDigits(
    locale: locale.toString(),
    decimalDigits: 3,
  );
  return '${formatter.format(money.amount)} ${money.currencyCode}';
}

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

  /// Scenario 2 (product.md K1, Module L) dialogue-in-progress — set by
  /// `send()` when `ChatIntent.rentalBooking` fires, cleared once the
  /// booking's payment succeeds (`onPaymentCompleted`). Kept separate from
  /// [_pendingOffer] since it carries far more state (location, dates,
  /// running totals) than a plain yes/no/later offer.
  RentalChatContext? _rentalContext;

  void _clearPending() {
    _pendingOffer = PendingOffer.none;
    _pendingAccountId = null;
    _pendingVehicleId = null;
    _autoPayExplained = false;
    // A forced quick-reply (or a fresh keyword intent) while Scenario 2 is
    // mid-dialogue means the user went off-script — abandon it rather than
    // silently resuming stale context on their next free-text turn.
    _rentalContext = null;
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
    if (forcedIntent == null && _rentalContext != null) {
      final l10n = await AppLocalizations.delegate.load(locale);
      final result = await stepRentalFlow(
        ref: ref,
        l10n: l10n,
        locale: locale,
        context: _rentalContext!,
        input: text,
      );
      _rentalContext = result.context;
      reply = result.messages;
    } else if (forcedIntent == null && _pendingOffer != PendingOffer.none) {
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
      final intent = forcedIntent ?? detectIntent(text);
      if (intent == ChatIntent.rentalBooking) {
        final l10n = await AppLocalizations.delegate.load(locale);
        final started = startRentalBooking(l10n: l10n);
        _rentalContext = started.context;
        reply = started.messages;
      } else {
        reply = await buildAssistantReply(
          ref: ref,
          locale: locale,
          rawInput: text,
          forcedIntent: intent,
        );
      }
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

    if (request.type == TxnType.carRental) {
      await _completeRentalBooking(result, request);
      return;
    }

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

  /// Scenario 2's terminal step — the summary/receipt text only appears
  /// after the shared payment flow actually succeeds (payment-flow.md:
  /// never simulate this inline). Credits the loyalty-multiplier bonus on
  /// top of `PaymentService`'s already-credited base 1 pt/OMR, and saves a
  /// [RentalBooking] so it shows up in L5 My Rentals — the same record
  /// Module L's own booking-review screen would save.
  Future<void> _completeRentalBooking(
    PaymentSuccess result,
    PaymentRequest request,
  ) async {
    final rentalContext = _rentalContext;
    _rentalContext = null;
    if (rentalContext == null) return;

    final locale = ref.read(appLocaleProvider);
    final l10n = await AppLocalizations.delegate.load(locale);

    final bonusPoints = request.meta['rentalBonusPoints'] as int? ?? 0;
    if (bonusPoints > 0) {
      ref.read(rewardsRepositoryProvider).credit(bonusPoints);
      await ref.read(appRewardsProvider.notifier).refresh();
    }
    final totalEarned = result.txn.rewardPointsEarned + bonusPoints;

    await ref
        .read(rentalBookingsProvider.notifier)
        .add(
          RentalBooking(
            id: result.txn.id,
            locationId: rentalContext.locationId ?? '',
            locationName: rentalContext.locationName ?? '',
            vehicleClassId: rentalContext.vehicleClassId ?? '',
            vehicleClassName: rentalContext.vehicleClassName ?? '',
            pickupDate: rentalContext.pickupDate ?? DateTime.now(),
            returnDate: rentalContext.returnDate ?? DateTime.now(),
            days: rentalContext.days,
            baseCost: rentalContext.subtotal,
            addonNames: rentalContext.addonNames,
            addonsCost: rentalContext.addonsCost,
            pointsRedeemed: rentalContext.pointsRedeemed,
            pointsDiscount: rentalContext.pointsDiscount,
            total: rentalContext.total,
            pointsEarned: totalEarned,
            bookedAt: DateTime.now(),
          ),
        );

    final insuranceLabel = rentalContext.addonSelected
        ? l10n.chatRentalSummaryInsuranceIncluded
        : l10n.chatRentalSummaryInsuranceNotIncluded;

    final current = state.value ?? const <ChatMessage>[];
    final now = DateTime.now();
    state = AsyncData([
      ...current,
      ChatMessage.assistantText(
        id: '${now.microsecondsSinceEpoch}_summary',
        text: l10n.chatRentalSummaryTitle(
          rentalContext.vehicleClassName ?? '',
          _formatMoney(rentalContext.subtotal, locale),
          _formatMoney(rentalContext.pointsDiscount, locale),
          insuranceLabel,
          _formatMoney(rentalContext.total, locale),
        ),
        sentAt: now,
      ),
      ChatMessage.assistantText(
        id: '${now.microsecondsSinceEpoch}_earned',
        text: l10n.chatRentalSummaryEarned(totalEarned),
        sentAt: now,
      ),
      ChatMessage.assistantText(
        id: '${now.microsecondsSinceEpoch}_receipt',
        text: l10n.chatRentalSummaryReceiptSent,
        sentAt: now,
      ),
    ]);
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
