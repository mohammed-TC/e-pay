import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/txn.dart';
import '../../../core/models/txn_status.dart';
import '../../../core/models/txn_type.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_chip.dart';
import '../../../core/widgets/np_empty_state.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_list_tile.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_segmented_tabs.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../providers/history_filter_provider.dart';
import '../providers/transactions_provider.dart';

/// design.md icon per J1 filter category — presentational only.
const Map<HistoryTypeCategory, IconData> _categoryIcons = {
  HistoryTypeCategory.bills: Icons.receipt_long,
  HistoryTypeCategory.recharge: Icons.sim_card,
  HistoryTypeCategory.government: Icons.account_balance,
  HistoryTypeCategory.wallet: Icons.account_balance_wallet,
  HistoryTypeCategory.remittance: Icons.send,
};

IconData _iconForType(TxnType type) {
  for (final entry in historyTypeCategories.entries) {
    if (entry.value.contains(type)) return _categoryIcons[entry.key]!;
  }
  return Icons.receipt_long;
}

String _statusLabel(BuildContext context, TxnStatus status) {
  final l10n = context.l10n;
  return switch (status) {
    TxnStatus.success => l10n.historyStatusSuccess,
    TxnStatus.pending => l10n.historyStatusPending,
    TxnStatus.failed => l10n.historyStatusFailed,
  };
}

/// Screen J1 — Transaction History
class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txnsAsync = ref.watch(appTransactionsProvider);
    final grouped = ref.watch(groupedHistoryProvider);
    final filter = ref.watch(historyFilterProvider);
    final notifier = ref.read(historyFilterProvider.notifier);
    final l10n = context.l10n;

    return NPScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.lg),
          Text(
            l10n.historyTitle,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: AppSpacing.lg),
          _CategoryFilterRow(filter: filter, onChanged: notifier.setCategory),
          const SizedBox(height: AppSpacing.sm),
          _StatusFilterRow(filter: filter, onChanged: notifier.setStatus),
          const SizedBox(height: AppSpacing.lg),
          Expanded(
            child: _HistoryBody(
              txnsAsync: txnsAsync,
              grouped: grouped,
              onRetry: () =>
                  ref.read(appTransactionsProvider.notifier).refresh(),
            ),
          ),
        ],
      ),
    );
  }
}

/// J1 type-category segmented row — wired to [HistoryFilter.setCategory].
class _CategoryFilterRow extends StatelessWidget {
  const _CategoryFilterRow({required this.filter, required this.onChanged});

  final HistoryFilterState filter;
  final ValueChanged<HistoryTypeCategory?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final segments = <NPSegment>[
      (label: l10n.historyFilterAll, icon: Icons.apps),
      (
        label: l10n.historyFilterBills,
        icon: _categoryIcons[HistoryTypeCategory.bills],
      ),
      (
        label: l10n.historyFilterRecharge,
        icon: _categoryIcons[HistoryTypeCategory.recharge],
      ),
      (
        label: l10n.historyFilterGovernment,
        icon: _categoryIcons[HistoryTypeCategory.government],
      ),
      (
        label: l10n.historyFilterWallet,
        icon: _categoryIcons[HistoryTypeCategory.wallet],
      ),
      (
        label: l10n.historyFilterRemittance,
        icon: _categoryIcons[HistoryTypeCategory.remittance],
      ),
    ];

    return NPSegmentedTabs(
      segments: segments,
      selectedIndex: selectedHistoryCategoryIndex(filter),
      onChanged: (index) {
        onChanged(index == 0 ? null : HistoryTypeCategory.values[index - 1]);
      },
    );
  }
}

/// J1 status filter row — wired to [HistoryFilter.setStatus].
class _StatusFilterRow extends StatelessWidget {
  const _StatusFilterRow({required this.filter, required this.onChanged});

  final HistoryFilterState filter;
  final ValueChanged<TxnStatus?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        NPChip(
          label: l10n.historyStatusAll,
          selected: filter.status == null,
          onTap: () => onChanged(null),
        ),
        for (final status in TxnStatus.values)
          NPChip(
            label: _statusLabel(context, status),
            selected: filter.status == status,
            onTap: () => onChanged(status),
          ),
      ],
    );
  }
}

/// Shimmer / content / error / empty states for the J1 list —
/// architecture.md §9.
class _HistoryBody extends StatelessWidget {
  const _HistoryBody({
    required this.txnsAsync,
    required this.grouped,
    required this.onRetry,
  });

  final AsyncValue<List<Txn>> txnsAsync;
  final List<HistoryMonthGroup> grouped;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    if (txnsAsync.isLoading && !txnsAsync.hasValue) {
      return const _ShimmerList();
    }
    if (txnsAsync.hasError && !txnsAsync.hasValue) {
      return NPErrorState(
        title: l10n.historyErrorTitle,
        body: l10n.historyErrorBody,
        retryLabel: l10n.historyErrorRetry,
        onRetry: onRetry,
      );
    }
    if (grouped.isEmpty) {
      final hasAnyTransactions = txnsAsync.maybeWhen(
        data: (value) => value.isNotEmpty,
        orElse: () => false,
      );
      return NPEmptyState(
        title: hasAnyTransactions
            ? l10n.historyEmptyFilteredTitle
            : l10n.historyEmptyTitle,
        body: hasAnyTransactions
            ? l10n.historyEmptyFilteredBody
            : l10n.historyEmptyBody,
      );
    }
    return ListView.builder(
      itemCount: grouped.length,
      itemBuilder: (context, index) => _MonthSection(group: grouped[index]),
    );
  }
}

/// One month header + its transaction rows.
class _MonthSection extends StatelessWidget {
  const _MonthSection({required this.group});

  final HistoryMonthGroup group;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
            top: AppSpacing.lg,
            bottom: AppSpacing.sm,
          ),
          child: Text(
            DateFormat.yMMMM(locale).format(group.month),
            style: textTheme.labelLarge?.copyWith(
              color: colors.inkSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        for (final txn in group.items)
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.sm),
            child: NPListTile(
              leading: Icon(_iconForType(txn.type), color: colors.inkPrimary),
              title: txn.title,
              subtitle: txn.subtitle,
              trailingAmount: txn.amount,
              isPositive: false,
              onTap: () => context.push(Routes.transactionDetail, extra: txn),
            ),
          ),
      ],
    );
  }
}

/// List-skeleton shimmer shown while [appTransactionsProvider] loads.
class _ShimmerList extends StatelessWidget {
  const _ShimmerList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
      itemBuilder: (context, _) => const _ShimmerRow(),
    );
  }
}

class _ShimmerRow extends StatelessWidget {
  const _ShimmerRow();

  @override
  Widget build(BuildContext context) {
    return const NPCard(
      interactive: false,
      child: Row(
        children: [
          NPShimmer(width: 40, height: 40, borderRadius: 12),
          SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                NPShimmer.line(width: 140),
                SizedBox(height: AppSpacing.xs),
                NPShimmer.line(width: 90, height: 12),
              ],
            ),
          ),
          SizedBox(width: AppSpacing.md),
          NPShimmer.line(width: 56),
        ],
      ),
    );
  }
}
