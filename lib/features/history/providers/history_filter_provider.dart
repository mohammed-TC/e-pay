import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/txn.dart';
import '../../../core/models/txn_status.dart';
import '../../../core/models/txn_type.dart';
import 'transactions_provider.dart';

part 'history_filter_provider.g.dart';

/// One month-bucket of filtered transactions — the J1 list render unit.
typedef HistoryMonthGroup = ({DateTime month, List<Txn> items});

/// J1 filter categories — groups the 14 [TxnType] values into a small,
/// demo-realistic filter row (product.md J1 doesn't require 1:1 filtering
/// against every enum value).
enum HistoryTypeCategory { bills, recharge, government, wallet, remittance }

/// Which [TxnType]s each [HistoryTypeCategory] covers. `bills` folds in
/// insurance/education (recurring "bill-like" payments); `wallet` folds in
/// `qrPay` (a wallet-adjacent pay flow) alongside top-up/send/request.
const Map<HistoryTypeCategory, Set<TxnType>> historyTypeCategories = {
  HistoryTypeCategory.bills: {
    TxnType.bill,
    TxnType.insurance,
    TxnType.education,
  },
  HistoryTypeCategory.recharge: {
    TxnType.prepaidRecharge,
    TxnType.smartMeterRecharge,
  },
  HistoryTypeCategory.government: {
    TxnType.trafficFine,
    TxnType.vehicleRenewal,
    TxnType.judiciary,
    TxnType.socialProtection,
  },
  HistoryTypeCategory.wallet: {
    TxnType.walletTopup,
    TxnType.walletSend,
    TxnType.walletRequest,
    TxnType.qrPay,
  },
  HistoryTypeCategory.remittance: {TxnType.remittance},
};

/// Selected-segment index (0 = "All", 1..n = [HistoryTypeCategory.values])
/// for [HistoryFilterState.types] — presentational reverse-mapping shared
/// here so the screen never has to reimplement the category/type rule.
int selectedHistoryCategoryIndex(HistoryFilterState filter) {
  final types = filter.types;
  if (types == null || types.isEmpty) return 0;
  for (final entry in historyTypeCategories.entries) {
    if (types.length == entry.value.length && types.containsAll(entry.value)) {
      return HistoryTypeCategory.values.indexOf(entry.key) + 1;
    }
  }
  return 0;
}

/// Filter selections for Screen J1 — product.md J1. A plain immutable value
/// type rather than `@freezed`: this is transient screen-filter state, not a
/// domain entity, so it doesn't warrant model codegen.
class HistoryFilterState {
  const HistoryFilterState({this.types, this.status});

  /// Selected transaction types; `null`/empty means "all types". A [Set]
  /// (rather than a single type) because the J1 filter row selects a whole
  /// [HistoryTypeCategory] at a time. [HistoryFilter.setType] is kept for
  /// callers that want to filter to one exact [TxnType].
  final Set<TxnType>? types;

  /// `null` means "all statuses".
  final TxnStatus? status;

  HistoryFilterState copyWith({
    Set<TxnType>? types,
    bool clearTypes = false,
    TxnStatus? status,
    bool clearStatus = false,
  }) {
    return HistoryFilterState(
      types: clearTypes ? null : (types ?? this.types),
      status: clearStatus ? null : (status ?? this.status),
    );
  }
}

/// Filter state for Screen J1 — mirrors `AppAuthState`'s Notifier style
/// (`onboarding/providers/auth_state_provider.dart`).
@Riverpod(keepAlive: true)
class HistoryFilter extends _$HistoryFilter {
  @override
  HistoryFilterState build() => const HistoryFilterState();

  /// Filters to a single exact [TxnType], or clears the type filter when
  /// [type] is null. Provided for API symmetry with [setStatus]; the J1
  /// screen itself drives filtering through [setCategory].
  void setType(TxnType? type) {
    state = state.copyWith(
      types: type == null ? null : {type},
      clearTypes: type == null,
    );
  }

  /// Filters to every [TxnType] in [category] ("All" when null).
  void setCategory(HistoryTypeCategory? category) {
    state = state.copyWith(
      types: category == null ? null : historyTypeCategories[category],
      clearTypes: category == null,
    );
  }

  void setStatus(TxnStatus? status) {
    state = state.copyWith(status: status, clearStatus: status == null);
  }

  void clear() => state = const HistoryFilterState();
}

/// Filtered + month-grouped transactions for J1 — filtering/grouping logic
/// lives here per flutter-conventions.md ("no business logic in widgets").
/// Newest month first; transactions within a month stay in the newest-first
/// order `AppTransactions` already provides.
@riverpod
List<HistoryMonthGroup> groupedHistory(Ref ref) {
  final filter = ref.watch(historyFilterProvider);
  final txns = ref
      .watch(appTransactionsProvider)
      .maybeWhen(data: (value) => value, orElse: () => const <Txn>[]);

  final filtered = txns.where((txn) {
    final types = filter.types;
    if (types != null && types.isNotEmpty && !types.contains(txn.type)) {
      return false;
    }
    if (filter.status != null && txn.status != filter.status) return false;
    return true;
  });

  final groups = <DateTime, List<Txn>>{};
  for (final txn in filtered) {
    final key = DateTime(txn.date.year, txn.date.month);
    groups.putIfAbsent(key, () => <Txn>[]).add(txn);
  }

  final sortedMonths = groups.keys.toList()..sort((a, b) => b.compareTo(a));
  return [
    for (final month in sortedMonths) (month: month, items: groups[month]!),
  ];
}
