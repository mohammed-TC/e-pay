import 'package:freezed_annotation/freezed_annotation.dart';

import 'money.dart';
import 'txn_status.dart';
import 'txn_type.dart';

part 'txn.freezed.dart';
part 'txn.g.dart';

/// A single ledger entry — product.md §5/J1/J2. Appended only by
/// `PaymentService` (architecture.md §3 invariant).
@freezed
abstract class Txn with _$Txn {
  const factory Txn({
    required String id,
    required TxnType type,
    required String title,
    required String subtitle,
    required Money amount,
    required Money fee,
    required TxnStatus status,
    required DateTime date,
    required String referenceNo,
    required int rewardPointsEarned,
    @Default(<String, dynamic>{}) Map<String, dynamic> meta,
  }) = _Txn;

  factory Txn.fromJson(Map<String, dynamic> json) => _$TxnFromJson(json);
}
