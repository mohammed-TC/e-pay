import 'package:freezed_annotation/freezed_annotation.dart';

part 'beneficiary.freezed.dart';
part 'beneficiary.g.dart';

/// A saved remittance beneficiary — product.md D2/D3.
@freezed
abstract class Beneficiary with _$Beneficiary {
  const factory Beneficiary({
    required String id,
    required String name,
    required String bankName,
    required String accountNumber,
    required String countryCode,
    required String relationship,
    required String purpose,
  }) = _Beneficiary;

  factory Beneficiary.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryFromJson(json);
}
