import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rental_search_provider.g.dart';

/// L1 search selections — plain immutable state (mirrors
/// `HistoryFilterState`'s "transient screen state, not a domain entity"
/// rationale, not `@freezed`).
class RentalSearchParams {
  const RentalSearchParams({this.locationId, this.pickupDate, this.returnDate});

  final String? locationId;
  final DateTime? pickupDate;
  final DateTime? returnDate;

  bool get isComplete =>
      locationId != null &&
      pickupDate != null &&
      returnDate != null &&
      returnDate!.isAfter(pickupDate!);

  RentalSearchParams copyWith({
    String? locationId,
    DateTime? pickupDate,
    DateTime? returnDate,
  }) {
    return RentalSearchParams(
      locationId: locationId ?? this.locationId,
      pickupDate: pickupDate ?? this.pickupDate,
      returnDate: returnDate ?? this.returnDate,
    );
  }
}

/// L1 Rental Search state — product.md L1.
@Riverpod(keepAlive: true)
class RentalSearch extends _$RentalSearch {
  @override
  RentalSearchParams build() => const RentalSearchParams();

  void setLocation(String locationId) =>
      state = state.copyWith(locationId: locationId);

  void setPickupDate(DateTime date) => state = state.copyWith(pickupDate: date);

  void setReturnDate(DateTime date) => state = state.copyWith(returnDate: date);

  void reset() => state = const RentalSearchParams();
}
