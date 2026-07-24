import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
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
    final colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      backgroundColor: backgroundColor ?? colors.surfacePage,
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
