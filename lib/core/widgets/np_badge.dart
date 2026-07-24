import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';

/// design.md §6/§10 `NPBadge` — small tint-fill pill, never a solid fill.
/// Static and non-interactive; use [NPChip] for tappable/selectable pills.
class NPBadge extends StatelessWidget {
  const NPBadge({
    required this.label,
    super.key,
    this.icon,
    this.tintColor,
    this.textColor,
  });

  final String label;
  final IconData? icon;

  /// Defaults to `accent.tint`. Pass a gold tint on rewards screens
  /// (I1/I2) — gold is otherwise off-limits per design-tokens.md.
  final Color? tintColor;

  /// Defaults to `accent.deep`.
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    final fill = tintColor ?? colors.accentTint;
    final ink = textColor ?? colors.accentDeep;

    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(AppRadius.chip),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: ink),
            const SizedBox(width: AppSpacing.xs),
          ],
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: ink,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
