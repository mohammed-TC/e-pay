import 'package:freezed_annotation/freezed_annotation.dart';

import 'money.dart';

part 'bill.freezed.dart';
part 'bill.g.dart';

/// One line of a bill breakdown — product.md E5.
@freezed
abstract class BillLineItem with _$BillLineItem {
  const factory BillLineItem({required String label, required Money amount}) =
      _BillLineItem;

  factory BillLineItem.fromJson(Map<String, dynamic> json) =>
      _$BillLineItemFromJson(json);
}

/// A fetched bill — product.md E5. Not seeded from JSON: `bills_repository`
/// generates a deterministic pseudo-random bill keyed by account number
/// (architecture.md §8).
@freezed
abstract class Bill with _$Bill {
  const factory Bill({
    required String billerAccountId,
    required Money amountDue,
    required DateTime dueDate,
    required List<BillLineItem> lineItems,
  }) = _Bill;

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);
}
