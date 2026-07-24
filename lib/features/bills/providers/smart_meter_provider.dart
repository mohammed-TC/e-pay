import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/bill.dart';
import '../../../data/repositories/bills_repository.dart';

part 'smart_meter_provider.g.dart';

/// E7 Smart Meter form state — meter number entry then an on-demand fetch
/// of the mock charge (no saved-account concept for meters).
class SmartMeterState {
  const SmartMeterState({this.meterNumber = '', this.bill});

  final String meterNumber;
  final Bill? bill;

  bool get isValid => meterNumber.isNotEmpty;
}

/// Autodispose: fresh per push of [SmartMeterScreen].
@Riverpod(keepAlive: false)
class SmartMeterForm extends _$SmartMeterForm {
  @override
  SmartMeterState build() => const SmartMeterState();

  void setMeterNumber(String value) => state = SmartMeterState(
    meterNumber: value,
    bill: value == state.meterNumber ? state.bill : null,
  );

  Future<void> fetchCharge() async {
    final bill = await ref
        .read(billsRepositoryProvider)
        .fetchMeterCharge(state.meterNumber);
    state = SmartMeterState(meterNumber: state.meterNumber, bill: bill);
  }
}
