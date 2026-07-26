import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/rental_repository.dart';
import '../models/rental_booking.dart';

part 'rental_bookings_provider.g.dart';

/// Saved bookings — product.md L5, newest first (repository already
/// prepends on save).
@Riverpod(keepAlive: true)
class RentalBookings extends _$RentalBookings {
  @override
  Future<List<RentalBooking>> build() =>
      ref.read(rentalRepositoryProvider).fetchBookings();

  Future<void> add(RentalBooking booking) async {
    await ref.read(rentalRepositoryProvider).saveBooking(booking);
    state = await AsyncValue.guard(
      () => ref.read(rentalRepositoryProvider).fetchBookings(),
    );
  }
}
