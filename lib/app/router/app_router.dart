import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/onboarding/screens/splash_screen.dart';
import 'routes.dart';

/// go_router skeleton — architecture.md §6. Screens beyond Splash are wired
/// to [_PlaceholderScreen] until their phase builds them.
final appRouter = GoRouter(
  initialLocation: Routes.splash,
  redirect: _authRedirect,
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => const SplashScreen()),
    for (final path in _placeholderRoutes)
      GoRoute(path: path, builder: (context, state) => _PlaceholderScreen(path: path)),
  ],
);

/// Auth guard stub — Phase 3 wires this to `authStateProvider`
/// (loggedOut → `/login`; authed users skip onboarding routes).
String? _authRedirect(BuildContext context, GoRouterState state) => null;

const _placeholderRoutes = [
  Routes.language,
  Routes.onboarding,
  Routes.login,
  Routes.otp,
  Routes.profileSetup,
  Routes.pinSetup,
  Routes.home,
  Routes.history,
  Routes.rewards,
  Routes.profile,
  Routes.scan,
  Routes.wallet,
  Routes.walletTopUp,
  Routes.walletSend,
  Routes.walletRequest,
  Routes.walletQr,
  Routes.paymentConfirm,
  Routes.paymentReceipt,
  Routes.remit,
  Routes.remitBeneficiaries,
  Routes.remitAddBeneficiary,
  Routes.remitSend,
  Routes.remitTracker,
  Routes.bills,
  Routes.billsBiller,
  Routes.billsAccountEntry,
  Routes.billsSavedAccounts,
  Routes.billsDetail,
  Routes.billsRecharge,
  Routes.billsSmartMeter,
  Routes.gov,
  Routes.govFines,
  Routes.govRenewal,
  Routes.govJudiciary,
  Routes.govSocialProtection,
  Routes.insurance,
  Routes.insuranceQuote,
  Routes.education,
  Routes.educationStudent,
  Routes.notifications,
  Routes.search,
  Routes.settings,
  Routes.settingsCards,
  Routes.settingsSecurity,
  Routes.settingsBranchLocator,
  Routes.settingsMeterReading,
  Routes.settingsSupport,
];

class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(path)));
  }
}
