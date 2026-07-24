import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/extensions/build_context_l10n.dart';
import '../l10n/app_localizations.dart';
import 'locale_provider.dart';
import 'router/router_provider.dart';
import 'theme/app_theme.dart';

class EmralPayApp extends ConsumerWidget {
  const EmralPayApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(appLocaleProvider);
    final isArabic = locale.languageCode == 'ar';
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.appTitle,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: AppTheme.light(isArabic: isArabic),
      darkTheme: AppTheme.dark(isArabic: isArabic),
      themeMode: ThemeMode.system,
    );
  }
}
