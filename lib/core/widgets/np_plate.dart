import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/theme/app_spacing.dart';

/// Shared NeoPop Plate physics — design.md §4/§5, rtl-localization.md #3.
///
/// Single source of truth for the hard-offset-shadow press interaction used
/// by [NPCard]/[NPButton] variants. Resting shadow offset is (4,4) LTR /
/// (-4,4) RTL; pressed translates (3,3) LTR / (-3,3) RTL over 80ms with a
/// `selectionClick` haptic. Static (non-interactive) plates render a soft
/// shadow instead and never respond to touch.
class NPPlate extends StatefulWidget {
  const NPPlate({
    required this.child,
    super.key,
    this.onTap,
    this.color,
    this.shadowColor,
    this.borderColor,
    this.borderRadius = AppRadius.card,
    this.interactive = true,
    this.padding,
  });

  final Widget child;
  final VoidCallback? onTap;
  final Color? color;
  final Color? shadowColor;
  final Color? borderColor;
  final double borderRadius;

  /// `true` = hard-shadow tappable plate; `false` = soft-shadow static card.
  /// design.md §4: "Never mix hard (tappable) and soft (static) shadows."
  final bool interactive;
  final EdgeInsetsGeometry? padding;

  @override
  State<NPPlate> createState() => _NPPlateState();
}

class _NPPlateState extends State<NPPlate> {
  bool _pressed = false;

  bool get _isTappable => widget.interactive && widget.onTap != null;

  void _setPressed(bool value) {
    if (!_isTappable || _pressed == value) return;
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = widget.color ?? theme.colorScheme.surface;
    final shadowColor = widget.shadowColor ?? theme.colorScheme.shadow;
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final reduceMotion = MediaQuery.of(context).disableAnimations;

    final restingDx = isRtl ? -4.0 : 4.0;
    final offset = widget.interactive && _pressed
        ? Offset(restingDx * 0.75, 3)
        : Offset(restingDx, 4);

    final content = AnimatedContainer(
      duration: reduceMotion ? Duration.zero : const Duration(milliseconds: 80),
      curve: Curves.easeOutCubic,
      transform: widget.interactive && _pressed
          ? Matrix4.translationValues(isRtl ? -3 : 3, 3, 0)
          : Matrix4.identity(),
      padding: widget.padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: widget.interactive
            ? Border.all(
                color:
                    widget.borderColor ??
                    theme.colorScheme.onSurface.withValues(alpha: 0.08),
              )
            : null,
        boxShadow: widget.interactive
            ? [BoxShadow(color: shadowColor, offset: offset, blurRadius: 0)]
            : [
                BoxShadow(
                  color: shadowColor.withValues(alpha: 0.06),
                  offset: const Offset(0, 8),
                  blurRadius: 24,
                ),
              ],
      ),
      child: widget.child,
    );

    if (!_isTappable) return content;

    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapCancel: () => _setPressed(false),
      onTapUp: (_) => _setPressed(false),
      onTap: () {
        unawaited(HapticFeedback.selectionClick());
        widget.onTap!();
      },
      behavior: HitTestBehavior.opaque,
      child: content,
    );
  }
}
