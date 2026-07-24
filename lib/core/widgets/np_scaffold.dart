import 'package:flutter/material.dart';

import '../../app/theme/app_spacing.dart';

/// architecture.md §5 `NPScaffold` — themed scaffold with safe-area and
/// directional (start/end, never left/right) gutter padding baked in.
class NPScaffold extends StatelessWidget {
  const NPScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.applyGutter = true,
    this.backgroundColor,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  /// Wraps [body] in the standard 20px screen gutter (design.md §4).
  final bool applyGutter;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Defaults transparent, not `surfacePage`: NPBackground (behind
      // every routed screen except Splash, via app_router.dart's
      // ShellRoute) already paints the page fill + dot grid. Callers can
      // still force an explicit opaque `backgroundColor` when needed.
      backgroundColor: backgroundColor ?? Colors.transparent,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: applyGutter
            ? Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: AppSpacing.gutter,
                ),
                child: body,
              )
            : body,
      ),
    );
  }
}
