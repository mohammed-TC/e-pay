// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_money_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Autodispose (no `keepAlive`): fresh per push of [SendMoneyScreen], same
/// rationale as `PaymentFlowNotifier`.

@ProviderFor(SendMoneyForm)
final sendMoneyFormProvider = SendMoneyFormProvider._();

/// Autodispose (no `keepAlive`): fresh per push of [SendMoneyScreen], same
/// rationale as `PaymentFlowNotifier`.
final class SendMoneyFormProvider
    extends $NotifierProvider<SendMoneyForm, SendMoneyState> {
  /// Autodispose (no `keepAlive`): fresh per push of [SendMoneyScreen], same
  /// rationale as `PaymentFlowNotifier`.
  SendMoneyFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendMoneyFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendMoneyFormHash();

  @$internal
  @override
  SendMoneyForm create() => SendMoneyForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SendMoneyState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SendMoneyState>(value),
    );
  }
}

String _$sendMoneyFormHash() => r'2c00b9cdec51fd5020a7afd3dfb0c3e638e1c2ef';

/// Autodispose (no `keepAlive`): fresh per push of [SendMoneyScreen], same
/// rationale as `PaymentFlowNotifier`.

abstract class _$SendMoneyForm extends $Notifier<SendMoneyState> {
  SendMoneyState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SendMoneyState, SendMoneyState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SendMoneyState, SendMoneyState>,
              SendMoneyState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
