import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';

/// design.md §6 `NPChip` — tappable/selectable tint-fill pill (filter-chip
/// style). Chips are tint fills only and never carry the hard NeoPop offset
/// shadow — that's reserved for [NPCard]/[NPButton] per design-tokens.md.
/// Unselected = `surface.sunken` fill; selected = `accent.tint` fill with
/// `accent.primary` text/border.
class NPChip extends StatelessWidget {
  const NPChip({
    required this.label,
    super.key,
    this.selected = false,
    this.onTap,
    this.icon,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    final reduceMotion = MediaQuery.of(context).disableAnimations;

    final fill = selected ? colors.accentTint : colors.surfaceSunken;
    final ink = selected ? colors.accentPrimary : colors.inkSecondary;

    return GestureDetector(
      onTap: onTap == null
          ? null
          : () {
              unawaited(HapticFeedback.selectionClick());
              onTap!();
            },
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: reduceMotion
            ? Duration.zero
            : const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: fill,
          borderRadius: BorderRadius.circular(AppRadius.chip),
          border: Border.all(
            color: selected ? colors.accentPrimary : Colors.transparent,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16, color: ink),
              const SizedBox(width: AppSpacing.xs),
            ],
            Text(
              label,
              style: theme.textTheme.labelLarge?.copyWith(
                color: ink,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
