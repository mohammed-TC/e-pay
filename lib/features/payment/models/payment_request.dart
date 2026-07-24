import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/money.dart';
import '../../../core/models/txn_type.dart';

part 'payment_request.freezed.dart';

/// One line of the confirm-sheet breakdown — architecture.md §4.
@freezed
abstract class PaymentLineItem with _$PaymentLineItem {
  const factory PaymentLineItem({
    required String label,
    required Money amount,
  }) = _PaymentLineItem;
}

/// What any feature builds before pushing to the shared payment flow —
/// architecture.md §4. `context.push(Routes.paymentConfirm, extra: request)`.
@freezed
abstract class PaymentRequest with _$PaymentRequest {
  const factory PaymentRequest({
    required TxnType type,
    required String payeeName,
    required String payeeSubtitle,
    required List<PaymentLineItem> lineItems,
    required Money amount,
    required Money fee,
    @Default(<String, dynamic>{}) Map<String, dynamic> meta,
  }) = _PaymentRequest;
}
