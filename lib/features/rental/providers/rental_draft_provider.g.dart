// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_draft_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// L2→L4 booking-in-progress state — product.md L3/L4.

@ProviderFor(RentalDraft)
final rentalDraftProvider = RentalDraftProvider._();

/// L2→L4 booking-in-progress state — product.md L3/L4.
final class RentalDraftProvider
    extends $NotifierProvider<RentalDraft, RentalBookingDraft> {
  /// L2→L4 booking-in-progress state — product.md L3/L4.
  RentalDraftProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rentalDraftProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rentalDraftHash();

  @$internal
  @override
  RentalDraft create() => RentalDraft();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RentalBookingDraft value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RentalBookingDraft>(value),
    );
  }
}

String _$rentalDraftHash() => r'a5ba66086207d86e6cd898252338adb0b62b9d29';

/// L2→L4 booking-in-progress state — product.md L3/L4.

abstract class _$RentalDraft extends $Notifier<RentalBookingDraft> {
  RentalBookingDraft build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<RentalBookingDraft, RentalBookingDraft>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RentalBookingDraft, RentalBookingDraft>,
              RentalBookingDraft,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
