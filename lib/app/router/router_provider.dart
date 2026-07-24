import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/onboarding/providers/auth_state_provider.dart';
import 'app_router.dart';
import 'routes.dart';

/// Bridges [appAuthStateProvider] into go_router's `refreshListenable` so
/// auth-state transitions (loggedOut → needsPin → authed) re-evaluate the
/// redirect below even without an explicit navigation call —
/// architecture.md §6 auth guard.
class _GoRouterRefreshNotifier extends ChangeNotifier {
  _GoRouterRefreshNotifier(Ref ref) {
    ref.listen(appAuthStateProvider, (_, _) => notifyListeners());
  }
}

const _preAuthRoutes = {
  Routes.splash,
  Routes.language,
  Routes.onboarding,
  Routes.login,
  Routes.otp,
};

const _pinFlowRoutes = {
  Routes.profileSetup,
  Routes.pinSetup,
  Routes.biometricSetup,
};

/// Riverpod-reactive go_router — architecture.md §6. `app.dart` reads this
/// instead of a bare top-level `GoRouter`.
final routerProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = _GoRouterRefreshNotifier(ref);
  return GoRouter(
    initialLocation: Routes.splash,
    refreshListenable: refreshNotifier,
    redirect: (context, state) => _redirect(ref, state.matchedLocation),
    routes: appRoutes,
  );
});

/// Auth guard: loggedOut/otpPending confined to pre-auth routes, needsPin
/// confined to the profile/PIN/biometric setup routes, authed users skip
/// all onboarding routes (biometric setup excepted — it's a one-time
/// transient screen reached right after PIN setup while already authed).
String? _redirect(Ref ref, String path) {
  final authState = ref.read(appAuthStateProvider);
  return authState.when(
    loggedOut: () => _preAuthRoutes.contains(path) ? null : Routes.login,
    otpPending: (_) => _preAuthRoutes.contains(path) ? null : Routes.login,
    needsPin: (_) => _pinFlowRoutes.contains(path) ? null : Routes.profileSetup,
    authed: (_) {
      if (path == Routes.biometricSetup) return null;
      final blocked =
          _preAuthRoutes.contains(path) ||
          path == Routes.profileSetup ||
          path == Routes.pinSetup;
      return blocked ? Routes.home : null;
    },
  );
}
