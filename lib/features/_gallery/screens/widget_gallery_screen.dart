import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../app/locale_provider.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_theme.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/money.dart';
import '../../../core/widgets/np_amount_input.dart';
import '../../../core/widgets/np_badge.dart';
import '../../../core/widgets/np_balance_card.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_chip.dart';
import '../../../core/widgets/np_empty_state.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_list_tile.dart';
import '../../../core/widgets/np_otp_field.dart';
import '../../../core/widgets/np_pin_pad.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_segmented_tabs.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../../../core/widgets/np_status_timeline.dart';
import '../../../core/widgets/np_success_animation.dart';
import '../../../core/widgets/np_text_field.dart';

/// Dev-only gallery — tasks.md Phase 2 "Temporary widget gallery screen to
/// visually verify all components in EN/AR, light/dark". Remove from the
/// nav (and this route) in Phase 9's release-hardening pass.
class WidgetGalleryScreen extends ConsumerStatefulWidget {
  const WidgetGalleryScreen({super.key});

  @override
  ConsumerState<WidgetGalleryScreen> createState() =>
      _WidgetGalleryScreenState();
}

class _WidgetGalleryScreenState extends ConsumerState<WidgetGalleryScreen> {
  bool _dark = false;
  bool _balanceHidden = false;
  bool _chipSelected = false;
  int _segment = 0;
  String _amountDigits = '2500';
  bool _showSuccess = false;

