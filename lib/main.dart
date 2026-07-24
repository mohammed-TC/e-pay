import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';
import 'app/locale_provider.dart';
import 'features/onboarding/providers/session_persistence.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadPersistedLocale();
  await loadPersistedSession();
  runApp(const ProviderScope(child: EmralPayApp()));
}
