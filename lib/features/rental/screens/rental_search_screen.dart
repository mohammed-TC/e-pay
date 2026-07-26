import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_chip.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_list_tile.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../models/rental_location.dart';
import '../providers/rental_catalog_provider.dart';
import '../providers/rental_search_provider.dart';

/// Screen L1 — Rental Search
///
/// Pickup location + pickup/return date (with morning/evening
/// time-of-day) — product.md Module L. Feeds [rentalSearchProvider], which
/// L2 prices vehicle classes against.
class RentalSearchScreen extends ConsumerWidget {
  const RentalSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final params = ref.watch(rentalSearchProvider);
    final notifier = ref.read(rentalSearchProvider.notifier);
    final locationsAsync = ref.watch(rentalLocationsProvider);

    return NPScaffold(
      appBar: AppBar(
        title: Text(l10n.rentalSearchTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: l10n.rentalMyRentalsTitle,
            onPressed: () => context.push(Routes.myRentals),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: AppSpacing.lg),
          _LocationTile(
            locationsAsync: locationsAsync,
            selectedId: params.locationId,
            onSelect: notifier.setLocation,
          ),
          const SizedBox(height: AppSpacing.lg),
          _DateTile(
            label: l10n.rentalSearchPickupLabel,
            date: params.pickupDate,
            firstDate: DateTime.now(),
            onDateChanged: notifier.setPickupDate,
          ),
          const SizedBox(height: AppSpacing.lg),
          _DateTile(
            label: l10n.rentalSearchReturnLabel,
            date: params.returnDate,
            firstDate: params.pickupDate ?? DateTime.now(),
            onDateChanged: notifier.setReturnDate,
          ),
          const SizedBox(height: AppSpacing.xxl),
          NPButton(
            label: l10n.rentalSearchCta,
            onPressed: params.isComplete
                ? () => context.push(Routes.rentalResults)
                : null,
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}

class _LocationTile extends StatelessWidget {
  const _LocationTile({
    required this.locationsAsync,
    required this.selectedId,
    required this.onSelect,
  });

  final AsyncValue<List<RentalLocation>> locationsAsync;
  final String? selectedId;
  final ValueChanged<String> onSelect;

  Future<void> _openPicker(
    BuildContext context,
    List<RentalLocation> locations,
  ) {
    final l10n = context.l10n;
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.rentalSearchLocationLabel,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpacing.md),
                for (final location in locations)
                  NPListTile(
                    title: location.name,
                    subtitle: location.subtitle,
                    leading: Icon(
                      location.isAirport
                          ? Icons.local_airport_outlined
                          : Icons.store_outlined,
                    ),
                    onTap: () {
                      onSelect(location.id);
                      Navigator.of(sheetContext).pop();
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).extension<AppColors>()!;

    return locationsAsync.when(
      data: (locations) {
        final selected = locations
            .where((location) => location.id == selectedId)
            .firstOrNull;
        return NPCard(
          onTap: () => _openPicker(context, locations),
          child: Row(
            children: [
              Icon(Icons.location_on_outlined, color: colors.accentPrimary),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l10n.rentalSearchLocationLabel,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.inkTertiary,
                      ),
                    ),
                    Text(
                      selected?.name ?? l10n.rentalSearchLocationPlaceholder,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: colors.inkTertiary),
            ],
          ),
        );
      },
      loading: () => const NPShimmer.card(height: 72),
      error: (error, stackTrace) => NPErrorState(
        title: l10n.homeErrorTitle,
        body: l10n.homeErrorBody,
        onRetry: () {},
        retryLabel: l10n.homeErrorRetry,
      ),
    );
  }
}

class _DateTile extends StatelessWidget {
  const _DateTile({
    required this.label,
    required this.date,
    required this.firstDate,
    required this.onDateChanged,
  });

  final String label;
  final DateTime? date;
  final DateTime firstDate;
  final ValueChanged<DateTime> onDateChanged;

  static const _morningHour = 9;
  static const _eveningHour = 17;

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: date ?? firstDate,
      firstDate: firstDate,
      lastDate: firstDate.add(const Duration(days: 365)),
    );
    if (picked == null) return;
    final hour = date?.hour ?? _morningHour;
    onDateChanged(DateTime(picked.year, picked.month, picked.day, hour));
  }

  void _setTimeOfDay(int hour) {
    final base = date ?? firstDate;
    onDateChanged(DateTime(base.year, base.month, base.day, hour));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).extension<AppColors>()!;
    final locale = Localizations.localeOf(context).toString();
    final dateLabel = date == null
        ? l10n.rentalSearchDatePlaceholder
        : DateFormat.yMMMd(locale).format(date!);
    final isMorning = (date?.hour ?? _morningHour) < 12;

    return NPCard(
      interactive: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _pickDate(context),
            splashFactory: NoSplash.splashFactory,
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: colors.accentPrimary,
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        label,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colors.inkTertiary,
                        ),
                      ),
                      Text(
                        dateLabel,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: colors.inkTertiary),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              NPChip(
                label: l10n.rentalSearchTimeMorning,
                selected: isMorning,
                onTap: date == null ? null : () => _setTimeOfDay(_morningHour),
              ),
              const SizedBox(width: AppSpacing.sm),
              NPChip(
                label: l10n.rentalSearchTimeEvening,
                selected: !isMorning,
                onTap: date == null ? null : () => _setTimeOfDay(_eveningHour),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
