import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// Builds light/dark [ThemeData] from design.md §2–§4 tokens.
/// [isArabic] swaps the type scale to IBM Plex Sans Arabic (design.md §3).
abstract final class AppTheme {
  static ThemeData light({required bool isArabic}) =>
      _build(AppColors.light, Brightness.light, isArabic);

  static ThemeData dark({required bool isArabic}) =>
      _build(AppColors.dark, Brightness.dark, isArabic);

  static ThemeData _build(
    AppColors colors,
    Brightness brightness,
    bool isArabic,
  ) {
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: colors.accentPrimary,
      onPrimary: brightness == Brightness.light
          ? Colors.white
          : colors.inkPrimary,
      secondary: colors.accentDeep,
      onSecondary: Colors.white,
      error: colors.semanticDanger,
      onError: Colors.white,
      surface: colors.surfaceCard,
      onSurface: colors.inkPrimary,
    );

    final textTheme = AppTypography.textTheme(
      isArabic: isArabic,
      inkPrimary: colors.inkPrimary,
      inkSecondary: colors.inkSecondary,
      inkTertiary: colors.inkTertiary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      // Transparent, not `surfacePage`: NPBackground (behind every routed
      // screen via app_router.dart's ShellRoute) paints the actual page
      // fill + dot grid. An opaque Scaffold background here would paint
      // over it. Splash sits outside that shell and sets its own opaque
      // background explicitly.
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: textTheme,
      // NeoPop Plate physics replace Material ripple/elevation everywhere (design.md §10).
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      cardTheme: CardThemeData(
        color: colors.surfaceCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceSunken,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide.none,
        ),
      ),
      dividerColor: colors.inkPrimary.withValues(alpha: 0.08),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.inkPrimary,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colors.surfacePage,
        ),
        actionTextColor: colors.accentPrimary,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        insetPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.gutter,
          vertical: AppSpacing.lg,
        ),
      ),
      extensions: [colors],
    );
  }
}
