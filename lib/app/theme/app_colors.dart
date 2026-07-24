import 'package:flutter/material.dart';

/// Design tokens — design.md §2. Access via `Theme.of(context).extension<AppColors>()!`.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.surfacePage,
    required this.surfaceCard,
    required this.surfaceSunken,
    required this.inkPrimary,
    required this.inkSecondary,
    required this.inkTertiary,
    required this.accentPrimary,
    required this.accentDeep,
    required this.accentTint,
    required this.plateShadow,
    required this.semanticDanger,
    required this.semanticWarning,
    required this.semanticInfo,
    required this.goldReward,
  });

  final Color surfacePage;
  final Color surfaceCard;
  final Color surfaceSunken;
  final Color inkPrimary;
  final Color inkSecondary;
  final Color inkTertiary;
  final Color accentPrimary;
  final Color accentDeep;
  final Color accentTint;
  final Color plateShadow;
  final Color semanticDanger;
  final Color semanticWarning;
  final Color semanticInfo;
  final Color goldReward;

  static const light = AppColors(
    surfacePage: Color(0xFFF7F8F6),
    surfaceCard: Color(0xFFFFFFFF),
    surfaceSunken: Color(0xFFEEF1ED),
    inkPrimary: Color(0xFF101914),
    inkSecondary: Color(0xFF4A564F),
    inkTertiary: Color(0xFF8A968F),
    accentPrimary: Color(0xFF0E9F6E),
    accentDeep: Color(0xFF065F46),
    accentTint: Color(0xFFDEF7EC),
    plateShadow: Color(0xFF101914),
    semanticDanger: Color(0xFFD64545),
    semanticWarning: Color(0xFFC9902A),
    semanticInfo: Color(0xFF2563EB),
    goldReward: Color(0xFFC9A24B),
  );

  static const dark = AppColors(
    surfacePage: Color(0xFF0C110E),
    surfaceCard: Color(0xFF151B17),
    surfaceSunken: Color(0xFF1D2420),
    inkPrimary: Color(0xFFF2F5F3),
    inkSecondary: Color(0xFFA9B4AE),
    inkTertiary: Color(0xFF6C7671),
    accentPrimary: Color(0xFF2FD08F),
    accentDeep: Color(0xFF0E9F6E),
    accentTint: Color(0xFF123B2C),
    plateShadow: Color(0xFF000000),
    semanticDanger: Color(0xFFF87171),
    semanticWarning: Color(0xFFE0B45C),
    semanticInfo: Color(0xFF2563EB),
    goldReward: Color(0xFFD9B45F),
  );

  @override
  AppColors copyWith({
    Color? surfacePage,
    Color? surfaceCard,
    Color? surfaceSunken,
    Color? inkPrimary,
    Color? inkSecondary,
    Color? inkTertiary,
    Color? accentPrimary,
    Color? accentDeep,
    Color? accentTint,
    Color? plateShadow,
    Color? semanticDanger,
    Color? semanticWarning,
    Color? semanticInfo,
    Color? goldReward,
  }) {
    return AppColors(
      surfacePage: surfacePage ?? this.surfacePage,
      surfaceCard: surfaceCard ?? this.surfaceCard,
      surfaceSunken: surfaceSunken ?? this.surfaceSunken,
      inkPrimary: inkPrimary ?? this.inkPrimary,
      inkSecondary: inkSecondary ?? this.inkSecondary,
      inkTertiary: inkTertiary ?? this.inkTertiary,
      accentPrimary: accentPrimary ?? this.accentPrimary,
      accentDeep: accentDeep ?? this.accentDeep,
      accentTint: accentTint ?? this.accentTint,
      plateShadow: plateShadow ?? this.plateShadow,
      semanticDanger: semanticDanger ?? this.semanticDanger,
      semanticWarning: semanticWarning ?? this.semanticWarning,
      semanticInfo: semanticInfo ?? this.semanticInfo,
      goldReward: goldReward ?? this.goldReward,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      surfacePage: Color.lerp(surfacePage, other.surfacePage, t)!,
      surfaceCard: Color.lerp(surfaceCard, other.surfaceCard, t)!,
      surfaceSunken: Color.lerp(surfaceSunken, other.surfaceSunken, t)!,
      inkPrimary: Color.lerp(inkPrimary, other.inkPrimary, t)!,
      inkSecondary: Color.lerp(inkSecondary, other.inkSecondary, t)!,
      inkTertiary: Color.lerp(inkTertiary, other.inkTertiary, t)!,
      accentPrimary: Color.lerp(accentPrimary, other.accentPrimary, t)!,
      accentDeep: Color.lerp(accentDeep, other.accentDeep, t)!,
      accentTint: Color.lerp(accentTint, other.accentTint, t)!,
      plateShadow: Color.lerp(plateShadow, other.plateShadow, t)!,
      semanticDanger: Color.lerp(semanticDanger, other.semanticDanger, t)!,
      semanticWarning: Color.lerp(semanticWarning, other.semanticWarning, t)!,
      semanticInfo: Color.lerp(semanticInfo, other.semanticInfo, t)!,
      goldReward: Color.lerp(goldReward, other.goldReward, t)!,
    );
  }
}
