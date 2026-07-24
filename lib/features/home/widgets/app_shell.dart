import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_plate.dart';

/// Screen B4 — Bottom Navigation
///
/// Wraps go_router's [StatefulNavigationShell] (Home / History / Rewards /
/// Profile branches, in that index order — architecture.md §6) with the
/// custom NeoPop bottom bar and a center-docked scan FAB. The shell IS the
/// body: it already manages the `IndexedStack` of branch navigators.
class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void _onTabTap(int index) {
    if (index == navigationShell.currentIndex) return;
    unawaited(HapticFeedback.lightImpact());
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      floatingActionButton: _ScanFab(
        onTap: () => context.push(Routes.scan),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _BottomBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTabTap,
      ),
    );
  }
}

/// Custom bottom bar — plain [Container] with a hairline top border, never a
/// Material `BottomNavigationBar` (design-tokens.md: no ripple/elevation).
/// Deviation from design.md's literal "icon morph" tab-switch spec: a color
/// + weight tween on icon/label is used instead of a morphing icon shape —
/// sufficient for this demo while respecting the 240ms easeOutCubic timing.
class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final l10n = context.l10n;

    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: colors.surfaceCard,
        border: Border(
          top: BorderSide(
            color: colors.inkPrimary.withValues(alpha: 0.08),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _NavItem(
              icon: Icons.home_outlined,
              label: l10n.navHome,
              selected: currentIndex == 0,
              onTap: () => onTap(0),
            ),
          ),
          Expanded(
            child: _NavItem(
              icon: Icons.receipt_long_outlined,
              label: l10n.navHistory,
              selected: currentIndex == 1,
              onTap: () => onTap(1),
            ),
          ),
          const SizedBox(width: 64),
          Expanded(
            child: _NavItem(
              icon: Icons.card_giftcard_outlined,
              label: l10n.navRewards,
              selected: currentIndex == 2,
              onTap: () => onTap(2),
            ),
          ),
          Expanded(
            child: _NavItem(
              icon: Icons.person_outline,
              label: l10n.navProfile,
              selected: currentIndex == 3,
              onTap: () => onTap(3),
            ),
          ),
        ],
      ),
    );
  }
}

/// Single tab item — icon + label, color-tweens between `ink.tertiary`
/// (inactive) and `accent.primary` (active) over 240ms easeOutCubic.
class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final target = selected ? colors.accentPrimary : colors.inkTertiary;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: TweenAnimationBuilder<Color?>(
        tween: ColorTween(end: target),
        duration: reduceMotion
            ? Duration.zero
            : const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        builder: (context, color, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 22, color: color),
              const SizedBox(height: AppSpacing.xs),
              AnimatedDefaultTextStyle(
                duration: reduceMotion
                    ? Duration.zero
                    : const Duration(milliseconds: 240),
                curve: Curves.easeOutCubic,
                style: (textTheme.bodySmall ?? const TextStyle()).copyWith(
                  color: color,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
                child: Text(label),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Center scan FAB — plate physics via [NPPlate] (circular), never a
/// Material `FloatingActionButton` (no default ripple/elevation).
class _ScanFab extends StatelessWidget {
  const _ScanFab({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return SizedBox(
      width: 56,
      height: 56,
      child: NPPlate(
        onTap: () {
          unawaited(HapticFeedback.lightImpact());
          onTap();
        },
        color: colors.accentPrimary,
        shadowColor: colors.accentDeep,
        borderRadius: 28,
        padding: EdgeInsets.zero,
        child: const Center(
          child: Icon(Icons.qr_code_scanner_outlined, color: Colors.white, size: 24),
        ),
      ),
    );
  }
}
