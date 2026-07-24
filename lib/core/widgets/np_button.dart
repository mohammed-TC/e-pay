import 'dart:async';

import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import 'np_plate.dart';

enum NPButtonVariant { primary, secondary, ghost }

/// design.md §6 `NPButton` — plate physics; heights 56 (primary/secondary) /
/// ghost is borderless emerald text. Loading swaps the label for a 3-dot
/// bounce (design.md §5 motion discipline: no spinners on tappables).
class NPButton extends StatelessWidget {
  const NPButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.variant = NPButtonVariant.primary,
    this.loading = false,
    this.leadingIcon,
  });

  final String label;
  final VoidCallback? onPressed;
  final NPButtonVariant variant;
  final bool loading;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final enabled = onPressed != null && !loading;

    if (variant == NPButtonVariant.ghost) {
      return TextButton(
        onPressed: enabled ? onPressed : null,
        style: TextButton.styleFrom(
          foregroundColor: colors.accentPrimary,
          splashFactory: NoSplash.splashFactory,
        ),
        child: _content(
          textColor: colors.accentPrimary,
          textTheme: textTheme,
          colors: colors,
        ),
      );
    }

    final isPrimary = variant == NPButtonVariant.primary;
    final fill = isPrimary ? colors.accentPrimary : colors.surfaceCard;
    final shadow = isPrimary ? colors.accentDeep : colors.plateShadow;
    final textColor = isPrimary ? Colors.white : colors.inkPrimary;

    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: NPCardButtonPlate(
        height: isPrimary ? 56 : 44,
        color: fill,
        shadowColor: shadow,
        onTap: enabled ? onPressed : null,
        child: _content(
          textColor: textColor,
          textTheme: textTheme,
          colors: colors,
        ),
      ),
    );
  }

  Widget _content({
    required Color textColor,
    required TextTheme textTheme,
    required AppColors colors,
  }) {
    if (loading) return _BouncingDots(color: textColor);
    final text = Text(
      label,
      style: textTheme.labelLarge?.copyWith(
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
    );
    if (leadingIcon == null) return text;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(leadingIcon, size: 18, color: textColor),
        const SizedBox(width: AppSpacing.sm),
        text,
      ],
    );
  }
}

/// Internal: full-width plate shell for [NPButton] primary/secondary variants.
class NPCardButtonPlate extends StatelessWidget {
  const NPCardButtonPlate({
    required this.child,
    required this.height,
    required this.color,
    required this.shadowColor,
    super.key,
    this.onTap,
  });

  final Widget child;
  final double height;
  final Color color;
  final Color shadowColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: NPPlate(
        onTap: onTap,
        color: color,
        shadowColor: shadowColor,
        borderRadius: 14,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
        child: Center(child: child),
      ),
    );
  }
}

class _BouncingDots extends StatefulWidget {
  const _BouncingDots({required this.color});

  final Color color;

  @override
  State<_BouncingDots> createState() => _BouncingDotsState();
}

class _BouncingDotsState extends State<_BouncingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    unawaited(_controller.repeat());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    if (reduceMotion) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (i) => _dot(widget.color, 1)),
      );
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final t = (_controller.value - i * 0.15) % 1.0;
            final scale = 0.6 + 0.4 * (1 - (t - 0.5).abs() * 2).clamp(0.0, 1.0);
            return _dot(widget.color, scale);
          }),
        );
      },
    );
  }

  Widget _dot(Color color, double scale) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2),
    child: Transform.scale(
      scale: scale,
      child: Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    ),
  );
}
