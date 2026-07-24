import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';

/// design.md §6 `NPBottomSheet` — top-only rounded sheet (radius 28,
/// `AppRadius.sheetTop`) with a grab handle, `surface.card` fill and a
/// 40%-alpha `ink.primary` scrim. Every modal sheet in the app should route
/// through this helper rather than calling [showModalBottomSheet] directly.
Future<T?> showNPBottomSheet<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  bool isScrollControlled = true,
}) {
  final colors = Theme.of(context).extension<AppColors>()!;

  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    backgroundColor: colors.surfaceCard,
    barrierColor: colors.inkPrimary.withValues(alpha: 0.4),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppRadius.sheetTop),
      ),
    ),
    builder: (sheetContext) {
      return SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: AppSpacing.sm,
            start: AppSpacing.lg,
            end: AppSpacing.lg,
            bottom: AppSpacing.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsetsDirectional.only(
                    bottom: AppSpacing.md,
                  ),
                  decoration: BoxDecoration(
                    color: colors.inkTertiary,
                    borderRadius: BorderRadius.circular(AppRadius.chip),
                  ),
                ),
              ),
              builder(sheetContext),
            ],
          ),
        ),
      );
    },
  );
}
