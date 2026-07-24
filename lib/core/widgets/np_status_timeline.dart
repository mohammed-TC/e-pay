import 'dart:async';

import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';

/// Status of a single [NPTimelineStep] in [NPStatusTimeline].
enum NPTimelineStepStatus { done, active, pending }

/// One row of [NPStatusTimeline] — a node + label + optional subtitle
/// (typically a timestamp).
class NPTimelineStep {
  const NPTimelineStep({
    required this.label,
    required this.status,
    this.subtitle,
  });

  final String label;
  final String? subtitle;
  final NPTimelineStepStatus status;
}

/// design.md — vertical status tracker (e.g. remittance/bill progress).
/// Active node = emerald fill with a pulsing ring (respects
/// `MediaQuery.disableAnimations` — static ring when reduced motion is on).
/// Completed nodes = solid emerald, no pulse. Pending nodes = outline only.
/// Directional-only layout — no `left`/`right`.
class NPStatusTimeline extends StatefulWidget {
  const NPStatusTimeline({required this.steps, super.key});

  final List<NPTimelineStep> steps;

  @override
  State<NPStatusTimeline> createState() => _NPStatusTimelineState();
}

class _NPStatusTimelineState extends State<NPStatusTimeline>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  bool _reduceMotion = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    if (reduceMotion == _reduceMotion) return;
    _reduceMotion = reduceMotion;
    if (reduceMotion) {
      _pulseController.stop();
    } else {
      unawaited(_pulseController.repeat());
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final steps = widget.steps;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < steps.length; i++)
          _TimelineRow(
            step: steps[i],
            isLast: i == steps.length - 1,
            connectorColor: steps[i].status == NPTimelineStepStatus.done
                ? colors.accentPrimary
                : colors.surfaceSunken,
            pulseController: _pulseController,
            reduceMotion: _reduceMotion,
            colors: colors,
            textTheme: textTheme,
          ),
      ],
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({
    required this.step,
    required this.isLast,
    required this.connectorColor,
    required this.pulseController,
    required this.reduceMotion,
    required this.colors,
    required this.textTheme,
  });

  final NPTimelineStep step;
  final bool isLast;
  final Color connectorColor;
  final AnimationController pulseController;
  final bool reduceMotion;
  final AppColors colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 24,
            child: Column(
              children: [
                _Node(
                  status: step.status,
                  pulseController: pulseController,
                  reduceMotion: reduceMotion,
                  colors: colors,
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(
                        vertical: AppSpacing.xs,
                      ),
                      color: connectorColor,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.label,
                    style: textTheme.titleLarge?.copyWith(
                      color: step.status == NPTimelineStepStatus.pending
                          ? colors.inkTertiary
                          : colors.inkPrimary,
                    ),
                  ),
                  if (step.subtitle != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(step.subtitle!, style: textTheme.bodySmall),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Node extends StatelessWidget {
  const _Node({
    required this.status,
    required this.pulseController,
    required this.reduceMotion,
    required this.colors,
  });

  static const double _size = 12;

  final NPTimelineStepStatus status;
  final AnimationController pulseController;
  final bool reduceMotion;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    final dot = Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: status == NPTimelineStepStatus.pending
            ? null
            : colors.accentPrimary,
        border: status == NPTimelineStepStatus.pending
            ? Border.all(color: colors.inkTertiary, width: 1.5)
            : null,
      ),
    );

    if (status != NPTimelineStepStatus.active) {
      return SizedBox(width: 24, height: 24, child: Center(child: dot));
    }

    if (reduceMotion) {
      return SizedBox(
        width: 24,
        height: 24,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: _size * 1.6,
                height: _size * 1.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colors.accentPrimary.withValues(alpha: 0.3),
                    width: 2,
                  ),
                ),
              ),
              dot,
            ],
          ),
        ),
      );
    }

    return SizedBox(
      width: 24,
      height: 24,
      child: Center(
        child: AnimatedBuilder(
          animation: pulseController,
          builder: (context, _) {
            final t = pulseController.value;
            return Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: (1 - t) * 0.5,
                  child: Transform.scale(
                    scale: 1 + t * 1.4,
                    child: Container(
                      width: _size,
                      height: _size,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.accentPrimary,
                      ),
                    ),
                  ),
                ),
                dot,
              ],
            );
          },
        ),
      ),
    );
  }
}
