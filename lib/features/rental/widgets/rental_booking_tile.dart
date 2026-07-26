import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_card.dart';
import '../models/rental_booking.dart';

/// L5 booking history row — product.md L5.
class RentalBookingTile extends StatelessWidget {
  const RentalBookingTile({required this.booking, super.key});

  final RentalBooking booking;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toString();
    final dateFormat = DateFormat.yMMMd(locale);

    return NPCard(
      interactive: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  booking.vehicleClassName,
                  style: textTheme.titleLarge,
                ),
              ),
              Text(
                booking.total.format(context),
                style: textTheme.titleMedium?.copyWith(
                  color: colors.accentPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            booking.locationName,
            style: textTheme.bodySmall?.copyWith(color: colors.inkSecondary),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            '${dateFormat.format(booking.pickupDate)} — ${dateFormat.format(booking.returnDate)}',
            style: textTheme.bodySmall?.copyWith(color: colors.inkTertiary),
          ),
          if (booking.pointsEarned > 0) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              '+${booking.pointsEarned} ${l10n.homeRewardsPointsSuffix}',
              style: textTheme.bodySmall?.copyWith(
                color: colors.accentPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
