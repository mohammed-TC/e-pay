// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Filter state for Screen J1 — mirrors `AppAuthState`'s Notifier style
/// (`onboarding/providers/auth_state_provider.dart`).

@ProviderFor(HistoryFilter)
final historyFilterProvider = HistoryFilterProvider._();

/// Filter state for Screen J1 — mirrors `AppAuthState`'s Notifier style
/// (`onboarding/providers/auth_state_provider.dart`).
final class HistoryFilterProvider
    extends $NotifierProvider<HistoryFilter, HistoryFilterState> {
  /// Filter state for Screen J1 — mirrors `AppAuthState`'s Notifier style
  /// (`onboarding/providers/auth_state_provider.dart`).
  HistoryFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyFilterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyFilterHash();

  @$internal
  @override
  HistoryFilter create() => HistoryFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HistoryFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HistoryFilterState>(value),
    );
  }
}

String _$historyFilterHash() => r'583d0b0a71d4044d156ca6235d40f8daa2ed0526';

/// Filter state for Screen J1 — mirrors `AppAuthState`'s Notifier style
/// (`onboarding/providers/auth_state_provider.dart`).

abstract class _$HistoryFilter extends $Notifier<HistoryFilterState> {
  HistoryFilterState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<HistoryFilterState, HistoryFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HistoryFilterState, HistoryFilterState>,
              HistoryFilterState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Filtered + month-grouped transactions for J1 — filtering/grouping logic
/// lives here per flutter-conventions.md ("no business logic in widgets").
/// Newest month first; transactions within a month stay in the newest-first
/// order `AppTransactions` already provides.

@ProviderFor(groupedHistory)
final groupedHistoryProvider = GroupedHistoryProvider._();

/// Filtered + month-grouped transactions for J1 — filtering/grouping logic
/// lives here per flutter-conventions.md ("no business logic in widgets").
/// Newest month first; transactions within a month stay in the newest-first
/// order `AppTransactions` already provides.

final class GroupedHistoryProvider
    extends
        $FunctionalProvider<
          List<HistoryMonthGroup>,
          List<HistoryMonthGroup>,
          List<HistoryMonthGroup>
        >
    with $Provider<List<HistoryMonthGroup>> {
  /// Filtered + month-grouped transactions for J1 — filtering/grouping logic
  /// lives here per flutter-conventions.md ("no business logic in widgets").
  /// Newest month first; transactions within a month stay in the newest-first
  /// order `AppTransactions` already provides.
  GroupedHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupedHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupedHistoryHash();

  @$internal
  @override
  $ProviderElement<List<HistoryMonthGroup>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<HistoryMonthGroup> create(Ref ref) {
    return groupedHistory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<HistoryMonthGroup> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<HistoryMonthGroup>>(value),
    );
  }
}

String _$groupedHistoryHash() => r'b7f4eac7eb09bf6ab68900c8ddb9828e404ef2ff';
