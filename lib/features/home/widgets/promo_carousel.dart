import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_card.dart';

/// Home dashboard promo carousel (product.md B1). Each slide carries a
/// distinct line-art motif (design.md §7/§10: geometric line illustration,
/// single accent shape, no photos/gradients) so slides read as unique moments
/// rather than three copies of the same tinted card.
class PromoCarousel extends StatefulWidget {
  const PromoCarousel({super.key});

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  late final PageController _controller;
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.88)
      ..addListener(() {
        setState(() => _page = _controller.page ?? 0);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final promos = <_PromoItem>[
      _PromoItem(
        title: l10n.homePromoTitle1,
        body: l10n.homePromoBody1,
        icon: Icons.send_rounded,
        motif: _PromoMotif.send,
      ),
      _PromoItem(
        title: l10n.homePromoTitle2,
        body: l10n.homePromoBody2,
        icon: Icons.card_giftcard_outlined,
        motif: _PromoMotif.rewards,
      ),
      _PromoItem(
        title: l10n.homePromoTitle3,
        body: l10n.homePromoBody3,
        icon: Icons.public,
        motif: _PromoMotif.remittance,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 116,
          child: PageView.builder(
            controller: _controller,
            itemCount: promos.length,
            itemBuilder: (context, index) {
              // Peeking neighbours shrink/fade slightly so the centered slide
              // reads as the highlighted one — the "unique + highlighting"
              // ask, without adding a new color (design-tokens.md restraint).
              final delta = reduceMotion
                  ? 0.0
                  : (index - _page).abs().clamp(0.0, 1.0);
              return Padding(
                padding: const EdgeInsetsDirectional.only(end: AppSpacing.md),
                child: Transform.scale(
                  scale: 1 - (delta * 0.06),
                  child: Opacity(
                    opacity: 1 - (delta * 0.3),
                    child: _PromoCard(item: promos[index]),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Center(
          child: _PageIndicator(count: promos.length, page: _page),
        ),
      ],
    );
  }
}

enum _PromoMotif { send, rewards, remittance }

class _PromoItem {
  const _PromoItem({
    required this.title,
    required this.body,
    required this.icon,
    required this.motif,
  });

  final String title;
  final String body;
  final IconData icon;
  final _PromoMotif motif;
}

class _PromoCard extends StatelessWidget {
  const _PromoCard({required this.item});

  final _PromoItem item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final lineColor = colors.inkPrimary.withValues(alpha: 0.10);

    return NPCard(
      interactive: false,
      color: colors.accentTint,
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Stack(
          children: [
            // Decorative illustration only — mirrored in RTL like any other
            // directional custom art (rtl-localization.md #3).
            Positioned.fill(
              child: Transform(
                alignment: Alignment.center,
                transform: isRtl
                    ? Matrix4.diagonal3Values(-1, 1, 1)
                    : Matrix4.identity(),
                child: CustomPaint(
                  painter: _painterFor(
                    item.motif,
                    lineColor: lineColor,
                    accentColor: colors.accentPrimary,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: colors.accentPrimary.withValues(alpha: 0.14),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        item.icon,
                        size: 22,
                        color: colors.accentDeep,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.titleLarge?.copyWith(
                              color: colors.accentDeep,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            item.body,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodyMedium?.copyWith(
                              color: colors.accentDeep,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

CustomPainter _painterFor(
  _PromoMotif motif, {
  required Color lineColor,
  required Color accentColor,
}) {
  switch (motif) {
    case _PromoMotif.send:
      return _SendMotifPainter(lineColor: lineColor, accentColor: accentColor);
    case _PromoMotif.rewards:
      return _RewardsMotifPainter(
        lineColor: lineColor,
        accentColor: accentColor,
      );
    case _PromoMotif.remittance:
      return _RemittanceMotifPainter(
        lineColor: lineColor,
        accentColor: accentColor,
      );
  }
}

/// Speed-streak chevrons + one filled accent triangle — "send money" motif.
class _SendMotifPainter extends CustomPainter {
  const _SendMotifPainter({required this.lineColor, required this.accentColor});

  final Color lineColor;
  final Color accentColor;

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final originX = size.width - 10;
    const originY = 10.0;
    for (var i = 0; i < 4; i++) {
      final offset = i * 13.0;
      canvas.drawLine(
        Offset(originX - offset, originY + 28),
        Offset(originX - offset + 18, originY + 8),
        linePaint,
      );
    }

    final accentPaint = Paint()..color = accentColor;
    final path = Path()
      ..moveTo(originX + 4, originY - 6)
      ..lineTo(originX - 12, originY + 8)
      ..lineTo(originX, originY + 4)
      ..close();
    canvas.drawPath(path, accentPaint);
  }

  @override
  bool shouldRepaint(covariant _SendMotifPainter oldDelegate) =>
      oldDelegate.lineColor != lineColor ||
      oldDelegate.accentColor != accentColor;
}

/// Scattered coin rings + one filled accent dot — "rewards" motif.
class _RewardsMotifPainter extends CustomPainter {
  const _RewardsMotifPainter({
    required this.lineColor,
    required this.accentColor,
  });

  final Color lineColor;
  final Color accentColor;

  @override
  void paint(Canvas canvas, Size size) {
    final ringPaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final anchors = [
      Offset(size.width - 16, 18),
      Offset(size.width - 38, 10),
      Offset(size.width - 12, 42),
    ];
    const radii = [10.0, 6.0, 5.0];
    for (var i = 0; i < anchors.length; i++) {
      canvas.drawCircle(anchors[i], radii[i], ringPaint);
    }

    canvas.drawCircle(anchors[0], 3, Paint()..color = accentColor);
  }

  @override
  bool shouldRepaint(covariant _RewardsMotifPainter oldDelegate) =>
      oldDelegate.lineColor != lineColor ||
      oldDelegate.accentColor != accentColor;
}

/// Dashed route arc ending in a pin — "track remittance" motif.
class _RemittanceMotifPainter extends CustomPainter {
  const _RemittanceMotifPainter({
    required this.lineColor,
    required this.accentColor,
  });

  final Color lineColor;
  final Color accentColor;

  @override
  void paint(Canvas canvas, Size size) {
    final dashPaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final start = Offset(size.width - 48, 44);
    final end = Offset(size.width - 12, 10);
    final control = Offset(size.width - 42, 6);
    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..quadraticBezierTo(control.dx, control.dy, end.dx, end.dy);

    _drawDashedPath(canvas, path, dashPaint);
    canvas.drawCircle(end, 4, Paint()..color = accentColor);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    const dashLength = 4.0;
    const gapLength = 4.0;
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = (distance + dashLength).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance = next + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _RemittanceMotifPainter oldDelegate) =>
      oldDelegate.lineColor != lineColor ||
      oldDelegate.accentColor != accentColor;
}

/// Active-slide pill + inactive dots below the carousel.
class _PageIndicator extends StatelessWidget {
  const _PageIndicator({required this.count, required this.page});

  final int count;
  final double page;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final activeIndex = page.round().clamp(0, count - 1);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < count; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              curve: Curves.easeOutCubic,
              width: i == activeIndex ? 18 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: i == activeIndex
                    ? colors.accentPrimary
                    : colors.inkTertiary.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(AppRadius.chip),
              ),
            ),
          ),
      ],
    );
  }
}
