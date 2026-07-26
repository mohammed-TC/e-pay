import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/money.dart';
import '../../../core/widgets/np_badge.dart';
import '../../../core/widgets/np_card.dart';
import '../models/rental_addon.dart';

/// L3 add-on toggle row — product.md L3. Selection state is presentational
/// only ([selected]/[onTap]); the caller (L3 screen, via `rentalDraftProvider`)
/// owns the actual toggle logic.
class RentalAddonTile extends StatelessWidget {
  const RentalAddonTile({
    required this.addon,
    required this.priceForTrip,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final RentalAddon addon;
  final Money priceForTrip;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;

    return NPCard(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            selected ? Icons.check_circle : Icons.circle_outlined,
            color: selected ? colors.accentPrimary : colors.inkTertiary,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: AppSpacing.sm,
                  children: [
                    Text(addon.name, style: textTheme.titleLarge),
                    if (addon.loyaltyMultiplier > 1)
                      NPBadge(
                        label: l10n.rentalAddonDoublePoints,
                        icon: Icons.bolt,
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  addon.description,
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.inkSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Text(priceForTrip.format(context), style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}
