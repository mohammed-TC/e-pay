import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/money.dart';
import '../../../data/repositories/bills_repository.dart';
import '../models/recharge_plan.dart';

part 'recharge_provider.g.dart';

/// E6 Prepaid Recharge form state — transient screen state, mirrors
/// `TopUpState`. Picking a plan clears the custom amount and vice versa.
class RechargeState {
  const RechargeState({
    this.billerId,
    this.selectedPlanId,
    this.customAmountDigits = '',
  });

  final String? billerId;
  final String? selectedPlanId;
  final String customAmountDigits;

  bool get useCustomAmount => selectedPlanId == null;

  Money get customAmount => Money(
    minorUnits: customAmountDigits.isEmpty ? 0 : int.parse(customAmountDigits),
  );

  bool get isValid =>
      billerId != null && (selectedPlanId != null || customAmount.amount > 0);
}

/// Autodispose: fresh per push of [PrepaidRechargeScreen].
@Riverpod(keepAlive: false)
class RechargeForm extends _$RechargeForm {
  @override
  RechargeState build() => const RechargeState();

  void selectBiller(String id) => state = RechargeState(billerId: id);

  void selectPlan(String id) =>
      state = RechargeState(billerId: state.billerId, selectedPlanId: id);

  void setCustomAmountDigits(String digits) => state = RechargeState(
    billerId: state.billerId,
    customAmountDigits: digits,
  );
}

/// Recharge plans for the selected biller — product.md E6.
@riverpod
Future<List<RechargePlan>> rechargePlans(Ref ref, String billerId) =>
    ref.read(billsRepositoryProvider).fetchRechargePlans(billerId);
