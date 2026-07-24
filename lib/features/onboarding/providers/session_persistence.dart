import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/user_profile.dart';

const _mobileKey = 'session_mobile';
const _nameKey = 'session_name';
const _emailKey = 'session_email';
const _pinKey = 'session_pin';
const _onboardingSeenKey = 'session_onboarding_seen';

UserProfile? _bootProfile;
String? _bootPin;
bool _bootOnboardingSeen = false;

/// Reads persisted session/onboarding state before `runApp` — mirrors
/// `locale_provider.dart`'s `_bootLocale` pattern so `AppAuthState.build()`
/// can hydrate synchronously on first read. Storing the mock PIN in
/// plaintext prefs is a deliberate demo-only simplification: this prototype
/// has no real security requirement (CLAUDE.md "demo constants").
Future<void> loadPersistedSession() async {
  final prefs = await SharedPreferences.getInstance();
  final mobile = prefs.getString(_mobileKey);
  final name = prefs.getString(_nameKey);
  _bootOnboardingSeen = prefs.getBool(_onboardingSeenKey) ?? false;
  _bootPin = prefs.getString(_pinKey);
  if (mobile != null && name != null) {
    _bootProfile = UserProfile(
      id: 'u1',
      fullName: name,
      mobileNumber: mobile,
      email: prefs.getString(_emailKey),
    );
  }
}

UserProfile? get bootProfile => _bootProfile;
String? get bootPin => _bootPin;
bool get bootOnboardingSeen => _bootOnboardingSeen;

Future<void> persistProfile(UserProfile profile) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_mobileKey, profile.mobileNumber);
  await prefs.setString(_nameKey, profile.fullName);
  final email = profile.email;
  if (email != null) await prefs.setString(_emailKey, email);
}

Future<void> persistPin(String pin) async {
  _bootPin = pin;
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_pinKey, pin);
}

Future<void> markOnboardingSeen() async {
  _bootOnboardingSeen = true;
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(_onboardingSeenKey, true);
}

Future<void> clearSession() async {
  _bootProfile = null;
  _bootPin = null;
  final prefs = await SharedPreferences.getInstance();
  await Future.wait([
    prefs.remove(_mobileKey),
    prefs.remove(_nameKey),
    prefs.remove(_emailKey),
    prefs.remove(_pinKey),
  ]);
}
