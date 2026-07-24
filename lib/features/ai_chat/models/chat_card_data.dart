import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/money.dart';
import '../../payment/models/payment_request.dart';

part 'chat_card_data.freezed.dart';

/// Rich card payloads rendered inline in an assistant bubble — design.md §11.
/// Each variant is display-only except the `request` it carries, which is
/// pushed verbatim to the shared payment flow (payment-flow.md) — the card
/// never implements its own confirm/PIN/receipt.
@freezed
sealed class ChatCardData with _$ChatCardData {
  const factory ChatCardData.billReminder({
    required String billerName,
    required String accountLabel,
    required DateTime dueDate,
    required PaymentRequest request,
  }) = ChatBillReminderCard;

  const factory ChatCardData.walletSummary({required Money balance}) =
      ChatWalletSummaryCard;

  const factory ChatCardData.rewardsStatus({
    required int points,
    required int threshold,
  }) = ChatRewardsStatusCard;

  const factory ChatCardData.paymentShortcut({
    required String title,
    required String subtitle,
    required PaymentRequest request,
  }) = ChatPaymentShortcutCard;
}
