import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../models/money.dart';
import 'np_button.dart';
import 'np_card.dart';

/// design.md §5 — "the demo's money shot", THE hero moment of a completed
/// payment. Pure presentational full-widget takeover: the caller (shared
/// payment flow's receipt step) decides how to present it (e.g. inside a
/// route) and has already performed the actual payment via `PaymentService`.
///
/// Staggered sequence driven by a single [AnimationController] (total
/// ~1300ms), skipping straight to the end state when
/// `MediaQuery.disableAnimations` is set:
/// 1. Plate slam-in (0-400ms, [Curves.easeOutBack], scale 0.7 → 1.0) with a
///    `HapticFeedback.heavyImpact()` on landing.
/// 2. Emerald check mark self-draws via [CustomPainter] + `PathMetric`
///    partial-path extraction (400-900ms).
/// 3. Self-contained confetti burst — ~36 particles, no external package
///    (400-1300ms).
/// 4. Amount counts up 0 → [amount] (400-1000ms).
/// 5. Optional rewards chip fly-in, if [rewardsEarned] is provided
///    (1000-1240ms).
class NPSuccessAnimation extends StatefulWidget {
  const NPSuccessAnimation({
    required this.amount,
    required this.title,
    super.key,
    this.rewardsEarned,
    this.onDismiss,
    this.doneLabel,
  }) : assert(
         onDismiss == null || doneLabel != null,
         'doneLabel is required when onDismiss is provided — no hardcoded '
         'UI copy in the design system.',
       );

  final Money amount;
  final String title;
  final int? rewardsEarned;
  final VoidCallback? onDismiss;

  /// Label for the "Done" [NPButton]. Required whenever [onDismiss] is set.
  final String? doneLabel;

  @override
  State<NPSuccessAnimation> createState() => _NPSuccessAnimationState();
}

