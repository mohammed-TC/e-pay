import 'package:freezed_annotation/freezed_annotation.dart';

import 'money.dart';

part 'insurance_quote.freezed.dart';
part 'insurance_quote.g.dart';

/// One quote in the compare list — product.md G2.
@freezed
abstract class InsuranceQuote with _$InsuranceQuote {
  const factory InsuranceQuote({
    required String id,
    required String vehicleId,
    required String provider,
    required Money premium,
    required List<String> coverageDetails,
  }) = _InsuranceQuote;

  factory InsuranceQuote.fromJson(Map<String, dynamic> json) =>
      _$InsuranceQuoteFromJson(json);
}
