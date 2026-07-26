import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/models/money.dart';

/// One label/amount line — shared by L3's sticky summary, L4 Booking
/// Review, and the L5 booking detail. [isDiscount] prefixes a minus sign;
/// [emphasize] renders the total row in the larger accent style (mirrors
/// `PaymentConfirmScreen`'s `_ReviewBody` total row).
class RentalSummaryRow extends StatelessWidget {
  const RentalSummaryRow({
    required this.label,
    required this.amount,
    super.key,
    this.emphasize = false,
    this.isDiscount = false,
  });

  final String label;
  final Money amount;
  final bool emphasize;
  final bool isDiscount;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final amountText = '${isDiscount ? '- ' : ''}${amount.format(context)}';

    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: emphasize
                  ? textTheme.titleMedium
                  : textTheme.bodyMedium?.copyWith(color: colors.inkSecondary),
            ),
          ),
          Text(
            amountText,
            style: emphasize
                ? textTheme.titleMedium?.copyWith(
                    color: colors.accentPrimary,
                    fontWeight: FontWeight.w700,
                  )
                : textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
