import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_typography.dart';
import '../models/money.dart';
import 'np_card.dart';

/// design.md §6 `NPListTile` — 56px min-height row: 40px leading icon tile
/// (`surface.sunken`, radius 12), title/subtitle, trailing tabular-figure
/// amount. Wrapped in [NPCard] plate physics whenever [onTap] is provided.
class NPListTile extends StatelessWidget {
  const NPListTile({
    required this.title,
    super.key,
    this.leading,
    this.subtitle,
    this.trailingAmount,
    this.isPositive = true,
    this.trailingWidget,
    this.onTap,
  });

  /// Presentational leading icon widget — this tile only supplies the
  /// 40px sunken tile background, the caller supplies the icon itself.
  final Widget? leading;
  final String title;
  final String? subtitle;
  final Money? trailingAmount;

  /// Colors [trailingAmount] `accent.primary` when `true`, `ink.primary`
  /// otherwise. Ignored when [trailingWidget] is supplied.
  final bool isPositive;

  /// Overrides [trailingAmount] entirely when provided.
  final Widget? trailingWidget;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final row = ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 56),
      child: Row(
        children: [
          if (leading != null) ...[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colors.surfaceSunken,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: leading,
            ),
            const SizedBox(width: AppSpacing.md),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: theme.textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          if (trailingWidget != null) ...[
            const SizedBox(width: AppSpacing.md),
            trailingWidget!,
          ] else if (trailingAmount != null) ...[
            const SizedBox(width: AppSpacing.md),
            Text(
              trailingAmount!.format(context),
              style: AppTypography.monoAmount(
                isArabic: isArabic,
                color: isPositive ? colors.accentPrimary : colors.inkPrimary,
              ),
            ),
          ],
        ],
      ),
    );

    if (onTap == null) {
      return Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: AppSpacing.sm,
        ),
        child: row,
      );
    }

    return NPCard(
      onTap: onTap,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      child: row,
    );
  }
}
