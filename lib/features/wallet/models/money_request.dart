import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/money.dart';

part 'money_request.freezed.dart';
part 'money_request.g.dart';

/// Who owes whom — product.md C4 "pending requests".
enum RequestDirection { incoming, outgoing }

/// Lifecycle of a [MoneyRequest] — product.md C4 "accept/decline (mock)".
enum RequestStatus { pending, accepted, declined }

/// A wallet-to-wallet money request — product.md C4.
@freezed
abstract class MoneyRequest with _$MoneyRequest {
  const factory MoneyRequest({
    required String id,
    required RequestDirection direction,
    required String counterpartyName,
    required String? counterpartyContactId,
    required Money amount,
    required String note,
    required RequestStatus status,
    required DateTime date,
  }) = _MoneyRequest;

  factory MoneyRequest.fromJson(Map<String, dynamic> json) =>
      _$MoneyRequestFromJson(json);
}
