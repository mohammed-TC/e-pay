import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'money.freezed.dart';
part 'money.g.dart';

/// Amount + currency value object — product.md §5.5. Always 3 decimal places.
/// Stores [minorUnits] (amount × 1000) as an int to avoid floating-point
/// rounding errors in wallet/ledger math.
@freezed
abstract class Money with _$Money {
  const Money._();

  const factory Money({required int minorUnits, @Default('OMR') String currencyCode}) = _Money;

  factory Money.fromJson(Map<String, dynamic> json) => _$MoneyFromJson(json);

  factory Money.fromAmount(num amount, {String currencyCode = 'OMR'}) =>
      Money(minorUnits: (amount * 1000).round(), currencyCode: currencyCode);

  static const zero = Money(minorUnits: 0);

  double get amount => minorUnits / 1000;

  Money operator +(Money other) {
    assert(currencyCode == other.currencyCode, 'Cannot add $currencyCode to ${other.currencyCode}');
    return copyWith(minorUnits: minorUnits + other.minorUnits);
  }

  Money operator -(Money other) {
    assert(currencyCode == other.currencyCode, 'Cannot subtract $currencyCode from ${other.currencyCode}');
    return copyWith(minorUnits: minorUnits - other.minorUnits);
  }

  bool operator <(Money other) => minorUnits < other.minorUnits;

  bool operator <=(Money other) => minorUnits <= other.minorUnits;

  bool operator >(Money other) => minorUnits > other.minorUnits;

  bool operator >=(Money other) => minorUnits >= other.minorUnits;

  bool get isNegative => minorUnits < 0;

  /// Locale-aware "250.000 OMR" / "٢٥٠٫٠٠٠ OMR" — architecture.md §7.5.
  String format(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    final formatter = NumberFormat.decimalPatternDigits(locale: locale, decimalDigits: 3);
    return '${formatter.format(amount)} $currencyCode';
  }
}
