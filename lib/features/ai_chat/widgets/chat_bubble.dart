import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';

/// Text bubble — design.md §11. Assistant = soft-shadow `surface.card` pill
/// aligned start; user = `accent.tint` fill aligned end. Never a tappable
/// plate (design-tokens.md: hard shadow is reserved for tappables).
class ChatBubble extends StatelessWidget {
  const ChatBubble({required this.text, required this.isUser, super.key});

  final String text;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final reduceMotion = MediaQuery.of(context).disableAnimations;

    final bubble = Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: isUser ? colors.accentTint : colors.surfaceCard,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: [
          BoxShadow(
            color: colors.inkPrimary.withValues(alpha: 0.06),
            offset: const Offset(0, 8),
            blurRadius: 24,
          ),
        ],
      ),
      child: Text(
        text,
        style: textTheme.bodyLarge?.copyWith(color: colors.inkPrimary),
      ),
    );

    return Align(
      alignment: isUser
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.78,
        ),
        child: reduceMotion
            ? bubble
            : bubble
                  .animate()
                  .fadeIn(duration: 240.ms)
                  .slideY(
                    begin: 0.15,
                    end: 0,
                    duration: 240.ms,
                    curve: Curves.easeOutCubic,
                  ),
      ),
    );
  }
}
