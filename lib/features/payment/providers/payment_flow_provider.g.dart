// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_flow_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Per-flow-instance state machine for the shared payment flow —
/// architecture.md §4. Autodispose (no `keepAlive`): `PaymentConfirmScreen`
/// is pushed fresh per payment, so a fresh push naturally gets fresh state —
/// no manual reset-on-mount needed.

@ProviderFor(PaymentFlowNotifier)
final paymentFlowProvider = PaymentFlowNotifierProvider._();

/// Per-flow-instance state machine for the shared payment flow —
/// architecture.md §4. Autodispose (no `keepAlive`): `PaymentConfirmScreen`
/// is pushed fresh per payment, so a fresh push naturally gets fresh state —
/// no manual reset-on-mount needed.
final class PaymentFlowNotifierProvider
    extends $NotifierProvider<PaymentFlowNotifier, PaymentFlowState> {
  /// Per-flow-instance state machine for the shared payment flow —
  /// architecture.md §4. Autodispose (no `keepAlive`): `PaymentConfirmScreen`
  /// is pushed fresh per payment, so a fresh push naturally gets fresh state —
  /// no manual reset-on-mount needed.
  PaymentFlowNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentFlowProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentFlowNotifierHash();

  @$internal
  @override
  PaymentFlowNotifier create() => PaymentFlowNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentFlowState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentFlowState>(value),
    );
  }
}

String _$paymentFlowNotifierHash() =>
    r'2ff8a4ba99c93703e41040f6e614f6b4728009c4';

/// Per-flow-instance state machine for the shared payment flow —
/// architecture.md §4. Autodispose (no `keepAlive`): `PaymentConfirmScreen`
/// is pushed fresh per payment, so a fresh push naturally gets fresh state —
/// no manual reset-on-mount needed.

abstract class _$PaymentFlowNotifier extends $Notifier<PaymentFlowState> {
  PaymentFlowState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PaymentFlowState, PaymentFlowState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PaymentFlowState, PaymentFlowState>,
              PaymentFlowState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
