import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_scaffold.dart';

/// Screen A8 — Biometric Enable
class BiometricEnableScreen extends StatelessWidget {
  const BiometricEnableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return NPScaffold(
      body: Column(
        children: [
          const Spacer(),
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: colors.accentTint,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.fingerprint,
              size: 48,
              color: colors.accentPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          Text(
            context.l10n.biometricEnableTitle,
            style: textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            context.l10n.biometricEnableBody,
            style: textTheme.bodyLarge?.copyWith(color: colors.inkSecondary),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          NPButton(
            label: context.l10n.biometricEnableCta,
            onPressed: () => context.go(Routes.home),
          ),
          const SizedBox(height: AppSpacing.md),
          NPButton(
            label: context.l10n.biometricEnableSkip,
            variant: NPButtonVariant.ghost,
            onPressed: () => context.go(Routes.home),
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
