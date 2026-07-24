import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_plate.dart';

/// Draggable circular entry point to Screen K1 ("Ask Emral") — design.md §11.
/// Local UI state only (drag position + animation controllers), per
/// flutter-conventions.md's local-UI-state exception; the tap destination
/// itself is the only business action, handled by `context.push`.
///
/// The caller must wrap its body in a `Stack(fit: StackFit.expand, ...)`
/// with this widget as a direct child — [LayoutBuilder] then reads the
/// Stack's own resolved box as the drag bounds, so the FAB can never clamp
/// itself past the visible content area (it previously used raw
/// `MediaQuery.sizeOf`, which double-counts `NPScaffold`'s gutter padding
/// and clipped the button off-screen).
class AssistantFab extends StatefulWidget {
  const AssistantFab({super.key});

  @override
  State<AssistantFab> createState() => _AssistantFabState();
}

class _AssistantFabState extends State<AssistantFab>
    with TickerProviderStateMixin {
  static const _size = 56.0;

  Offset? _position;
  late final AnimationController _wobbleController;
  late final AnimationController _pulseController;
  late final AnimationController _snapController;
  late Animation<Offset> _snapAnimation;

  @override
  void initState() {
    super.initState();
    _wobbleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    unawaited(_wobbleController.repeat(reverse: true));
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    unawaited(_pulseController.repeat(reverse: true));
    _snapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );
    _snapAnimation = const AlwaysStoppedAnimation(Offset.zero);
  }

  @override
  void dispose() {
    _wobbleController.dispose();
    _pulseController.dispose();
    _snapController.dispose();
    super.dispose();
  }

  Offset _clamp(Offset offset, Size bounds) {
    return Offset(
      offset.dx.clamp(0.0, math.max(0, bounds.width - _size)),
      offset.dy.clamp(0.0, math.max(0, bounds.height - _size)),
    );
  }

  void _onPanUpdate(DragUpdateDetails details, Size bounds) {
    setState(() => _position = _clamp(_position! + details.delta, bounds));
  }

  void _onPanEnd(Size bounds) {
    final current = _position!;
    final targetDx = current.dx < (bounds.width - _size) / 2
        ? 0.0
        : bounds.width - _size;
    unawaited(HapticFeedback.heavyImpact());
    _snapAnimation =
        Tween<Offset>(
            begin: current,
            end: Offset(targetDx, current.dy),
          ).animate(
            CurvedAnimation(parent: _snapController, curve: Curves.easeOutBack),
          )
          ..addListener(() => setState(() => _position = _snapAnimation.value));
    unawaited(_snapController.forward(from: 0));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).extension<AppColors>()!;
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bounds = constraints.biggest;
        _position ??= Offset(
          isRtl ? AppSpacing.gutter : bounds.width - _size - AppSpacing.gutter,
          bounds.height * 0.62,
        );
        final position = _clamp(_position!, bounds);

        return Positioned(
          left: position.dx,
          top: position.dy,
          child: Semantics(
            label: l10n.chatFabSemanticLabel,
            button: true,
            child: GestureDetector(
              onPanStart: (_) => unawaited(HapticFeedback.selectionClick()),
              onPanUpdate: (details) => _onPanUpdate(details, bounds),
              onPanEnd: (_) => _onPanEnd(bounds),
              onTap: () {
                unawaited(HapticFeedback.selectionClick());
                unawaited(context.push(Routes.assistant));
              },
              child: AnimatedBuilder(
                animation: Listenable.merge([
                  _wobbleController,
                  _pulseController,
                ]),
                builder: (context, child) {
                  final wobble = reduceMotion ? 0.0 : _wobbleController.value;
                  final pulse = reduceMotion ? 0.0 : _pulseController.value;
                  final scale = 1.0 + 0.06 * wobble;
                  return SizedBox(
                    width: _size + 24,
                    height: _size + 24,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(
                          opacity: 0.4 * pulse,
                          child: Container(
                            width: _size + 20 * pulse,
                            height: _size + 20 * pulse,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors.accentPrimary,
                            ),
                          ),
                        ),
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(0, 1, 0.05 * wobble)
                            ..scaleByDouble(scale, scale, 1, 1),
                          child: SizedBox(
                            width: _size,
                            height: _size,
                            child: NPPlate(
                              color: colors.accentPrimary,
                              shadowColor: colors.accentDeep,
                              borderRadius: _size / 2,
                              padding: EdgeInsets.zero,
                              child: const Center(
                                child: Icon(
                                  Icons.smart_toy_outlined,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
