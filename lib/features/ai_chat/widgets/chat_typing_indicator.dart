import 'dart:async';

import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';

/// Assistant "is composing" indicator — design.md §11. Same 900ms bounce
/// spec as `NPButton`'s loading dots, wrapped in the same soft-shadow bubble
/// shell as [ChatBubble] so it reads as "a message is coming".
class ChatTypingIndicator extends StatefulWidget {
  const ChatTypingIndicator({super.key});

  @override
  State<ChatTypingIndicator> createState() => _ChatTypingIndicatorState();
}

class _ChatTypingIndicatorState extends State<ChatTypingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    unawaited(_controller.repeat());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final reduceMotion = MediaQuery.of(context).disableAnimations;

    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: colors.surfaceCard,
          borderRadius: BorderRadius.circular(AppRadius.card),
          boxShadow: [
            BoxShadow(
              color: colors.inkPrimary.withValues(alpha: 0.06),
              offset: const Offset(0, 8),
              blurRadius: 24,
            ),
          ],
        ),
        child: reduceMotion
            ? _dotsRow(colors.inkTertiary, (_) => 1)
            : AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return _dotsRow(colors.inkTertiary, (i) {
                    final t = (_controller.value - i * 0.15) % 1.0;
                    return 0.6 +
                        0.4 * (1 - (t - 0.5).abs() * 2).clamp(0.0, 1.0);
                  });
                },
              ),
      ),
    );
  }

  Widget _dotsRow(Color color, double Function(int index) scaleFor) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Transform.scale(
            scale: scaleFor(i),
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
        );
      }),
    );
  }
}
