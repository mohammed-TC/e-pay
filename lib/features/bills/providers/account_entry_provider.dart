import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_entry_provider.g.dart';

/// E3 Account Entry form state — transient screen state, not a domain
/// entity, mirrors `TopUpState` (`top_up_provider.dart`). `fetchByMobile`
/// is only offered for electricity billers per product.md E3.
class AccountEntryState {
  const AccountEntryState({
    this.accountNumber = '',
    this.mobileNumber = '',
    this.nickname = '',
    this.saveAccount = true,
    this.fetchByMobile = false,
  });

  final String accountNumber;
  final String mobileNumber;
  final String nickname;
  final bool saveAccount;
  final bool fetchByMobile;

  String get resolvedAccountNumber =>
      fetchByMobile ? mobileNumber : accountNumber;

  bool get isValid => resolvedAccountNumber.isNotEmpty;

  AccountEntryState copyWith({
    String? accountNumber,
    String? mobileNumber,
    String? nickname,
    bool? saveAccount,
    bool? fetchByMobile,
  }) {
    return AccountEntryState(
      accountNumber: accountNumber ?? this.accountNumber,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      nickname: nickname ?? this.nickname,
      saveAccount: saveAccount ?? this.saveAccount,
      fetchByMobile: fetchByMobile ?? this.fetchByMobile,
    );
  }
}

/// Autodispose: fresh per push of the account entry screen.
@Riverpod(keepAlive: false)
class AccountEntryForm extends _$AccountEntryForm {
  @override
  AccountEntryState build() => const AccountEntryState();

  void setAccountNumber(String value) =>
      state = state.copyWith(accountNumber: value);

  void setMobileNumber(String value) =>
      state = state.copyWith(mobileNumber: value);

  void setNickname(String value) => state = state.copyWith(nickname: value);

  void toggleSaveAccount({required bool value}) =>
      state = state.copyWith(saveAccount: value);

  void toggleFetchByMobile({required bool value}) =>
      state = state.copyWith(fetchByMobile: value);
}
