import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/auth_state.dart';
import '../../../data/repositories/auth_repository.dart';
import 'session_persistence.dart';

/// Re-exported so consumers that only import this provider file (e.g.
/// `router_provider.dart`, `splash_screen.dart`) still get the generated
/// `AuthState.when`/`.maybeWhen` pattern-matching extension in scope —
/// extension visibility isn't transitive through plain imports.
export '../../../core/models/auth_state.dart';

part 'auth_state_provider.g.dart';

/// Auth lifecycle — architecture.md §3 `authStateProvider`. `app_router.dart`'s
/// redirect listens to this. Named `AppAuthState` (see `AppLocale` in
/// `app/locale_provider.dart`) since `AuthState` is already the state model.
@Riverpod(keepAlive: true)
class AppAuthState extends _$AppAuthState {
  @override
  AuthState build() {
    final profile = bootProfile;
    final pin = bootPin;
    if (profile != null && pin != null) {
      ref.read(authRepositoryProvider).rehydrate(profile: profile, pin: pin);
      return AuthState.authed(profile: profile);
    }
    return const AuthState.loggedOut();
  }

  Future<bool> verifyOtp(String mobileNumber, String otp) async {
    state = AuthState.otpPending(mobileNumber: mobileNumber);
    final repo = ref.read(authRepositoryProvider);
    final verified = await repo.verifyOtp(mobileNumber, otp);
    if (verified) {
      state = AuthState.needsPin(profile: repo.currentProfile!);
    }
    return verified;
  }

  Future<void> completeProfile({
    required String fullName,
    String? email,
  }) async {
    final repo = ref.read(authRepositoryProvider);
    final profile = await repo.completeProfile(
      fullName: fullName,
      email: email,
    );
    await persistProfile(profile);
    state = AuthState.needsPin(profile: profile);
  }

  Future<void> setPin(String pin) async {
    final repo = ref.read(authRepositoryProvider);
    await repo.setPin(pin);
    await persistPin(pin);
    final profile = repo.currentProfile;
    if (profile != null) state = AuthState.authed(profile: profile);
  }

  Future<void> logout() async {
    await clearSession();
    state = const AuthState.loggedOut();
  }
}
