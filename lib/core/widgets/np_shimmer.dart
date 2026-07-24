import 'dart:async';

import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';

/// Loading skeleton — design.md loading-state requirement for every async
/// screen. A rounded-rect block filled with `surface.sunken` with a looping
/// diagonal light-sweep animation. Degrades to a static block when
/// `MediaQuery.of(context).disableAnimations` is true.
class NPShimmer extends StatefulWidget {
  const NPShimmer({
    super.key,
    this.width,
    this.height = 16,
    this.borderRadius = AppRadius.input,
  });

  /// Text-line shaped shimmer (default height, input radius).
  const NPShimmer.line({super.key, this.width, this.height = 16})
    : borderRadius = AppRadius.input;

  /// Larger block shimmer for card-shaped placeholders.
  const NPShimmer.card({super.key, this.width, this.height = 120})
    : borderRadius = AppRadius.card;

  /// Null expands to fill available width.
  final double? width;
  final double height;
  final double borderRadius;

  @override
  State<NPShimmer> createState() => _NPShimmerState();
}

class _NPShimmerState extends State<NPShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
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
    final colors = Theme.of(context).extension<AppColors>()!;
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final base = colors.surfaceSunken;
    final radius = BorderRadius.circular(widget.borderRadius);

    if (reduceMotion) {
      return DecoratedBox(
        decoration: BoxDecoration(color: base, borderRadius: radius),
        child: SizedBox(width: widget.width, height: widget.height),
      );
    }

    final highlight = Color.alphaBlend(
      colors.inkPrimary.withValues(alpha: 0.08),
      base,
    );

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        // Sweeps a highlight band diagonally across the block on a loop.
        final shift = 3 * _controller.value - 1;
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: radius,
            gradient: LinearGradient(
              begin: Alignment(-1 + shift, -1),
              end: Alignment(1 + shift, 1),
              colors: [base, highlight, base],
              stops: const [0.35, 0.5, 0.65],
            ),
          ),
          child: SizedBox(width: widget.width, height: widget.height),
        );
      },
    );
  }
}
