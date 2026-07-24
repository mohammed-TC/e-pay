import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_profile.dart';

part 'auth_state.freezed.dart';

/// Auth lifecycle — architecture.md §3. `app_router.dart`'s redirect listens
/// to this.
@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.loggedOut() = AuthLoggedOut;

  const factory AuthState.otpPending({required String mobileNumber}) =
      AuthOtpPending;

  const factory AuthState.needsPin({required UserProfile profile}) =
      AuthNeedsPin;

  const factory AuthState.authed({required UserProfile profile}) = AuthAuthed;
}
