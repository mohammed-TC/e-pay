import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/locale_provider.dart';
import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_scaffold.dart';

/// Screen A2 — Language Select
class LanguageSelectScreen extends ConsumerWidget {
  const LanguageSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final locale = ref.watch(appLocaleProvider);
    final isArabicSelected = locale.languageCode == 'ar';

    return NPScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.xxxl),
          Text(
            context.l10n.languageSelectTitle,
            style: textTheme.displayMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            context.l10n.languageSelectSubtitle,
            style: textTheme.bodyLarge?.copyWith(color: colors.inkSecondary),
          ),
          const SizedBox(height: AppSpacing.xxl),
          _LanguageOption(
            label: context.l10n.languageSelectEnglishLabel,
            selected: !isArabicSelected,
            onTap: () {
              unawaited(
                ref
                    .read(appLocaleProvider.notifier)
                    .setLocale(
                      const Locale('en'),
                    ),
              );
            },
          ),
          const SizedBox(height: AppSpacing.md),
          _LanguageOption(
            label: context.l10n.languageSelectArabicLabel,
            selected: isArabicSelected,
            onTap: () {
              unawaited(
                ref
                    .read(appLocaleProvider.notifier)
                    .setLocale(
                      const Locale('ar'),
                    ),
              );
            },
          ),
          const Spacer(),
          NPButton(
            label: context.l10n.languageSelectContinue,
            onPressed: () => context.go(Routes.onboarding),
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}

/// Single selectable language card — plate physics, RTL flip handled by
/// [NPCard]/[NPPlate] internally.
class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    return NPCard(
      onTap: onTap,
      color: selected ? colors.accentTint : colors.surfaceCard,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textTheme.titleLarge),
          Icon(
            selected ? Icons.check_circle : Icons.circle_outlined,
            color: selected ? colors.accentPrimary : colors.inkTertiary,
          ),
        ],
      ),
    );
  }
}
