import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_provider.g.dart';

const _localePrefsKey = 'locale_code';

/// Set once at boot (see [loadPersistedLocale]) so [AppLocale.build] can
/// return the persisted value synchronously on first read.
Locale _bootLocale = const Locale('en');

/// Reads the persisted locale before `runApp`. Call from `main()`.
Future<void> loadPersistedLocale() async {
  final prefs = await SharedPreferences.getInstance();
  final code = prefs.getString(_localePrefsKey);
  if (code != null) _bootLocale = Locale(code);
}

/// EN/AR app locale — persisted, drives `Directionality` (architecture.md §3).
@Riverpod(keepAlive: true)
class AppLocale extends _$AppLocale {
  @override
  Locale build() => _bootLocale;

  Future<void> setLocale(Locale locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localePrefsKey, locale.languageCode);
  }
}
