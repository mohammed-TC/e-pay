import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/money.dart';

part 'merchant.freezed.dart';
part 'merchant.g.dart';

/// A mock QR merchant — product.md C5 "merchant confirm sheet".
@freezed
abstract class Merchant with _$Merchant {
  const factory Merchant({
    required String id,
    required String name,
    required String category,
    required String qrCode,
    Money? fixedAmount,
  }) = _Merchant;

  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);
}
