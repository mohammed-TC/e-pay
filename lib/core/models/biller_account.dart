import 'package:freezed_annotation/freezed_annotation.dart';

part 'biller_account.freezed.dart';
part 'biller_account.g.dart';

/// A saved biller account with nickname — product.md E3/E4.
@freezed
abstract class BillerAccount with _$BillerAccount {
  const factory BillerAccount({
    required String id,
    required String billerId,
    required String accountNumber,
    required String nickname,
    required DateTime savedAt,
    @Default(false) bool autoPayEnabled,
  }) = _BillerAccount;

  factory BillerAccount.fromJson(Map<String, dynamic> json) =>
      _$BillerAccountFromJson(json);
}
