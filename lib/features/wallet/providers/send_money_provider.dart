import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/money.dart';
import '../models/wallet_contact.dart';

part 'send_money_provider.g.dart';

/// C3 Send Money's three tabs — product.md "To Mobile / To Wallet / To
/// Bank".
enum SendMoneyMethod { mobile, wallet, bank }

/// C3 Send Money form state — transient screen state (see
/// `top_up_provider.dart`'s `TopUpState` doc for why this isn't `@freezed`).
class SendMoneyState {
  const SendMoneyState({
    this.method = SendMoneyMethod.mobile,
    this.selectedContact,
    this.bankAccountName = '',
    this.bankIban = '',
    this.amountDigits = '',
    this.note = '',
  });

  final SendMoneyMethod method;
  final WalletContact? selectedContact;
  final String bankAccountName;
  final String bankIban;
  final String amountDigits;
  final String note;

  Money get amount => Money(
    minorUnits: amountDigits.isEmpty ? 0 : int.parse(amountDigits),
  );

  bool get isValid {
    if (amount.amount <= 0) return false;
    if (method == SendMoneyMethod.bank) {
      return bankAccountName.isNotEmpty && bankIban.isNotEmpty;
    }
    return selectedContact != null;
  }

  SendMoneyState copyWith({
    SendMoneyMethod? method,
    WalletContact? selectedContact,
    String? bankAccountName,
    String? bankIban,
    String? amountDigits,
    String? note,
  }) {
    return SendMoneyState(
      method: method ?? this.method,
      selectedContact: selectedContact ?? this.selectedContact,
      bankAccountName: bankAccountName ?? this.bankAccountName,
      bankIban: bankIban ?? this.bankIban,
      amountDigits: amountDigits ?? this.amountDigits,
      note: note ?? this.note,
    );
  }
}

/// Autodispose (no `keepAlive`): fresh per push of [SendMoneyScreen], same
/// rationale as `PaymentFlowNotifier`.
@Riverpod(keepAlive: false)
class SendMoneyForm extends _$SendMoneyForm {
  @override
  SendMoneyState build() => const SendMoneyState();

  void selectMethod(SendMoneyMethod method) =>
      state = state.copyWith(method: method);

  void selectContact(WalletContact contact) =>
      state = state.copyWith(selectedContact: contact);

  void setBankAccountName(String value) =>
      state = state.copyWith(bankAccountName: value);

  void setBankIban(String value) => state = state.copyWith(bankIban: value);

  void setAmountDigits(String digits) =>
      state = state.copyWith(amountDigits: digits);

  void setNote(String value) => state = state.copyWith(note: value);
}
