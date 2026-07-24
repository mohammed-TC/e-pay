import 'package:freezed_annotation/freezed_annotation.dart';

import 'money.dart';
import 'saved_card.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

/// Single source of truth for wallet money — architecture.md §3.
@freezed
abstract class Wallet with _$Wallet {
  const factory Wallet({
    required Money balance,
    required List<SavedCard> savedCards,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}
