import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../models/money.dart';
import 'np_card.dart';

/// design.md §6/§7 `NPBalanceCard` — the one dark object on an otherwise
/// light-mode screen. Fill is `colors.inkPrimary` (near-black green in light
/// mode), amount text is white, with an `accent.tint` label chip and a
/// hide/show toggle.
///
/// Behaviors:
/// - Count-up: animates the displayed amount from its previous value to
///   [balance] over 600ms with [Curves.easeOutCubic].
/// - Hide/show: 3D flip (rotateX) between the animated number and a masked
///   value over ~400ms.
/// - Ambient background: faint emerald glow blobs drift slowly behind the
///   content plus a hairline glass-edge highlight — design.md §10's single
///   sheen exception for this card, kept subtle (never full-emerald).
/// - Respects `MediaQuery.disableAnimations` — all three animations jump
///   straight to their end state when reduced motion is requested.
class NPBalanceCard extends StatefulWidget {
  const NPBalanceCard({
    required this.balance,
    required this.label,
    required this.hidden,
    required this.onToggleHidden,
    super.key,
  });

  final Money balance;
  final String label;
  final bool hidden;
  final VoidCallback onToggleHidden;

  @override
  State<NPBalanceCard> createState() => _NPBalanceCardState();
}

class _NPBalanceCardState extends State<NPBalanceCard>
    with TickerProviderStateMixin {
  late final AnimationController _countController;
  late final AnimationController _flipController;
  late final Animation<double> _countCurve;
  late Tween<double> _amountTween;

  bool _flipFromHidden = false;
  bool _didInit = false;

  @override
  void initState() {
    super.initState();
    _countController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _countCurve = CurvedAnimation(
      parent: _countController,
      curve: Curves.easeOutCubic,
    );
    _amountTween = Tween<double>(begin: 0, end: widget.balance.amount);
    _flipFromHidden = widget.hidden;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didInit) return;
    _didInit = true;
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    if (reduceMotion) {
      _countController.value = 1;
    } else {
      unawaited(_countController.forward());
    }
  }

  @override
  void didUpdateWidget(covariant NPBalanceCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    final reduceMotion = MediaQuery.of(context).disableAnimations;

    if (oldWidget.balance.amount != widget.balance.amount) {
      _amountTween = Tween<double>(
        begin: oldWidget.balance.amount,
        end: widget.balance.amount,
      );
      if (reduceMotion) {
        _countController.value = 1;
      } else {
        unawaited(_countController.forward(from: 0));
      }
    }

    if (oldWidget.hidden != widget.hidden) {
      _flipFromHidden = oldWidget.hidden;
      if (reduceMotion) {
        _flipController.value = 1;
      } else {
        unawaited(_flipController.forward(from: 0));
      }
    }
  }

  @override
  void dispose() {
    _countController.dispose();
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return NPCard(
      interactive: false,
      color: colors.inkPrimary,
      borderRadius: AppRadius.card,
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Stack(
          children: [
            Positioned.fill(
              child: _GlassAmbientBackground(
                base: colors.inkPrimary,
                accent: colors.accentPrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _LabelChip(
                        label: widget.label,
                        colors: colors,
                        textTheme: textTheme,
                      ),
                      _EyeToggle(
                        hidden: widget.hidden,
                        onTap: widget.onToggleHidden,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AnimatedBuilder(
                    animation: Listenable.merge([
                      _countCurve,
                      _flipController,
                    ]),
                    builder: (context, _) {
                      final reduceMotion = MediaQuery.of(
                        context,
                      ).disableAnimations;
                      final flipT = reduceMotion ? 1.0 : _flipController.value;
                      final showingOld = flipT < 0.5;
                      final displayHidden = showingOld
                          ? _flipFromHidden
                          : widget.hidden;
                      final angle = reduceMotion
                          ? 0.0
                          : (showingOld
                                ? flipT * math.pi
                                : (flipT - 1) * math.pi);

                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateX(angle),
                        child: displayHidden
                            ? _MaskedAmount(
                                currencyCode: widget.balance.currencyCode,
                                textTheme: textTheme,
                              )
                            : _AnimatedAmount(
                                value: _amountTween.evaluate(_countCurve),
                                currencyCode: widget.balance.currencyCode,
                                textTheme: textTheme,
                              ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Ambient glass shade behind the balance card's content: two soft emerald
/// glow blobs drift on a slow reverse loop, layered with a diagonal glass
/// sheen and a hairline edge highlight. Deliberately low-opacity — this is
/// design.md §10's one permitted sheen exception, not a themeable effect.
class _GlassAmbientBackground extends StatefulWidget {
  const _GlassAmbientBackground({required this.base, required this.accent});

  final Color base;
  final Color accent;

  @override
  State<_GlassAmbientBackground> createState() =>
      _GlassAmbientBackgroundState();
}

class _GlassAmbientBackgroundState extends State<_GlassAmbientBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _drift;
  bool _didInit = false;

  @override
  void initState() {
    super.initState();
    _drift = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 9),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didInit) return;
    _didInit = true;
    if (MediaQuery.of(context).disableAnimations) {
      _drift.value = 0.5;
    } else {
      unawaited(_drift.repeat(reverse: true));
    }
  }

  @override
  void dispose() {
    _drift.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _drift,
      builder: (context, _) {
        final t = Curves.easeInOut.transform(_drift.value);
        return Stack(
          fit: StackFit.expand,
          children: [
            ColoredBox(color: widget.base),
            Align(
              alignment: Alignment.lerp(
                const Alignment(-1.3, -1.15),
                const Alignment(-0.55, -0.7),
                t,
              )!,
              child: _GlowBlob(color: widget.accent, size: 200, opacity: 0.16),
            ),
            Align(
              alignment: Alignment.lerp(
                const Alignment(1.4, 1.3),
                const Alignment(0.7, 0.85),
                t,
              )!,
              child: _GlowBlob(color: widget.accent, size: 260, opacity: 0.10),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.lerp(
                      Alignment.topLeft,
                      const Alignment(-0.4, -1),
                      t,
                    )!,
                    end: Alignment.lerp(
                      const Alignment(0.4, 1),
                      Alignment.bottomRight,
                      t,
                    )!,
                    colors: [
                      Colors.transparent,
                      Colors.white.withValues(alpha: 0.05),
                      Colors.transparent,
                    ],
                    stops: const [0.35, 0.5, 0.65],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Single soft-edged radial glow — no [ImageFilter] blur, the gradient
/// falloff alone reads as diffuse light at this size/opacity and is far
/// cheaper to animate every frame.
class _GlowBlob extends StatelessWidget {
  const _GlowBlob({
    required this.color,
    required this.size,
    required this.opacity,
  });

  final Color color;
  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withValues(alpha: opacity),
            color.withValues(alpha: 0),
          ],
        ),
      ),
    );
  }
}

class _LabelChip extends StatelessWidget {
  const _LabelChip({
    required this.label,
    required this.colors,
    required this.textTheme,
  });

  final String label;
  final AppColors colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.accentTint,
        borderRadius: BorderRadius.circular(AppRadius.chip),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        child: Text(
          label,
          style: textTheme.labelLarge?.copyWith(
            color: colors.accentDeep,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _EyeToggle extends StatelessWidget {
  const _EyeToggle({required this.hidden, required this.onTap});

  final bool hidden;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        unawaited(HapticFeedback.selectionClick());
        onTap();
      },
      child: Padding(
        // md (12) + icon (20) = 44px tap target — WCAG 2.5.5 minimum.
        // Was xs (4), a 28px target.
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Icon(
          hidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

/// Splits a formatted amount into integer + decimal spans, decimal at ~70%
/// of the integer's font size — design.md §3 money display rule.
class _AnimatedAmount extends StatelessWidget {
  const _AnimatedAmount({
    required this.value,
    required this.currencyCode,
    required this.textTheme,
  });

  final double value;
  final String currencyCode;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final formatted = value.toStringAsFixed(3).split('.');
    final whole = formatted[0];
    final decimals = formatted.length > 1 ? formatted[1] : '000';
    final baseStyle = (textTheme.displayLarge ?? const TextStyle(fontSize: 40))
        .copyWith(color: Colors.white);
    final smallStyle = baseStyle.copyWith(
      fontSize: (baseStyle.fontSize ?? 40) * 0.7,
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

class _MaskedAmount extends StatelessWidget {
  const _MaskedAmount({required this.currencyCode, required this.textTheme});

  final String currencyCode;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final baseStyle = (textTheme.displayLarge ?? const TextStyle(fontSize: 40))
        .copyWith(color: Colors.white);
    final smallStyle = baseStyle.copyWith(
      fontSize: (baseStyle.fontSize ?? 40) * 0.7,
    );

    return RichText(
      text: TextSpan(
        style: baseStyle,
        children: [
          const TextSpan(text: '•••'),
          TextSpan(text: '.•••', style: smallStyle),
          TextSpan(text: ' $currencyCode', style: smallStyle),
        ],
      ),
    );
  }
}
