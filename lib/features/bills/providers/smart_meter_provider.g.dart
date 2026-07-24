// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_meter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Autodispose: fresh per push of [SmartMeterScreen].

@ProviderFor(SmartMeterForm)
final smartMeterFormProvider = SmartMeterFormProvider._();

/// Autodispose: fresh per push of [SmartMeterScreen].
final class SmartMeterFormProvider
    extends $NotifierProvider<SmartMeterForm, SmartMeterState> {
  /// Autodispose: fresh per push of [SmartMeterScreen].
  SmartMeterFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'smartMeterFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$smartMeterFormHash();

  @$internal
  @override
  SmartMeterForm create() => SmartMeterForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SmartMeterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SmartMeterState>(value),
    );
  }
}

String _$smartMeterFormHash() => r'2f99eda98f0348089210a129f6f26fca6a8159f8';

/// Autodispose: fresh per push of [SmartMeterScreen].

abstract class _$SmartMeterForm extends $Notifier<SmartMeterState> {
  SmartMeterState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SmartMeterState, SmartMeterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SmartMeterState, SmartMeterState>,
              SmartMeterState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
