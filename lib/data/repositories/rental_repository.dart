import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/models/money.dart';
import '../../core/utils/mock_latency.dart';
import '../../features/rental/models/rental_addon.dart';
import '../../features/rental/models/rental_booking.dart';
import '../../features/rental/models/rental_location.dart';
import '../../features/rental/models/rental_vehicle_class.dart';

part 'rental_repository.g.dart';

/// Car rental catalog + bookings — product.md Module L, seeded from
/// `assets/mock/rental_locations.json` / `rental_vehicle_classes.json` /
/// `rental_addons.json`. [_bookings] starts empty: L5 My Rentals has no
/// seed data, only what L4 saves in-session (mirrors `BillsRepository`'s
/// "session feels live" mutation pattern).
class RentalRepository {
  List<RentalLocation>? _locations;
  List<RentalVehicleClass>? _vehicleClasses;
  List<RentalAddon>? _addons;
  List<RentalBooking> _bookings = [];

  Future<List<RentalLocation>> fetchLocations() async {
    await simulateLatency();
    final cached = _locations;
    if (cached != null) return cached;
    final raw = await rootBundle.loadString(
      'assets/mock/rental_locations.json',
    );
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => RentalLocation.fromJson(e as Map<String, dynamic>))
        .toList();
    _locations = list;
    return list;
  }

  Future<List<RentalVehicleClass>> fetchVehicleClasses() async {
    await simulateLatency();
    final cached = _vehicleClasses;
    if (cached != null) return cached;
    final raw = await rootBundle.loadString(
      'assets/mock/rental_vehicle_classes.json',
    );
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => RentalVehicleClass.fromJson(e as Map<String, dynamic>))
        .toList();
    _vehicleClasses = list;
    return list;
  }

  Future<List<RentalAddon>> fetchAddons() async {
    await simulateLatency();
    final cached = _addons;
    if (cached != null) return cached;
    final raw = await rootBundle.loadString('assets/mock/rental_addons.json');
    final list = (jsonDecode(raw) as List<dynamic>)
        .map((e) => RentalAddon.fromJson(e as Map<String, dynamic>))
        .toList();
    _addons = list;
    return list;
  }

  Future<List<RentalBooking>> fetchBookings() async {
    await simulateLatency();
    return _bookings;
  }

  Future<void> saveBooking(RentalBooking booking) async {
    _bookings = [booking, ..._bookings];
  }

  /// Trip length in whole days, inclusive of the pickup day — a same-day
  /// return still bills 1 day.
  static int calculateDays(DateTime pickup, DateTime returnDate) {
    final hours = returnDate.difference(pickup).inHours;
    final days = (hours / 24).ceil();
    return days < 1 ? 1 : days;
  }

  static Money classTotal(RentalVehicleClass vehicleClass, int days) =>
      Money.fromAmount(vehicleClass.perDay.amount * days);

  static Money addonTotal(RentalAddon addon, int days) =>
      addon.pricingBasis == AddonPricingBasis.perDay
      ? Money.fromAmount(addon.price.amount * days)
      : addon.price;

  /// 100 reward points = OMR 1 (product.md L "Rules"). Capped at [subtotal]
  /// so redemption never pushes the total negative.
  static Money pointsToDiscount(int pointsAvailable, Money subtotal) {
    final full = Money.fromAmount(pointsAvailable * 0.01);
    return full < subtotal ? full : subtotal;
  }

  static int discountToPoints(Money discount) =>
      (discount.amount * 100).round();
}

@Riverpod(keepAlive: true)
RentalRepository rentalRepository(Ref ref) => RentalRepository();
