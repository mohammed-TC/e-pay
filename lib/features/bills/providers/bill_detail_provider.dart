import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/bill.dart';
import '../../../core/models/biller_account.dart';
import '../../../data/repositories/bills_repository.dart';

part 'bill_detail_provider.g.dart';

/// Fetches the current bill for a saved/new account — product.md E5.
/// Mirrors `merchant_lookup_provider.dart`'s family-provider shape.
@riverpod
Future<Bill> billDetail(Ref ref, BillerAccount account) =>
    ref.read(billsRepositoryProvider).fetchBill(account);
