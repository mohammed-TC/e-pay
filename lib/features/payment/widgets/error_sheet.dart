import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_bottom_sheet.dart';
import '../../../core/widgets/np_button.dart';

/// Generic retry sheet for a [PaymentResult.failed] outcome — payment-flow.md
/// "no feature screen implements its own ... error UI". Always routed
/// through [showNPBottomSheet], never `showModalBottomSheet` directly.
Future<void> showPaymentErrorSheet(
  BuildContext context, {
  required VoidCallback onRetry,
  required VoidCallback onCancel,
}) {
  return showNPBottomSheet<void>(
    context,
    builder: (sheetContext) {
      final colors = Theme.of(sheetContext).extension<AppColors>()!;
      final textTheme = Theme.of(sheetContext).textTheme;
      final l10n = sheetContext.l10n;
      return _ErrorSheetContent(
        icon: Icons.error_outline_rounded,
        iconColor: colors.semanticDanger,
        title: l10n.paymentErrorSheetTitle,
        body: l10n.paymentErrorSheetBody,
        textTheme: textTheme,
        colors: colors,
        primaryLabel: l10n.paymentErrorSheetRetry,
        onPrimary: () {
          Navigator.of(sheetContext).pop();
          onRetry();
        },
        secondaryLabel: l10n.paymentCancelCta,
        onSecondary: () {
          Navigator.of(sheetContext).pop();
          onCancel();
        },
      );
    },
  );
}

/// [PaymentResult.insufficientFunds] gets distinct copy and a "Top up" CTA —
/// payment-flow.md "not a generic error".
Future<void> showInsufficientFundsSheet(
  BuildContext context, {
  required VoidCallback onTopUp,
  required VoidCallback onDismiss,
}) {
  return showNPBottomSheet<void>(
    context,
    builder: (sheetContext) {
      final colors = Theme.of(sheetContext).extension<AppColors>()!;
      final textTheme = Theme.of(sheetContext).textTheme;
      final l10n = sheetContext.l10n;
      return _ErrorSheetContent(
        icon: Icons.account_balance_wallet_outlined,
        iconColor: colors.semanticWarning,
        title: l10n.paymentInsufficientFundsTitle,
        body: l10n.paymentInsufficientFundsBody,
        textTheme: textTheme,
        colors: colors,
        primaryLabel: l10n.paymentInsufficientFundsTopUp,
        onPrimary: () {
          Navigator.of(sheetContext).pop();
          onTopUp();
        },
        secondaryLabel: l10n.paymentCancelCta,
        onSecondary: () {
          Navigator.of(sheetContext).pop();
          onDismiss();
        },
      );
    },
  );
}

class _ErrorSheetContent extends StatelessWidget {
  const _ErrorSheetContent({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.body,
    required this.textTheme,
    required this.colors,
    required this.primaryLabel,
    required this.onPrimary,
    required this.secondaryLabel,
    required this.onSecondary,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String body;
  final TextTheme textTheme;
  final AppColors colors;
  final String primaryLabel;
  final VoidCallback onPrimary;
  final String secondaryLabel;
  final VoidCallback onSecondary;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(icon, size: 48, color: iconColor),
        const SizedBox(height: AppSpacing.lg),
        Text(title, textAlign: TextAlign.center, style: textTheme.titleLarge),
        const SizedBox(height: AppSpacing.sm),
        Text(
          body,
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge?.copyWith(color: colors.inkSecondary),
        ),
        const SizedBox(height: AppSpacing.xl),
        NPButton(label: primaryLabel, onPressed: onPrimary),
        const SizedBox(height: AppSpacing.sm),
        NPButton(
          label: secondaryLabel,
          variant: NPButtonVariant.ghost,
          onPressed: onSecondary,
        ),
      ],
    );
  }
}
