import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../models/chat_card_data.dart';
import '../models/chat_message.dart';
import '../providers/chat_intent_engine.dart';
import '../providers/chat_provider.dart';
import '../widgets/bill_reminder_tile.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/chat_quick_reply_row.dart';
import '../widgets/chat_typing_indicator.dart';
import '../widgets/payment_shortcut_tile.dart';
import '../widgets/rewards_status_tile.dart';
import '../widgets/wallet_summary_tile.dart';

/// Screen K1 — Assistant Chat ("Ask Emral")
///
/// Rule-based (offline) conversation over existing mock data — product.md
/// K1. Free text and quick-reply chips both flow through
/// `chatProvider.send`; rich cards render inline and hand any money action
/// to the shared payment flow, never confirming it themselves
/// (payment-flow.md).
class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      unawaited(
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
        ),
      );
    });
  }

  Future<void> _send(String text, {ChatIntent? forcedIntent}) async {
    _scrollToBottom();
    await ref
        .read(chatProvider.notifier)
        .send(text, forcedIntent: forcedIntent);
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final messagesAsync = ref.watch(chatProvider);
    final isTyping = ref.watch(chatTypingProvider);

    return NPScaffold(
      applyGutter: false,
      appBar: AppBar(title: Text(l10n.chatScreenTitle)),
      body: Column(
        children: [
          Expanded(
            child: messagesAsync.when(
              data: (messages) {
                _scrollToBottom();
                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.gutter,
                    vertical: AppSpacing.lg,
                  ),
                  itemCount: messages.length + (isTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == messages.length) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: AppSpacing.md),
                        child: ChatTypingIndicator(),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: _MessageView(message: messages[index]),
                    );
                  },
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.gutter,
                  vertical: AppSpacing.lg,
                ),
                child: Column(
                  children: [
                    NPShimmer(height: 56),
                    SizedBox(height: AppSpacing.md),
                    NPShimmer(height: 56),
                  ],
                ),
              ),
              error: (error, stackTrace) => NPErrorState(
                title: l10n.chatErrorTitle,
                body: l10n.chatErrorBody,
                onRetry: () => ref.invalidate(chatProvider),
                retryLabel: l10n.chatErrorRetry,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.gutter,
              0,
              AppSpacing.gutter,
              AppSpacing.md,
            ),
            child: Column(
              children: [
                ChatQuickReplyRow(
                  onSelect: (intent, label) =>
                      unawaited(_send(label, forcedIntent: intent)),
                ),
                const SizedBox(height: AppSpacing.sm),
                ChatInputBar(onSend: (text) => unawaited(_send(text))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageView extends StatelessWidget {
  const _MessageView({required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return switch (message) {
      ChatUserMessage(:final text) => ChatBubble(text: text, isUser: true),
      ChatAssistantTextMessage(:final text) => ChatBubble(
        text: text,
        isUser: false,
      ),
      ChatAssistantCardMessage(:final text, :final card) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (text.isNotEmpty) ...[
            ChatBubble(text: text, isUser: false),
            const SizedBox(height: AppSpacing.sm),
          ],
          SizedBox(
            width: double.infinity,
            child: _CardView(card: card),
          ),
        ],
      ),
    };
  }
}

class _CardView extends StatelessWidget {
  const _CardView({required this.card});

  final ChatCardData card;

  @override
  Widget build(BuildContext context) {
    // Switching on a local (not `this.card` directly) so Dart can promote
    // the type in each arm — field accesses don't get flow-promoted.
    final data = card;
    return switch (data) {
      ChatBillReminderCard() => BillReminderTile(data: data),
      ChatWalletSummaryCard() => WalletSummaryTile(data: data),
      ChatRewardsStatusCard() => RewardsStatusTile(data: data),
      ChatPaymentShortcutCard() => PaymentShortcutTile(data: data),
    };
  }
}
