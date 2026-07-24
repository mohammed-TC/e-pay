import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../providers/session_persistence.dart';

/// Screen A3 — Onboarding Carousel
class OnboardingCarouselScreen extends ConsumerStatefulWidget {
  const OnboardingCarouselScreen({super.key});

  @override
  ConsumerState<OnboardingCarouselScreen> createState() =>
      _OnboardingCarouselScreenState();
}

class _OnboardingCarouselScreenState
    extends ConsumerState<OnboardingCarouselScreen> {
  static const _slideCount = 3;

  final _controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    await markOnboardingSeen();
    if (mounted) context.go(Routes.login);
  }

  void _next() {
    if (_page == _slideCount - 1) {
      unawaited(_finish());
      return;
    }
    unawaited(
      _controller.nextPage(
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final isLast = _page == _slideCount - 1;

    return NPScaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: AppSpacing.xxxl),
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) => setState(() => _page = index),
                  children: [
                    _OnboardingSlide(
                      headline: context.l10n.onboardingSlideWalletHeadline,
                      body: context.l10n.onboardingSlideWalletBody,
                      variant: _SlideVariant.wallet,
                    ),
                    _OnboardingSlide(
                      headline: context.l10n.onboardingSlideBillsHeadline,
                      body: context.l10n.onboardingSlideBillsBody,
                      variant: _SlideVariant.bills,
                    ),
                    _OnboardingSlide(
                      headline: context.l10n.onboardingSlideRewardsHeadline,
                      body: context.l10n.onboardingSlideRewardsBody,
                      variant: _SlideVariant.rewards,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _slideCount,
                  (i) => _Dot(active: i == _page),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              NPButton(
                label: isLast
                    ? context.l10n.onboardingGetStarted
                    : context.l10n.onboardingNext,
                onPressed: _next,
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
          PositionedDirectional(
            top: AppSpacing.md,
            end: 0,
            child: TextButton(
              onPressed: () => unawaited(_finish()),
              style: TextButton.styleFrom(
                foregroundColor: colors.inkSecondary,
                splashFactory: NoSplash.splashFactory,
              ),
              child: Text(context.l10n.onboardingSkip),
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    return AnimatedContainer(
      duration: reduceMotion
          ? Duration.zero
          : const Duration(milliseconds: 240),
      curve: Curves.easeOutCubic,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 4),
      width: active ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active
            ? colors.accentPrimary
            : colors.inkTertiary.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppRadius.chip),
      ),
    );
  }
}

/// Which geometric mark + copy a slide shows — product.md A3 (Wallet, Bills,
/// Rewards themes).
enum _SlideVariant { wallet, bills, rewards }

class _OnboardingSlide extends StatelessWidget {
  const _OnboardingSlide({
    required this.headline,
    required this.body,
    required this.variant,
  });

  final String headline;
  final String body;
  final _SlideVariant variant;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 180,
            height: 180,
            child: CustomPaint(
              painter: _SlideMarkPainter(
                variant: variant,
                outlineColor: colors.inkPrimary.withValues(alpha: 0.2),
                accentColor: colors.accentPrimary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          Text(
            headline,
            textAlign: TextAlign.center,
            style: textTheme.displayMedium?.copyWith(
              color: colors.accentPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            body,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(color: colors.inkSecondary),
          ),
        ],
      ),
    );
  }
}

/// Bespoke geometric line illustration per slide — design.md §7 "no
/// stock-style people": abstract outline + one accent shape, never a literal
/// icon/photo.
class _SlideMarkPainter extends CustomPainter {
  const _SlideMarkPainter({
    required this.variant,
    required this.outlineColor,
    required this.accentColor,
  });

  final _SlideVariant variant;
  final Color outlineColor;
  final Color accentColor;

  @override
  void paint(Canvas canvas, Size size) {
    final outline = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final accent = Paint()..color = accentColor;

    switch (variant) {
      case _SlideVariant.wallet:
        final rect = Rect.fromLTWH(
          size.width * 0.12,
          size.height * 0.28,
          size.width * 0.76,
          size.height * 0.44,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, const Radius.circular(20)),
          outline,
        );
        canvas.drawCircle(Offset(rect.right - 28, rect.center.dy), 14, accent);
      case _SlideVariant.bills:
        for (var i = 0; i < 4; i++) {
          final y = size.height * 0.32 + i * size.height * 0.1;
          canvas.drawLine(
            Offset(size.width * 0.2, y),
            Offset(size.width * (i.isEven ? 0.8 : 0.6), y),
            outline,
          );
        }
        canvas.drawCircle(
          Offset(size.width * 0.5, size.height * 0.82),
          10,
          accent,
        );
      case _SlideVariant.rewards:
        canvas.drawCircle(
          Offset(size.width * 0.5, size.height * 0.5),
          size.width * 0.32,
          outline,
        );
        canvas.drawCircle(
          Offset(size.width * 0.5, size.height * 0.5),
          10,
          accent,
        );
    }
  }

  @override
  bool shouldRepaint(covariant _SlideMarkPainter oldDelegate) {
    return oldDelegate.variant != variant ||
        oldDelegate.outlineColor != outlineColor ||
        oldDelegate.accentColor != accentColor;
  }
}