  @override
  Widget build(BuildContext context) {
    final isArabic = ref.watch(appLocaleProvider).languageCode == 'ar';
    final themeData = _dark
        ? AppTheme.dark(isArabic: isArabic)
        : AppTheme.light(isArabic: isArabic);

    return Theme(
      data: themeData,
      child: Builder(
        builder: (context) {
          if (_showSuccess) {
            return NPSuccessAnimation(
              amount: Money.fromAmount(42.5),
              title: context.l10n.gallerySuccessTitle,
              rewardsEarned: 42,
              doneLabel: context.l10n.gallerySuccessDone,
              onDismiss: () => setState(() => _showSuccess = false),
            );
          }
          return NPScaffold(
            appBar: AppBar(
              title: Text(context.l10n.galleryTitle),
              actions: [
                IconButton(
                  tooltip: context.l10n.galleryToggleLanguage,
                  icon: const Icon(LucideIcons.languages),
                  onPressed: () {
                    final next = isArabic
                        ? const Locale('en')
                        : const Locale('ar');
                    unawaited(
                      ref.read(appLocaleProvider.notifier).setLocale(next),
                    );
                  },
                ),
                IconButton(
                  tooltip: context.l10n.galleryToggleTheme,
                  icon: Icon(_dark ? LucideIcons.sun : LucideIcons.moon),
                  onPressed: () => setState(() => _dark = !_dark),
                ),
              ],
            ),
            body: ListView(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: AppSpacing.xl,
              ),
              children: [
                _Section(
                  title: context.l10n.gallerySectionFeature,
                  children: [
                    NPBalanceCard(
                      balance: Money.fromAmount(250),
                      label: context.l10n.galleryBalanceLabel,
                      hidden: _balanceHidden,
                      onToggleHidden: () =>
                          setState(() => _balanceHidden = !_balanceHidden),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    NPStatusTimeline(
                      steps: [
                        NPTimelineStep(
                          label: context.l10n.galleryTimelineStep1,
                          status: NPTimelineStepStatus.done,
                        ),
                        NPTimelineStep(
                          label: context.l10n.galleryTimelineStep2,
                          status: NPTimelineStepStatus.active,
                        ),
                        NPTimelineStep(
                          label: context.l10n.galleryTimelineStep3,
                          status: NPTimelineStepStatus.pending,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    NPButton(
                      label: context.l10n.galleryShowSuccess,
                      onPressed: () => setState(() => _showSuccess = true),
                    ),
                  ],
                ),
                _Section(
                  title: context.l10n.gallerySectionButtons,
                  children: [
                    NPButton(
                      label: context.l10n.galleryButtonPrimary,
                      onPressed: () {},
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    NPButton(
                      label: context.l10n.galleryButtonSecondary,
                      variant: NPButtonVariant.secondary,
                      onPressed: () {},
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    NPButton(
                      label: context.l10n.galleryButtonGhost,
                      variant: NPButtonVariant.ghost,
                      onPressed: () {},
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    NPButton(
                      label: context.l10n.galleryButtonLoading,
                      loading: true,
                      onPressed: () {},
                    ),
                  ],
                ),
                _Section(
                  title: context.l10n.gallerySectionCards,
                  children: [
                    NPCard(
                      interactive: false,
                      child: Text(context.l10n.galleryCardStatic),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    NPCard(
                      onTap: () {},
                      child: Text(context.l10n.galleryCardInteractive),
                    ),
                  ],
                ),
                _Section(
                  title: context.l10n.gallerySectionInputs,
                  children: [
                    NPTextField(
                      label: context.l10n.galleryTextFieldLabel,
                      hint: context.l10n.galleryTextFieldHint,
                      errorText: context.l10n.galleryTextFieldError,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    NPAmountInput(
                      value: _amountDigits,
                      onChanged: (value) =>
                          setState(() => _amountDigits = value),
                      quickAmounts: const [5, 10, 25, 50],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(context.l10n.galleryOtpLabel),
                    const SizedBox(height: AppSpacing.sm),
                    NPOtpField(onCompleted: (_) {}),
                    const SizedBox(height: AppSpacing.lg),
                    Text(context.l10n.galleryPinLabel),
                    const SizedBox(height: AppSpacing.sm),
                    NPPinPad(onKeyTap: (_) {}, onBiometricTap: () {}),
                  ],
                ),
                _Section(
                  title: context.l10n.gallerySectionListsAndTags,
                  children: [
                    NPListTile(
                      leading: const Icon(LucideIcons.zap),
                      title: context.l10n.galleryListTileTitle,
                      subtitle: context.l10n.galleryListTileSubtitle,
                      trailingAmount: Money.fromAmount(-18.5),
                      isPositive: false,
                      onTap: () {},
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Wrap(
                      spacing: AppSpacing.sm,
                      children: [
                        NPBadge(
                          label: context.l10n.galleryBadgeLabel,
                          icon: LucideIcons.sparkles,
                        ),
                        NPChip(
                          label: context.l10n.galleryChipUnselected,
                          selected: !_chipSelected,
                          onTap: () => setState(() => _chipSelected = false),
                        ),
                        NPChip(
                          label: context.l10n.galleryChipSelected,
                          selected: _chipSelected,
                          onTap: () => setState(() => _chipSelected = true),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    NPSegmentedTabs(
                      segments: [
                        (
                          label: context.l10n.gallerySegmentHome,
                          icon: LucideIcons.home,
                        ),
                        (
                          label: context.l10n.gallerySegmentHistory,
                          icon: LucideIcons.history,
                        ),
                        (
                          label: context.l10n.gallerySegmentRewards,
                          icon: LucideIcons.gift,
                        ),
                      ],
                      selectedIndex: _segment,
                      onChanged: (index) => setState(() => _segment = index),
                    ),
                  ],
                ),
                _Section(
                  title: context.l10n.gallerySectionStates,
                  children: [
                    Text(context.l10n.galleryShimmerLabel),
                    const SizedBox(height: AppSpacing.sm),
                    const NPShimmer.line(),
                    const SizedBox(height: AppSpacing.sm),
                    const NPShimmer.card(),
                    const SizedBox(height: AppSpacing.xl),
                    NPEmptyState(
                      title: context.l10n.galleryEmptyTitle,
                      body: context.l10n.galleryEmptyBody,
                      ctaLabel: context.l10n.galleryEmptyCta,
                      onCta: () {},
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    NPErrorState(
                      title: context.l10n.galleryErrorTitle,
                      body: context.l10n.galleryErrorBody,
                      retryLabel: context.l10n.galleryErrorRetry,
                      onRetry: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.sectionGap),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: AppSpacing.lg),
          ...children,
        ],
      ),
    );
  }
}