class _NPSuccessAnimationState extends State<NPSuccessAnimation>
    with SingleTickerProviderStateMixin {
  static const _totalMs = 1300.0;
  static const _plateEndMs = 400.0;
  static const _checkStartMs = 400.0;
  static const _checkEndMs = 900.0;
  static const _confettiStartMs = 400.0;
  static const _amountStartMs = 400.0;
  static const _amountEndMs = 1000.0;
  static const _chipStartMs = 1000.0;
  static const _chipEndMs = 1240.0;
  static const _particleCount = 36;

  late final AnimationController _controller;
  late final Animation<double> _plateAnim;
  late final Animation<double> _checkAnim;
  late final Animation<double> _confettiAnim;
  late final Animation<double> _amountAnim;
  late final Animation<double> _chipAnim;
  late final List<_ConfettiParticle> _particles;

  bool _started = false;
  bool _hapticFired = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _totalMs.round()),
    );

    _plateAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0,
        _plateEndMs / _totalMs,
        curve: Curves.easeOutBack,
      ),
    );
    _checkAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        _checkStartMs / _totalMs,
        _checkEndMs / _totalMs,
        curve: Curves.easeInOut,
      ),
    );
    _confettiAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        _confettiStartMs / _totalMs,
        1,
        curve: Curves.linear,
      ),
    );
    _amountAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        _amountStartMs / _totalMs,
        _amountEndMs / _totalMs,
        curve: Curves.easeOutCubic,
      ),
    );
    _chipAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        _chipStartMs / _totalMs,
        _chipEndMs / _totalMs,
        curve: Curves.easeOutCubic,
      ),
    );

    final rng = math.Random();
    _particles = List.generate(
      _particleCount,
      (_) => _ConfettiParticle.random(rng),
    );

    _controller.addListener(_maybeFireLandingHaptic);
  }

  void _maybeFireLandingHaptic() {
    if (_hapticFired) return;
    if (_controller.value >= _plateEndMs / _totalMs) {
      _hapticFired = true;
      unawaited(HapticFeedback.heavyImpact());
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    if (reduceMotion) {
      _controller.value = 1;
    } else {
      unawaited(_controller.forward());
    }
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_maybeFireLandingHaptic)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final palette = [
      colors.accentPrimary,
      colors.goldReward,
      colors.accentDeep,
      colors.inkTertiary,
    ];

    return SizedBox.expand(
      child: ColoredBox(
        color: colors.surfacePage,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _ConfettiPainter(
                      progress: _confettiAnim.value,
                      particles: _particles,
                      palette: palette,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.7 + 0.3 * _plateAnim.value,
                  child: NPCard(
                    interactive: false,
                    padding: const EdgeInsets.all(AppSpacing.xxl),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 72,
                          height: 72,
                          child: CustomPaint(
                            painter: _CheckPainter(
                              progress: _checkAnim.value,
                              color: colors.accentPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        Text(widget.title, style: textTheme.titleLarge),
                        const SizedBox(height: AppSpacing.sm),
                        _AnimatedAmountText(
                          value: _amountAnim.value * widget.amount.amount,
                          currencyCode: widget.amount.currencyCode,
                          textTheme: textTheme,
                          colors: colors,
                        ),
                        if (widget.rewardsEarned != null) ...[
                          const SizedBox(height: AppSpacing.md),
                          Opacity(
                            opacity: _chipAnim.value.clamp(0.0, 1.0),
                            child: Transform.translate(
                              offset: Offset(0, (1 - _chipAnim.value) * 16),
                              child: _RewardsChip(
                                points: widget.rewardsEarned!,
                                colors: colors,
                                textTheme: textTheme,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                if (widget.onDismiss != null)
                  PositionedDirectional(
                    bottom: AppSpacing.xxl,
                    start: AppSpacing.gutter,
                    end: AppSpacing.gutter,
                    child: NPButton(
                      label: widget.doneLabel!,
                      onPressed: widget.onDismiss,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AnimatedAmountText extends StatelessWidget {
  const _AnimatedAmountText({
    required this.value,
    required this.currencyCode,
    required this.textTheme,
    required this.colors,
  });

  final double value;
  final String currencyCode;
  final TextTheme textTheme;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    final formatted = value.toStringAsFixed(3).split('.');
    final whole = formatted[0];
    final decimals = formatted.length > 1 ? formatted[1] : '000';
    final baseStyle = (textTheme.displayMedium ?? const TextStyle(fontSize: 28))
        .copyWith(
          color: colors.inkPrimary,
        );
    final smallStyle = baseStyle.copyWith(
      fontSize: (baseStyle.fontSize ?? 28) * 0.7,
    );

    return RichText(
      text: TextSpan(
        style: baseStyle,
        children: [
          TextSpan(text: whole),
          TextSpan(text: '.$decimals', style: smallStyle),
          TextSpan(text: ' $currencyCode', style: smallStyle),
        ],
      ),
    );
  }
}

class _RewardsChip extends StatelessWidget {
  const _RewardsChip({
    required this.points,
    required this.colors,
    required this.textTheme,
  });

  final int points;
  final AppColors colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.goldReward.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(AppRadius.chip),
        border: Border.all(color: colors.goldReward.withValues(alpha: 0.4)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.stars_rounded, size: 16, color: colors.goldReward),
            const SizedBox(width: AppSpacing.xs),
            Text(
              '+$points',
              style: textTheme.labelLarge?.copyWith(
                color: colors.goldReward,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Draws a checkmark stroke via `Path` + `PathMetric` partial-path
/// extraction, animated by [progress] (0 = undrawn, 1 = fully drawn).
class _CheckPainter extends CustomPainter {
  _CheckPainter({required this.progress, required this.color});

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.55)
      ..lineTo(size.width * 0.42, size.height * 0.75)
      ..lineTo(size.width * 0.8, size.height * 0.3);

    final extractedPath = Path();
    for (final metric in path.computeMetrics()) {
      extractedPath.addPath(
        metric.extractPath(0, metric.length * progress),
        Offset.zero,
      );
    }

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(extractedPath, paint);
  }

  @override
  bool shouldRepaint(covariant _CheckPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}

enum _ConfettiShape { rect, circle }

/// Geometry for a single confetti particle, randomized once at
/// [_NPSuccessAnimationState.initState] — never re-randomized per frame.
/// Color is resolved at paint time from the design-token [AppColors]
/// palette via [colorIndex], so no raw color is stored here.
class _ConfettiParticle {
  const _ConfettiParticle({
    required this.angle,
    required this.speed,
    required this.size,
    required this.shape,
    required this.rotationSpeed,
    required this.initialRotation,
    required this.colorIndex,
  });

  factory _ConfettiParticle.random(math.Random rng) {
    return _ConfettiParticle(
      angle: rng.nextDouble() * 2 * math.pi,
      speed: 90 + rng.nextDouble() * 150,
      size: 4 + rng.nextDouble() * 5,
      shape: rng.nextBool() ? _ConfettiShape.rect : _ConfettiShape.circle,
      rotationSpeed: (rng.nextDouble() - 0.5) * 8 * math.pi,
      initialRotation: rng.nextDouble() * 2 * math.pi,
      colorIndex: rng.nextInt(4),
    );
  }

  final double angle;
  final double speed;
  final double size;
  final _ConfettiShape shape;
  final double rotationSpeed;
  final double initialRotation;
  final int colorIndex;
}

/// Self-contained particle-burst painter — no external confetti/lottie
/// package. Particles fly outward from center, fall with gentle gravity,
/// rotate, and fade out over [progress] 0→1.
class _ConfettiPainter extends CustomPainter {
  _ConfettiPainter({
    required this.progress,
    required this.particles,
    required this.palette,
  });

  final double progress;
  final List<_ConfettiParticle> particles;
  final List<Color> palette;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0 || palette.isEmpty) return;

    final center = size.center(Offset.zero);
    final paint = Paint()..style = PaintingStyle.fill;

    for (final particle in particles) {
      final opacity = (1 - progress).clamp(0.0, 1.0);
      if (opacity <= 0) continue;

      final dx = math.cos(particle.angle) * particle.speed * progress;
      final dy =
          math.sin(particle.angle) * particle.speed * progress +
          160 * progress * progress;
      final rotation =
          particle.initialRotation + particle.rotationSpeed * progress;

      paint.color = palette[particle.colorIndex % palette.length].withValues(
        alpha: opacity,
      );

      canvas
        ..save()
        ..translate(center.dx + dx, center.dy + dy)
        ..rotate(rotation);

      if (particle.shape == _ConfettiShape.circle) {
        canvas.drawCircle(Offset.zero, particle.size / 2, paint);
      } else {
        canvas.drawRect(
          Rect.fromCenter(
            center: Offset.zero,
            width: particle.size,
            height: particle.size * 0.6,
          ),
          paint,
        );
      }
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
