// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_bookings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Saved bookings — product.md L5, newest first (repository already
/// prepends on save).

@ProviderFor(RentalBookings)
final rentalBookingsProvider = RentalBookingsProvider._();

/// Saved bookings — product.md L5, newest first (repository already
/// prepends on save).
final class RentalBookingsProvider
    extends $AsyncNotifierProvider<RentalBookings, List<RentalBooking>> {
  /// Saved bookings — product.md L5, newest first (repository already
  /// prepends on save).
  RentalBookingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rentalBookingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rentalBookingsHash();

  @$internal
  @override
  RentalBookings create() => RentalBookings();
}

String _$rentalBookingsHash() => r'71e5369c0bf58682def72d5563281e7b69c110a2';

/// Saved bookings — product.md L5, newest first (repository already
/// prepends on save).

abstract class _$RentalBookings extends $AsyncNotifier<List<RentalBooking>> {
  FutureOr<List<RentalBooking>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<RentalBooking>>, List<RentalBooking>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<RentalBooking>>, List<RentalBooking>>,
              AsyncValue<List<RentalBooking>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
