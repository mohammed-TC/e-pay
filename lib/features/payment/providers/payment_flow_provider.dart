import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/auth_repository.dart';
import '../models/payment_request.dart';
import '../models/payment_result.dart';
import 'payment_service.dart';

part 'payment_flow_provider.g.dart';

/// Step of the shared confirm → PIN → processing → terminal flow —
/// architecture.md §4. Concrete implementation of the state machine the spec
/// describes (`ConfirmSheet` → `PinScreen` → success/error).
enum PaymentFlowStep { reviewing, pin, processing, terminal }

/// Immutable state for a single in-flight payment — one [PaymentFlowState]
/// per push of [PaymentConfirmScreen] (see `payment_confirm_screen.dart`).
@immutable
class PaymentFlowState {
  const PaymentFlowState({
    this.step = PaymentFlowStep.reviewing,
    this.pinAttempts = 0,
    this.shakeTrigger = 0,
    this.cooldown = false,
    this.result,
  });

  /// PIN attempts: 3 max → cooldown — payment-flow.md.
  static const maxPinAttempts = 3;

  final PaymentFlowStep step;
  final int pinAttempts;

  /// Bumped on every wrong-PIN entry; `pin_step.dart` `ref.listen`s this to
  /// fire its shake animation without re-deriving "did it just fail" from
  /// counters alone.
  final int shakeTrigger;
  final bool cooldown;
  final PaymentResult? result;

  int get attemptsRemaining => maxPinAttempts - pinAttempts;

  PaymentFlowState copyWith({
    PaymentFlowStep? step,
    int? pinAttempts,
    int? shakeTrigger,
    bool? cooldown,
    PaymentResult? result,
  }) {
    return PaymentFlowState(
      step: step ?? this.step,
      pinAttempts: pinAttempts ?? this.pinAttempts,
      shakeTrigger: shakeTrigger ?? this.shakeTrigger,
      cooldown: cooldown ?? this.cooldown,
      result: result ?? this.result,
    );
  }
}

/// Per-flow-instance state machine for the shared payment flow —
/// architecture.md §4. Autodispose (no `keepAlive`): `PaymentConfirmScreen`
/// is pushed fresh per payment, so a fresh push naturally gets fresh state —
/// no manual reset-on-mount needed.
@Riverpod(keepAlive: false)
class PaymentFlowNotifier extends _$PaymentFlowNotifier {
  @override
  PaymentFlowState build() => const PaymentFlowState();

  /// Confirm step → PIN step.
  void beginPin() {
    state = state.copyWith(step: PaymentFlowStep.pin);
  }

  /// Verifies [pin] via `authRepositoryProvider`. On mismatch: increments the
  /// attempt count, bumps the shake trigger, and sets cooldown once attempts
  /// hit [PaymentFlowState.maxPinAttempts]. On match: transitions to
  /// `processing`, calls `paymentServiceProvider.execute` exactly once (the
  /// only atomic debit/append/credit call site — never duplicated here), and
  /// stores the resulting [PaymentResult] in the terminal step.
  Future<void> submitPin(String pin, PaymentRequest request) async {
    if (state.cooldown) return;

    final verified = await ref.read(authRepositoryProvider).verifyPin(pin);
    if (!verified) {
      final attempts = state.pinAttempts + 1;
      state = state.copyWith(
        pinAttempts: attempts,
        shakeTrigger: state.shakeTrigger + 1,
        cooldown: attempts >= PaymentFlowState.maxPinAttempts,
      );
      return;
    }

    state = state.copyWith(step: PaymentFlowStep.processing);
    final result = await ref.read(paymentServiceProvider).execute(request);
    state = state.copyWith(step: PaymentFlowStep.terminal, result: result);
  }

  /// Back to the confirm step after an insufficient-funds/failed sheet is
  /// dismissed with "retry" — a full reset (attempts included) since it's a
  /// fresh attempt at the same request, not a PIN retry.
  void reset() {
    state = const PaymentFlowState();
  }
}
