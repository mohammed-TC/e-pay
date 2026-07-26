import 'package:flutter/material.dart';

import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_chip.dart';
import '../providers/chat_intent_engine.dart';

/// Fixed, reliable quick-reply chips — design.md §11. Deliberately limited to
/// the read-only intents (no free-text entity resolution needed) so every
/// chip is guaranteed a good answer, unlike free-typed pay/send requests.
class ChatQuickReplyRow extends StatelessWidget {
  const ChatQuickReplyRow({required this.onSelect, super.key});

  final void Function(ChatIntent intent, String label) onSelect;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final items = <(ChatIntent, String, IconData)>[
      (
        ChatIntent.billsDue,
        l10n.chatQuickReplyBills,
        Icons.receipt_long_outlined,
      ),
      (
        ChatIntent.walletBalance,
        l10n.chatQuickReplyBalance,
        Icons.account_balance_wallet_outlined,
      ),
      (
        ChatIntent.rewardsStatus,
        l10n.chatQuickReplyRewards,
        Icons.card_giftcard_outlined,
      ),
      (ChatIntent.recentTxns, l10n.chatQuickReplyTxns, Icons.history),
      (
        ChatIntent.rentalBooking,
        l10n.chatQuickReplyRentalCar,
        Icons.car_rental,
      ),
    ];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, index) {
          final (intent, label, icon) = items[index];
          return NPChip(
            label: label,
            icon: icon,
            onTap: () => onSelect(intent, label),
          );
        },
      ),
    );
  }
}
