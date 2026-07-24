import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

/// App-wide background — a faint dot grid on `surface.page`, referencing
/// design.md's "Mint Ledger" concept (ledger/graph paper). Applied above
/// every routed screen except Splash, which has its own animated
/// `SplashLedgerTexture`. Static and non-directional: no RTL mirroring
/// needed (design-tokens.md §RTL applies to directional motifs only).
class NPBackground extends StatelessWidget {
  const NPBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return ColoredBox(
      color: colors.surfacePage,
      child: CustomPaint(
        painter: _DotGridPainter(dotColor: colors.inkPrimary),
        child: child,
      ),
    );
  }
}

class _DotGridPainter extends CustomPainter {
  const _DotGridPainter({required this.dotColor});

  final Color dotColor;

  static const double _pitch = 24;
  static const double _radius = 1.5;
  static const double _opacity = 0.07;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = dotColor.withValues(alpha: _opacity);
    for (var y = _pitch / 2; y < size.height; y += _pitch) {
      for (var x = _pitch / 2; x < size.width; x += _pitch) {
        canvas.drawCircle(Offset(x, y), _radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotGridPainter oldDelegate) =>
      oldDelegate.dotColor != dotColor;
}
