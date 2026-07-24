import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_pin_pad.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../providers/payment_flow_provider.dart';

/// PIN step of the shared payment flow (payment-flow.md) — wraps the
/// presentational [NPPinPad] with the 4-dot progress indicator, wrong-PIN
/// shake + haptic, remaining-attempts copy, and the cooldown terminal state.
/// Business logic (verification, attempt counting) lives entirely in
/// [PaymentFlowNotifier]; this widget only renders its state and forwards
/// completed 4-digit entries.
class PinStep extends ConsumerStatefulWidget {
  const PinStep({
    required this.onSubmit,
    required this.onCooldownCancel,
    super.key,
  });

  /// Called with the completed 4-digit PIN string.
  final ValueChanged<String> onSubmit;

  /// Called when the user cancels out of a cooldown terminal state.
  final VoidCallback onCooldownCancel;

  @override
  ConsumerState<PinStep> createState() => _PinStepState();
}

class _PinStepState extends ConsumerState<PinStep>
    with SingleTickerProviderStateMixin {
  static const _maxDigits = 4;

  final _digits = <String>[];
  late final AnimationController _shakeController;

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

  void _onKeyTap(String key) {
    final state = ref.read(paymentFlowProvider);
    if (state.step == PaymentFlowStep.processing || state.cooldown) return;

    if (key == 'backspace') {
      if (_digits.isNotEmpty) setState(_digits.removeLast);
      return;
    }
    if (_digits.length >= _maxDigits) return;

    setState(() => _digits.add(key));
    if (_digits.length == _maxDigits) {
      final pin = _digits.join();
      setState(_digits.clear);
      widget.onSubmit(pin);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;

    ref.listen(paymentFlowProvider, (previous, next) {
      if (previous != null && next.shakeTrigger != previous.shakeTrigger) {
        unawaited(HapticFeedback.heavyImpact());
        if (!MediaQuery.of(context).disableAnimations) {
          unawaited(_shakeController.forward(from: 0));
        }
      }
    });

    final flowState = ref.watch(paymentFlowProvider);

    if (flowState.cooldown) {
      return _CooldownMessage(
        colors: colors,
        textTheme: textTheme,
        onCancel: widget.onCooldownCancel,
      );
    }

    return AnimatedBuilder(
      animation: _shakeController,
      builder: (context, child) {
        final t = _shakeController.value;
        final decay = 1 - t;
        final offset = math.sin(t * math.pi * 6) * 10 * decay;
        return Transform.translate(offset: Offset(offset, 0), child: child);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(l10n.paymentPinTitle, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.xl),
          _DotProgress(
            filled: _digits.length,
            total: _maxDigits,
            colors: colors,
          ),
          const SizedBox(height: AppSpacing.xl),
          if (flowState.step == PaymentFlowStep.processing) ...[
            const NPShimmer.line(width: 160),
            const SizedBox(height: AppSpacing.md),
            Text(
              l10n.paymentProcessingLabel,
              style: textTheme.bodyMedium?.copyWith(color: colors.inkSecondary),
            ),
          ] else ...[
            NPPinPad(onKeyTap: _onKeyTap),
            const SizedBox(height: AppSpacing.lg),
            if (flowState.pinAttempts > 0)
              Text(
                l10n.paymentPinAttemptsRemaining(flowState.attemptsRemaining),
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.semanticDanger,
                ),
              ),
          ],
        ],
      ),
    );
  }
}

class _DotProgress extends StatelessWidget {
  const _DotProgress({
    required this.filled,
    required this.total,
    required this.colors,
  });

  final int filled;
  final int total;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(total, (i) {
        final isFilled = i < filled;
        return Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppSpacing.sm,
          ),
          child: Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isFilled ? colors.accentPrimary : colors.surfaceSunken,
              border: Border.all(
                color: isFilled
                    ? colors.accentPrimary
                    : colors.inkPrimary.withValues(alpha: 0.16),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _CooldownMessage extends StatelessWidget {
  const _CooldownMessage({
    required this.colors,
    required this.textTheme,
    required this.onCancel,
  });

  final AppColors colors;
  final TextTheme textTheme;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.lock_clock_outlined, size: 48, color: colors.semanticDanger),
        const SizedBox(height: AppSpacing.lg),
        Text(
          l10n.paymentPinCooldownMessage,
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge?.copyWith(color: colors.inkSecondary),
        ),
        const SizedBox(height: AppSpacing.xl),
        NPButton(label: l10n.paymentCancelCta, onPressed: onCancel),
      ],
    );
  }
}
