import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';

/// One tab segment: a label with an optional leading icon.
typedef NPSegment = ({String label, IconData? icon});

/// design.md §6 `NPSegmentedTabs` — `surface.sunken` track with a sliding
/// `surface.card` indicator behind the selected segment. The indicator uses
/// [AlignmentDirectional] (never `left`/`right`) so it slides toward the
/// correct edge in RTL. Icon morph is out of scope for v1 — only icon/label
/// color changes on selection.
class NPSegmentedTabs extends StatelessWidget {
  NPSegmentedTabs({
    required this.segments,
    required this.selectedIndex,
    required this.onChanged,
    super.key,
  }) : assert(
         segments.isNotEmpty,
         'NPSegmentedTabs requires at least one segment',
       );

  final List<NPSegment> segments;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  static const double _height = 36;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final count = segments.length;

    // Standard Align-in-Stack spacing formula: an indicator sized to
    // `1/count` of the track maps segment `i` to alignment x = 2i/(n-1) - 1.
    final indicatorX = count > 1 ? (2 * selectedIndex / (count - 1)) - 1 : 0.0;

    return Container(
      height: _height + AppSpacing.xs * 2,
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: colors.surfaceSunken,
        borderRadius: BorderRadius.circular(AppRadius.chip),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: reduceMotion
                ? Duration.zero
                : const Duration(milliseconds: 240),
            curve: Curves.easeOutCubic,
            alignment: AlignmentDirectional(indicatorX, 0),
            child: FractionallySizedBox(
              widthFactor: 1 / count,
              child: Container(
                height: _height,
                decoration: BoxDecoration(
                  color: colors.surfaceCard,
                  borderRadius: BorderRadius.circular(AppRadius.chip),
                ),
              ),
            ),
          ),
          Row(
            children: [
              for (var i = 0; i < count; i++)
                Expanded(
                  child: _Segment(
                    segment: segments[i],
                    selected: i == selectedIndex,
                    height: _height,
                    onTap: () {
                      if (i == selectedIndex) return;
                      unawaited(HapticFeedback.lightImpact());
                      onChanged(i);
                    },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.segment,
    required this.selected,
    required this.height,
    required this.onTap,
  });

  final NPSegment segment;
  final bool selected;
  final double height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    final ink = selected ? colors.inkPrimary : colors.inkSecondary;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: height,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (segment.icon != null) ...[
                Icon(segment.icon, size: 16, color: ink),
                const SizedBox(width: AppSpacing.xs),
              ],
              Text(
                segment.label,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: ink,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
