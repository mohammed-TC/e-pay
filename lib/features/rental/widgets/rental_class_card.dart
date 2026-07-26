import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/money.dart';
import '../../../core/widgets/np_card.dart';
import '../models/rental_vehicle_class.dart';

const Map<String, IconData> _classIcons = {
  'economy': Icons.directions_car_outlined,
  'suv': Icons.airport_shuttle_outlined,
  'saloon': Icons.directions_car,
};

/// L2 result row: one priced [RentalVehicleClass] — product.md L2.
class RentalClassCard extends StatelessWidget {
  const RentalClassCard({
    required this.vehicleClass,
    required this.days,
    required this.total,
    required this.onTap,
    super.key,
  });

  final RentalVehicleClass vehicleClass;
  final int days;
  final Money total;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;

    return NPCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: colors.surfaceSunken,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              _classIcons[vehicleClass.iconKey] ?? Icons.directions_car,
              size: 24,
              color: colors.inkPrimary,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(vehicleClass.name, style: textTheme.titleLarge),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${vehicleClass.seats} · ${vehicleClass.transmission} · ${vehicleClass.bags}',
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.inkSecondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                total.format(context),
                style: textTheme.titleMedium?.copyWith(
                  color: colors.accentPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                l10n.rentalResultsTripLabel(days),
                style: textTheme.bodySmall?.copyWith(
                  color: colors.inkTertiary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
