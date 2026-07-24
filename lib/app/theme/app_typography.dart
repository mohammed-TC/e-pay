import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Type scale — design.md §3. `Display` (Space Grotesk) for titles/amounts,
/// `Body/UI` (Inter) for everything else. Arabic locale swaps both roles for
/// IBM Plex Sans Arabic per design.md §3/§8.2.
abstract final class AppTypography {
  /// Builds the [TextTheme] for the given [isArabic] locale and ink colors.
  static TextTheme textTheme({
    required bool isArabic,
    required Color inkPrimary,
    required Color inkSecondary,
    required Color inkTertiary,
  }) {
    TextStyle display(double size, double height, {FontWeight weight = FontWeight.w600}) {
      final base = isArabic
          ? GoogleFonts.ibmPlexSansArabic(fontWeight: weight)
          : GoogleFonts.spaceGrotesk(fontWeight: weight, letterSpacing: -size * 0.01);
      return base.copyWith(fontSize: size, height: height / size, color: inkPrimary);
    }

    TextStyle body(double size, double height, {FontWeight weight = FontWeight.w400, Color? color}) {
      final bumped = isArabic ? size + 1 : size;
      final base = isArabic ? GoogleFonts.ibmPlexSansArabic(fontWeight: weight) : GoogleFonts.inter(fontWeight: weight);
      return base.copyWith(fontSize: bumped, height: height / size, color: color ?? inkSecondary);
    }

    return TextTheme(
      displayLarge: display(40, 44, weight: FontWeight.w700), // display-xl — balance
      displayMedium: display(28, 34, weight: FontWeight.w600), // display — screen titles/totals
      titleLarge: body(20, 26, weight: FontWeight.w600, color: inkPrimary), // title
      bodyLarge: body(16, 24, color: inkSecondary), // body
      labelLarge: body(14, 20, weight: FontWeight.w500, color: inkSecondary), // label
      bodySmall: body(12, 16, color: inkTertiary), // caption
    );
  }

  /// mono-amount 18/24, tabular figures — design.md §3.
  static TextStyle monoAmount({required bool isArabic, required Color color}) {
    final base = isArabic ? GoogleFonts.ibmPlexSansArabic() : GoogleFonts.inter();
    return base.copyWith(
      fontSize: 18,
      height: 24 / 18,
      color: color,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
  }
}
