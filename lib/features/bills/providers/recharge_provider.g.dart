// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recharge_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Autodispose: fresh per push of [PrepaidRechargeScreen].

@ProviderFor(RechargeForm)
final rechargeFormProvider = RechargeFormProvider._();

/// Autodispose: fresh per push of [PrepaidRechargeScreen].
final class RechargeFormProvider
    extends $NotifierProvider<RechargeForm, RechargeState> {
  /// Autodispose: fresh per push of [PrepaidRechargeScreen].
  RechargeFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rechargeFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rechargeFormHash();

  @$internal
  @override
  RechargeForm create() => RechargeForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RechargeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RechargeState>(value),
    );
  }
}

String _$rechargeFormHash() => r'da9e2c169e4f453770879daeb821a50a8c36e08a';

/// Autodispose: fresh per push of [PrepaidRechargeScreen].

abstract class _$RechargeForm extends $Notifier<RechargeState> {
  RechargeState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<RechargeState, RechargeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RechargeState, RechargeState>,
              RechargeState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Recharge plans for the selected biller — product.md E6.

@ProviderFor(rechargePlans)
final rechargePlansProvider = RechargePlansFamily._();

/// Recharge plans for the selected biller — product.md E6.

final class RechargePlansProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RechargePlan>>,
          List<RechargePlan>,
          FutureOr<List<RechargePlan>>
        >
    with
        $FutureModifier<List<RechargePlan>>,
        $FutureProvider<List<RechargePlan>> {
  /// Recharge plans for the selected biller — product.md E6.
  RechargePlansProvider._({
    required RechargePlansFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'rechargePlansProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$rechargePlansHash();

  @override
  String toString() {
    return r'rechargePlansProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<RechargePlan>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RechargePlan>> create(Ref ref) {
    final argument = this.argument as String;
    return rechargePlans(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RechargePlansProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$rechargePlansHash() => r'a6774810398815eda077e82c4ab3df76e24c2002';

/// Recharge plans for the selected biller — product.md E6.

final class RechargePlansFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<RechargePlan>>, String> {
  RechargePlansFamily._()
    : super(
        retry: null,
        name: r'rechargePlansProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Recharge plans for the selected biller — product.md E6.

  RechargePlansProvider call(String billerId) =>
      RechargePlansProvider._(argument: billerId, from: this);

  @override
  String toString() => r'rechargePlansProvider';
}
