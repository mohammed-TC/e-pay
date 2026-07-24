import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/models/txn.dart';
import '../../features/_gallery/screens/widget_gallery_screen.dart';
import '../../features/history/screens/history_screen.dart';
import '../../features/history/screens/transaction_detail_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/home/widgets/app_shell.dart';
import '../../features/onboarding/screens/biometric_enable_screen.dart';
import '../../features/onboarding/screens/language_select_screen.dart';
import '../../features/onboarding/screens/login_screen.dart';
import '../../features/onboarding/screens/onboarding_carousel_screen.dart';
import '../../features/onboarding/screens/otp_screen.dart';
import '../../features/onboarding/screens/pin_setup_screen.dart';
import '../../features/onboarding/screens/profile_setup_screen.dart';
import '../../features/onboarding/screens/splash_screen.dart';
import '../../features/payment/models/payment_request.dart';
import '../../features/payment/screens/payment_confirm_screen.dart';
import '../../features/payment/screens/payment_receipt_screen.dart';
import 'routes.dart';

/// Dev-only route for the Phase 2 widget gallery — not part of the product
/// route map in routes.dart. Remove alongside the gallery screen in
/// Phase 9's release-hardening pass (tasks.md).
const _devGalleryRoute = '/dev/gallery';

final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _historyNavigatorKey = GlobalKey<NavigatorState>();
final _rewardsNavigatorKey = GlobalKey<NavigatorState>();
final _profileNavigatorKey = GlobalKey<NavigatorState>();

/// go_router route table — architecture.md §6. Consumed by
/// `router_provider.dart`. Screens beyond Phase 3's scope stay wired to
/// [_PlaceholderScreen] until their phase builds them.
List<RouteBase> get appRoutes => [
  GoRoute(
    path: Routes.splash,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: Routes.language,
    builder: (context, state) => const LanguageSelectScreen(),
  ),
  GoRoute(
    path: Routes.onboarding,
    builder: (context, state) => const OnboardingCarouselScreen(),
  ),
  GoRoute(path: Routes.login, builder: (context, state) => const LoginScreen()),
  GoRoute(
    path: Routes.otp,
    builder: (context, state) =>
        OtpScreen(mobileNumber: state.extra as String? ?? ''),
  ),
  GoRoute(
    path: Routes.profileSetup,
    builder: (context, state) => const ProfileSetupScreen(),
  ),
  GoRoute(
    path: Routes.pinSetup,
    builder: (context, state) => const PinSetupScreen(),
  ),
  GoRoute(
    path: Routes.biometricSetup,
    builder: (context, state) => const BiometricEnableScreen(),
  ),
  GoRoute(
    path: Routes.paymentConfirm,
    builder: (context, state) =>
        PaymentConfirmScreen(request: state.extra! as PaymentRequest),
  ),
  GoRoute(
    path: Routes.paymentReceipt,
    builder: (context, state) => PaymentReceiptScreen(txn: state.extra! as Txn),
  ),
  GoRoute(
    path: Routes.transactionDetail,
    builder: (context, state) =>
        TransactionDetailScreen(txn: state.extra! as Txn),
  ),
  GoRoute(
    path: _devGalleryRoute,
    builder: (context, state) => const WidgetGalleryScreen(),
  ),
  StatefulShellRoute.indexedStack(
    builder: (context, state, shell) => AppShell(navigationShell: shell),
    branches: [
      StatefulShellBranch(
        navigatorKey: _homeNavigatorKey,
        routes: [
          GoRoute(
            path: Routes.home,
            builder: (context, state) => const HomeScreen(),
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _historyNavigatorKey,
        routes: [
          GoRoute(
            path: Routes.history,
            builder: (context, state) => const HistoryScreen(),
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _rewardsNavigatorKey,
        routes: [
          GoRoute(
            path: Routes.rewards,
            builder: (context, state) =>
                const _PlaceholderScreen(path: Routes.rewards),
          ),
        ],
      ),
      StatefulShellBranch(
        navigatorKey: _profileNavigatorKey,
        routes: [
          GoRoute(
            path: Routes.profile,
            builder: (context, state) =>
                const _PlaceholderScreen(path: Routes.profile),
          ),
        ],
      ),
    ],
  ),
  for (final path in _placeholderRoutes)
    GoRoute(
      path: path,
      builder: (context, state) => _PlaceholderScreen(path: path),
    ),
];

const _placeholderRoutes = [
  Routes.scan,
  Routes.wallet,
  Routes.walletTopUp,
  Routes.walletSend,
  Routes.walletRequest,
  Routes.walletQr,
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
