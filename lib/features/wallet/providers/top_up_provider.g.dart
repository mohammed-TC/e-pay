// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_up_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Autodispose (no `keepAlive`): fresh per push of [WalletTopUpScreen], same
/// rationale as `PaymentFlowNotifier`.

@ProviderFor(TopUpForm)
final topUpFormProvider = TopUpFormProvider._();

/// Autodispose (no `keepAlive`): fresh per push of [WalletTopUpScreen], same
/// rationale as `PaymentFlowNotifier`.
final class TopUpFormProvider extends $NotifierProvider<TopUpForm, TopUpState> {
  /// Autodispose (no `keepAlive`): fresh per push of [WalletTopUpScreen], same
  /// rationale as `PaymentFlowNotifier`.
  TopUpFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topUpFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topUpFormHash();

  @$internal
  @override
  TopUpForm create() => TopUpForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TopUpState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TopUpState>(value),
    );
  }
}

String _$topUpFormHash() => r'e9caf720e90acc98a845c9624d44c7f929cfd826';

/// Autodispose (no `keepAlive`): fresh per push of [WalletTopUpScreen], same
/// rationale as `PaymentFlowNotifier`.

abstract class _$TopUpForm extends $Notifier<TopUpState> {
  TopUpState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TopUpState, TopUpState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TopUpState, TopUpState>,
              TopUpState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
