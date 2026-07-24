import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_card.freezed.dart';
part 'saved_card.g.dart';

/// A saved payment card (masked) — product.md J4/C2.
@freezed
abstract class SavedCard with _$SavedCard {
  const factory SavedCard({
    required String id,
    required String maskedNumber,
    required String brand,
    required String expiry,
    required bool isDefault,
  }) = _SavedCard;

  factory SavedCard.fromJson(Map<String, dynamic> json) =>
      _$SavedCardFromJson(json);
}
