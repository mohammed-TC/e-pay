import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import 'np_button.dart';

/// Error-state placeholder — design.md §7. Same layout shape as
/// [NPEmptyState] but semantically for a failed load: the illustration uses
/// `semantic.danger` and the CTA is a primary "retry" action. Purely
/// presentational — callers supply all copy so it stays localized.
class NPErrorState extends StatelessWidget {
  const NPErrorState({
    required this.title,
    required this.body,
    required this.onRetry,
    required this.retryLabel,
    super.key,
  });

  final String title;
  final String body;
  final VoidCallback onRetry;

  /// Caller-supplied localized retry copy — never hardcoded here.
  final String retryLabel;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CustomPaint(
                painter: _ErrorMarkPainter(
                  outlineColor: colors.inkPrimary.withValues(alpha: 0.24),
                  dotColor: colors.semanticDanger,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              title,
              textAlign: TextAlign.center,
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              body,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(color: colors.inkSecondary),
            ),
            const SizedBox(height: AppSpacing.xl),
            NPButton(label: retryLabel, onPressed: onRetry),
          ],
        ),
      ),
    );
  }
}

/// Abstract geometric mark: a rounded outline with a small danger-colored
/// dot. Deliberately not a literal icon — design.md §7.
class _ErrorMarkPainter extends CustomPainter {
  const _ErrorMarkPainter({required this.outlineColor, required this.dotColor});

  final Color outlineColor;
  final Color dotColor;

  @override
  void paint(Canvas canvas, Size size) {
    final outlinePaint = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final rect = Rect.fromLTWH(
      size.width * 0.15,
      size.height * 0.2,
      size.width * 0.7,
      size.height * 0.6,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(16)),
      outlinePaint,
    );

    final dotPaint = Paint()..color = dotColor;
    canvas.drawCircle(Offset(rect.center.dx, rect.top), 6, dotPaint);
  }

  @override
  bool shouldRepaint(covariant _ErrorMarkPainter oldDelegate) {
    return oldDelegate.outlineColor != outlineColor ||
        oldDelegate.dotColor != dotColor;
  }
}
