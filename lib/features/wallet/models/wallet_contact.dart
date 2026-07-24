import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_contact.freezed.dart';
part 'wallet_contact.g.dart';

/// A mock contact for Send/Request Money — product.md C3/C4.
@freezed
abstract class WalletContact with _$WalletContact {
  const factory WalletContact({
    required String id,
    required String name,
    required String mobileNumber,
    required String walletId,
    required String avatarInitial,
  }) = _WalletContact;

  factory WalletContact.fromJson(Map<String, dynamic> json) =>
      _$WalletContactFromJson(json);
}
