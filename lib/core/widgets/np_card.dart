import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import 'np_plate.dart';

/// design.md §6 `NPCard` — plate (interactive) or soft (static) variant.
/// Interactive: hard offset shadow, tappable, RTL flip via [NPPlate].
/// Static: soft ambient shadow for receipts/info cards — never mixed with
/// the hard variant on the same element.
class NPCard extends StatelessWidget {
  const NPCard({
    required this.child,
    super.key,
    this.onTap,
    this.interactive = true,
    this.color,
    this.borderRadius = AppRadius.card,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
  });

  final Widget child;
  final VoidCallback? onTap;
  final bool interactive;
  final Color? color;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return NPPlate(
      onTap: onTap,
      interactive: interactive,
      color: color ?? colors.surfaceCard,
      shadowColor: colors.plateShadow,
      borderRadius: borderRadius,
      padding: padding,
      child: child,
    );
  }
}
