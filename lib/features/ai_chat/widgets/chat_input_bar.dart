import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_plate.dart';
import '../../../core/widgets/np_text_field.dart';

/// Input row — design.md §11. Mic icon is a mock affordance (voice input is
/// out of scope for this offline prototype, product.md §7); send is a
/// circular plate, never a Material send button.
class ChatInputBar extends StatefulWidget {
  const ChatInputBar({required this.onSend, super.key});

  final ValueChanged<String> onSend;

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final _controller = TextEditingController();

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSend(text);
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).extension<AppColors>()!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: NPTextField(
            controller: _controller,
            hint: l10n.chatInputHint,
            textInputAction: TextInputAction.send,
            onSubmitted: (_) => _submit(),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            unawaited(HapticFeedback.selectionClick());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.chatVoiceComingSoon)),
            );
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: colors.surfaceSunken,
            child: Icon(Icons.mic_none_rounded, color: colors.inkSecondary),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        SizedBox(
          width: 44,
          height: 44,
          child: NPPlate(
            onTap: _submit,
            color: colors.accentPrimary,
            shadowColor: colors.accentDeep,
            borderRadius: 22,
            padding: EdgeInsets.zero,
            child: const Center(
              child: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
