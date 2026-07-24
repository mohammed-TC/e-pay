import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/money.dart';

part 'top_up_provider.g.dart';

/// C2 Top-up form state — transient screen state, not a domain entity, so a
/// plain immutable class rather than `@freezed` (mirrors
/// `history_filter_provider.dart`'s `HistoryFilterState`).
class TopUpState {
  const TopUpState({this.amountDigits = '', this.selectedSourceId});

  /// Raw digits typed so far — see `NPAmountInput.value` doc for the format.
  final String amountDigits;

  /// A saved card id, or the `'apple_pay'` sentinel — null means unselected.
  final String? selectedSourceId;

  Money get amount => Money(
    minorUnits: amountDigits.isEmpty ? 0 : int.parse(amountDigits),
  );

  bool get isValid => amount.amount > 0 && selectedSourceId != null;

  TopUpState copyWith({String? amountDigits, String? selectedSourceId}) {
    return TopUpState(
      amountDigits: amountDigits ?? this.amountDigits,
      selectedSourceId: selectedSourceId ?? this.selectedSourceId,
    );
  }
}

/// Autodispose (no `keepAlive`): fresh per push of [WalletTopUpScreen], same
/// rationale as `PaymentFlowNotifier`.
@Riverpod(keepAlive: false)
class TopUpForm extends _$TopUpForm {
  @override
  TopUpState build() => const TopUpState();

  void setAmountDigits(String digits) =>
      state = state.copyWith(amountDigits: digits);

  void setQuickAmount(double amount) =>
      state = state.copyWith(amountDigits: (amount * 1000).round().toString());

  void selectSource(String id) => state = state.copyWith(selectedSourceId: id);
}
