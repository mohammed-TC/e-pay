import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

/// Ambient animated background for the splash screen — a faint ledger-line
/// texture that references design.md's "Mint Ledger" concept. Ink-only per
/// the emerald restraint rule (accent never appears as decoration).
class SplashLedgerTexture extends StatefulWidget {
  const SplashLedgerTexture({super.key});

  @override
  State<SplashLedgerTexture> createState() => _SplashLedgerTextureState();
}

class _SplashLedgerTextureState extends State<SplashLedgerTexture>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  );
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_started) {
      _started = true;
      if (!MediaQuery.of(context).disableAnimations) {
        unawaited(_controller.repeat());
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ink = Theme.of(context).extension<AppColors>()!.inkPrimary;
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            painter: _LedgerTexturePainter(phase: _controller.value, ink: ink),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _LedgerTexturePainter extends CustomPainter {
  _LedgerTexturePainter({required this.phase, required this.ink});

  final double phase;
  final Color ink;

  static const double _lineSpacing = 34;
  static const double _baseOpacity = 0.08;
  static const double _waveOpacity = 0.10;

  @override
  void paint(Canvas canvas, Size size) {
    final lineCount = (size.height / _lineSpacing).ceil() + 1;
    for (var i = 0; i < lineCount; i++) {
      final y = i * _lineSpacing;
      final wave = math.sin((phase * 2 * math.pi) + i * 0.4);
      final opacity = _baseOpacity + _waveOpacity * (0.5 + 0.5 * wave);
      final paint = Paint()
        ..color = ink.withValues(alpha: opacity)
        ..strokeWidth = 1;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _LedgerTexturePainter oldDelegate) =>
      oldDelegate.phase != phase || oldDelegate.ink != ink;
}
