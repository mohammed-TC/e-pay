import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/constants/demo_constants.dart';
import '../../core/models/user_profile.dart';
import '../../core/utils/mock_latency.dart';

part 'auth_repository.g.dart';

/// In-memory auth store — architecture.md §8. No JSON asset: the demo user
/// is synthesized after OTP verification (product.md A6), not pre-seeded.
class AuthRepository {
  UserProfile? _profile;
  String? _pin;

  Future<bool> verifyOtp(String mobileNumber, String otp) async {
    await simulateLatency();
    if (otp != DemoConstants.mockOtp) return false;
    _profile ??= UserProfile(
      id: 'u1',
      fullName: 'Demo User',
      mobileNumber: mobileNumber,
    );
    return true;
  }

  Future<UserProfile> completeProfile({
    required String fullName,
    String? email,
  }) async {
    await simulateLatency();
    final current = _profile;
    if (current == null) {
      throw StateError('OTP must be verified before profile setup');
    }
    _profile = current.copyWith(fullName: fullName, email: email);
    return _profile!;
  }

  Future<void> setPin(String pin) async {
    await simulateLatency();
    _pin = pin;
  }

  Future<bool> verifyPin(String pin) async {
    await simulateLatency();
    return pin == _pin;
  }

  UserProfile? get currentProfile => _profile;
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => AuthRepository();
