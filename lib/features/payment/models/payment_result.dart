import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/txn.dart';

part 'payment_result.freezed.dart';

/// Outcome of the shared payment flow — architecture.md §4. Returned to the
/// origin screen so it can update local UI state after the flow completes.
@freezed
sealed class PaymentResult with _$PaymentResult {
  const factory PaymentResult.success({required Txn txn}) = PaymentSuccess;

  const factory PaymentResult.insufficientFunds() = PaymentInsufficientFunds;

  const factory PaymentResult.failed({required String reason}) = PaymentFailed;
}
