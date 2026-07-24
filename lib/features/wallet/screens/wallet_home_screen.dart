import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_balance_card.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../providers/wallet_provider.dart';
import '../widgets/wallet_mini_statement.dart';

/// Screen C1 — Wallet Home
///
/// Same per-section shimmer/content/error shape as B1 Home Dashboard
/// (architecture.md §9) — balance and mini statement watch their own
/// [AsyncValue] independently.
class WalletHomeScreen extends ConsumerStatefulWidget {
  const WalletHomeScreen({super.key});

  @override
  ConsumerState<WalletHomeScreen> createState() => _WalletHomeScreenState();
}

class _WalletHomeScreenState extends ConsumerState<WalletHomeScreen> {
  // Pure widget-local UI state — mirrors home_screen.dart's `_balanceHidden`.
  bool _balanceHidden = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.walletHomeTitle)),
      applyGutter: true,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          0,
          AppSpacing.lg,
          0,
          AppSpacing.xxxl,
        ),
        children: [
          _BalanceSection(
            hidden: _balanceHidden,
            onToggleHidden: () {
              setState(() => _balanceHidden = !_balanceHidden);
            },
          ),
          const SizedBox(height: AppSpacing.xl),
          const _WalletActionsRow(),
          const SizedBox(height: AppSpacing.sectionGap),
          const WalletMiniStatement(),
        ],
      ),
    );
  }
}

class _BalanceSection extends ConsumerWidget {
  const _BalanceSection({required this.hidden, required this.onToggleHidden});

  final bool hidden;
  final VoidCallback onToggleHidden;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletAsync = ref.watch(appWalletProvider);
    final l10n = context.l10n;

    return walletAsync.when(
      data: (wallet) => NPBalanceCard(
        balance: wallet.balance,
        label: l10n.walletHomeBalanceLabel,
        hidden: hidden,
        onToggleHidden: onToggleHidden,
      ),
      loading: () => const NPShimmer.card(height: 168),
      error: (error, stackTrace) => NPErrorState(
        title: l10n.homeErrorTitle,
        body: l10n.homeErrorBody,
        onRetry: () =>
            unawaited(ref.read(appWalletProvider.notifier).refresh()),
        retryLabel: l10n.homeErrorRetry,
      ),
    );
  }
}

/// Top-up / Send / Request / My QR — product.md C1's 4 wallet-scoped
/// actions (a different set from B1's Top-up/Send/Scan/Request quick
/// actions, which lead with Scan for the FAB-adjacent flow).
class _WalletActionsRow extends StatelessWidget {
  const _WalletActionsRow();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      // Reserves room for the last tile's hard NeoPop shadow — same fix as
      // home_screen.dart's `_QuickActionsRow`.
      padding: const EdgeInsetsDirectional.only(end: AppSpacing.xs),
      child: Row(
        children: [
          Expanded(
            child: _WalletActionTile(
              icon: Icons.add_circle_outline,
              label: l10n.homeQuickActionTopUp,
              onTap: () => context.push(Routes.walletTopUp),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: _WalletActionTile(
              icon: Icons.send_outlined,
              label: l10n.homeQuickActionSend,
              onTap: () => context.push(Routes.walletSend),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: _WalletActionTile(
              icon: Icons.call_received,
              label: l10n.homeQuickActionRequest,
              onTap: () => context.push(Routes.walletRequest),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: _WalletActionTile(
              icon: Icons.qr_code_2_outlined,
              label: l10n.walletActionMyQr,
              onTap: () => context.push(Routes.walletQr),
            ),
          ),
        ],
      ),
    );
  }
}

/// Mirrors `home_screen.dart`'s `_ActionTile` (accent variant) — kept as a
/// screen-private copy rather than promoted to `core/widgets/` since only
/// these two screens use this exact square-tile shape today.
class _WalletActionTile extends StatelessWidget {
  const _WalletActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return NPCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.md,
        horizontal: AppSpacing.xs,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: colors.accentPrimary.withValues(alpha: 0.10),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(icon, size: 28, color: colors.accentPrimary),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall?.copyWith(
              color: colors.inkSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
