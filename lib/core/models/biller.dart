import 'package:freezed_annotation/freezed_annotation.dart';

import 'biller_category.dart';

part 'biller.freezed.dart';
part 'biller.g.dart';

/// A fictional utility/telecom provider — product.md E2. `brandColorHex`
/// stands in for a real logo asset in this prototype.
@freezed
abstract class Biller with _$Biller {
  const factory Biller({
    required String id,
    required String name,
    required BillerCategory category,
    required String brandColorHex,
  }) = _Biller;

  factory Biller.fromJson(Map<String, dynamic> json) => _$BillerFromJson(json);
}
