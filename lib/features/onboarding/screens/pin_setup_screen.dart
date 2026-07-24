import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_pin_pad.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../providers/auth_state_provider.dart';

/// Screen A7 — PIN Setup
class PinSetupScreen extends ConsumerStatefulWidget {
  const PinSetupScreen({super.key});

  @override
  ConsumerState<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends ConsumerState<PinSetupScreen>
    with SingleTickerProviderStateMixin {
  static const _pinLength = 4;

  late final AnimationController _shakeController;
  String _firstPin = '';
  String _currentInput = '';
  bool _confirming = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _handleKeyTap(String key) {
    if (key == 'backspace') {
      if (_currentInput.isNotEmpty) {
        setState(
          () => _currentInput = _currentInput.substring(
            0,
            _currentInput.length - 1,
          ),
        );
      }
      return;
    }
    if (_currentInput.length >= _pinLength) return;
    setState(() {
      _error = null;
      _currentInput += key;
    });
    if (_currentInput.length == _pinLength) {
      unawaited(_handleStageComplete());
    }
  }

  Future<void> _handleStageComplete() async {
    if (!_confirming) {
      setState(() {
        _firstPin = _currentInput;
        _currentInput = '';
        _confirming = true;
      });
      return;
    }
    if (_currentInput == _firstPin) {
      await ref.read(appAuthStateProvider.notifier).setPin(_currentInput);
      if (!mounted) return;
      context.go(Routes.biometricSetup);
      return;
    }
    unawaited(HapticFeedback.heavyImpact());
    if (!MediaQuery.of(context).disableAnimations) {
      unawaited(_shakeController.forward(from: 0));
    }
    setState(() {
      _error = context.l10n.pinSetupMismatch;
      _firstPin = '';
      _currentInput = '';
      _confirming = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return NPScaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _confirming
                        ? context.l10n.pinSetupConfirmTitle
                        : context.l10n.pinSetupCreateTitle,
                    style: textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    _confirming
                        ? context.l10n.pinSetupConfirmSubtitle
                        : context.l10n.pinSetupCreateSubtitle,
                    style: textTheme.bodyLarge?.copyWith(
                      color: colors.inkSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  Semantics(
                    liveRegion: true,
                    label: context.l10n.pinSetupProgressLabel(
                      _currentInput.length,
                      _pinLength,
                    ),
                    child: AnimatedBuilder(
                      animation: _shakeController,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                            _shakeOffset(_shakeController.value),
                            0,
                          ),
                          child: child,
                        );
                      },
                      child: NPCard(
                        interactive: false,
                        borderRadius: AppRadius.card,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xl,
                          vertical: AppSpacing.lg,
                        ),
                        child: _PinDots(
                          length: _pinLength,
                          filled: _currentInput.length,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  SizedBox(
                    height: 16,
                    child: _error != null
                        ? Text(
                            _error!,
                            style: textTheme.bodySmall?.copyWith(
                              color: colors.semanticDanger,
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(height: AppSpacing.sectionGap),
                  NPPinPad(onKeyTap: _handleKeyTap),
                  const SizedBox(height: AppSpacing.lg),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  double _shakeOffset(double t) {
    if (t <= 0 || t >= 1) return 0;
    return 10 * (1 - t) * math.sin(t * 4 * math.pi);
  }
}

class _PinDots extends StatelessWidget {
  const _PinDots({required this.length, required this.filled});

  final int length;
  final int filled;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (i) {
        final isFilled = i < filled;
        return Container(
          width: 16,
          height: 16,
          margin: const EdgeInsetsDirectional.symmetric(
            horizontal: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFilled ? colors.accentPrimary : colors.surfaceSunken,
            border: Border.all(
              color: colors.inkTertiary.withValues(alpha: 0.3),
            ),
          ),
        );
      }),
    );
  }
}
