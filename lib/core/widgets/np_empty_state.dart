import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import 'np_button.dart';

/// Empty-state placeholder — design.md §7 "no stock-style people": a small
/// bespoke geometric illustration instead of a literal icon, followed by
/// title/body copy and an optional CTA. Purely presentational — callers
/// supply all copy so it stays localized.
class NPEmptyState extends StatelessWidget {
  const NPEmptyState({
    required this.title,
    required this.body,
    super.key,
    this.ctaLabel,
    this.onCta,
  });

  final String title;
  final String body;

  /// CTA row only renders when both [ctaLabel] and [onCta] are provided.
  final String? ctaLabel;
  final VoidCallback? onCta;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final showCta = ctaLabel != null && onCta != null;

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
                painter: _GeometricMarkPainter(
                  outlineColor: colors.inkPrimary.withValues(alpha: 0.24),
                  dotColor: colors.accentPrimary,
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
            if (showCta) ...[
              const SizedBox(height: AppSpacing.xl),
              NPButton(
                label: ctaLabel!,
                onPressed: onCta,
                variant: NPButtonVariant.secondary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Abstract geometric mark: a rounded outline with a small accent dot.
/// Deliberately not a literal icon — design.md §7.
class _GeometricMarkPainter extends CustomPainter {
  const _GeometricMarkPainter({
    required this.outlineColor,
    required this.dotColor,
  });

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
  bool shouldRepaint(covariant _GeometricMarkPainter oldDelegate) {
    return oldDelegate.outlineColor != outlineColor ||
        oldDelegate.dotColor != dotColor;
  }
}
