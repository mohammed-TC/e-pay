import 'package:flutter/material.dart';

import '../../../core/extensions/build_context_l10n.dart';

/// Screen A1 — Splash
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/logo.png', width: 120, height: 120),
            const SizedBox(height: 24),
            Text(context.l10n.appTitle, style: theme.textTheme.displayMedium),
            const SizedBox(height: 8),
            Text(context.l10n.splashTagline, style: theme.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
