import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../providers/auth_state_provider.dart';
import '../providers/session_persistence.dart';
import '../widgets/splash_ledger_texture.dart';

/// Screen A1 — Splash
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    unawaited(_navigateNext());
  }

  Future<void> _navigateNext() async {
    await Future<void>.delayed(const Duration(milliseconds: 8200));
    if (!mounted) return;
    final authState = ref.read(appAuthStateProvider);
    final target = authState.maybeWhen(
      authed: (_) => Routes.home,
      orElse: () => bootOnboardingSeen ? Routes.login : Routes.language,
    );
    context.go(target);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    return Scaffold(
      // Explicit fill: Splash sits outside app_router.dart's NPBackground
      // shell (it has its own SplashLedgerTexture), and the theme's
      // scaffoldBackgroundColor is transparent for every other screen.
      backgroundColor: colors.surfacePage,
      body: Stack(
        children: [
          const Positioned.fill(child: SplashLedgerTexture()),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/logo.png', width: 120, height: 120),
                const SizedBox(height: 24),
                Text(
                  context.l10n.appTitle,
                  style: theme.textTheme.displayMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n.splashTagline,
                  style: theme.textTheme.bodyLarge,
                ),
                if (kDebugMode) ...[
                  const SizedBox(height: 32),
                  TextButton(
                    onPressed: () => context.push('/dev/gallery'),
                    child: Text(context.l10n.galleryDebugLaunch),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
