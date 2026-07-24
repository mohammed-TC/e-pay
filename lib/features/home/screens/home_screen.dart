import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/money.dart';
import '../../../core/models/txn_type.dart';
import '../../../core/widgets/np_balance_card.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_empty_state.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_list_tile.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../../history/providers/transactions_provider.dart';
import '../../payment/models/payment_request.dart';
import '../../payment/models/payment_result.dart';
import '../../rewards/providers/rewards_provider.dart';
import '../../wallet/providers/wallet_provider.dart';

/// Screen B1 — Home Dashboard
///
/// Every section below watches its own [AsyncValue] and renders its own
/// shimmer/content/error state independently (architecture.md §9) — there is
/// deliberately no single screen-wide loading gate.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // Pure widget-local UI state (flutter-conventions.md's local-UI-state
  // exception) — not persisted, not business logic.
  bool _balanceHidden = false;

  @override
  Widget build(BuildContext context) {
    return NPScaffold(
      applyGutter: true,
      body: ListView(
        // Bottom padding clears the AppShell's centerDocked scan FAB, which
        // floats ~28px into the body above the bottom bar (Scaffold doesn't
        // reserve space for it) — without this the FAB overlaps whatever
        // scrolls to the bottom, per architecture.md's B4 shell notes.
        padding: const EdgeInsets.fromLTRB(
          0,
          AppSpacing.lg,
          0,
          AppSpacing.xxxl + AppSpacing.xxl,
        ),
        children: [
          _BalanceSection(
            hidden: _balanceHidden,
            onToggleHidden: () {
              setState(() => _balanceHidden = !_balanceHidden);
            },
          ),
          const SizedBox(height: AppSpacing.xl),
          const _QuickActionsRow(),
          if (kDebugMode) ...[
            const SizedBox(height: AppSpacing.lg),
            const _DebugPaymentTile(),
          ],
          const SizedBox(height: AppSpacing.sectionGap),
          const _ServicesGrid(),
          const SizedBox(height: AppSpacing.sectionGap),
          const _PromoCarousel(),
          const SizedBox(height: AppSpacing.sectionGap),
          const _RecentTransactionsSection(),
          const SizedBox(height: AppSpacing.xl),
          const _RewardsSection(),
        ],
      ),
    );
  }
}

/// Balance card — watches [appWalletProvider].
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
        label: l10n.homeAvailableBalance,
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

/// Top-up / Send / Scan / Request — 4 square [NPCard] tiles.
class _QuickActionsRow extends StatelessWidget {
  const _QuickActionsRow();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      children: [
        Expanded(
          child: _ActionTile(
            icon: Icons.add_circle_outline,
            label: l10n.homeQuickActionTopUp,
            onTap: () => context.push(Routes.walletTopUp),
            accent: true,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _ActionTile(
            icon: Icons.send_outlined,
            label: l10n.homeQuickActionSend,
            onTap: () => context.push(Routes.walletSend),
            accent: true,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _ActionTile(
            icon: Icons.qr_code_scanner_outlined,
            label: l10n.homeQuickActionScan,
            onTap: () => context.push(Routes.scan),
            accent: true,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _ActionTile(
            icon: Icons.call_received,
            label: l10n.homeQuickActionRequest,
            onTap: () => context.push(Routes.walletRequest),
            accent: true,
          ),
        ),
      ],
    );
  }
}

/// Shared square tile — 40px `surface.sunken` icon well (mirrors
/// [NPListTile]'s leading-icon-tile look) + label, wrapped in [NPCard].
/// Reused by [_QuickActionsRow] and [_ServicesGrid].
class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.accent = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  /// Tints the icon well with `accent.tint`/`accent.deep` instead of the
  /// neutral `surface.sunken`/`ink.primary` pair — reserved for the primary
  /// money-moving quick actions (design-tokens.md: accent scoped to primary
  /// CTAs) so they read as a distinct tier above the services grid instead
  /// of blurring into one undifferentiated wall of identical tiles.
  final bool accent;

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
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: accent ? colors.accentTint : colors.surfaceSunken,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              size: 20,
              color: accent ? colors.accentDeep : colors.inkPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

/// Debug-only trigger to exercise the shared payment flow (architecture.md
/// §4) ahead of Bills/Wallet screens landing in Phase 4/5 — the only way to
/// build a real [PaymentRequest] this phase. Sample biller name/line-item
/// copy is inline per the confirmed plan, mirroring product.md's
/// mock-brand convention; it is debug-only and never shown to end users.
class _DebugPaymentTile extends StatelessWidget {
  const _DebugPaymentTile();

  Future<void> _trigger(BuildContext context) async {
    const request = PaymentRequest(
      type: TxnType.bill,
      payeeName: 'VoltGrid',
      payeeSubtitle: 'Account •• 4821',
      lineItems: [
        PaymentLineItem(label: 'Amount due', amount: Money(minorUnits: 12500)),
      ],
      amount: Money(minorUnits: 12500),
      fee: Money.zero,
    );
    await context.push<PaymentResult>(Routes.paymentConfirm, extra: request);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return NPCard(
      onTap: () => unawaited(_trigger(context)),
      child: Row(
        children: [
          Icon(Icons.science_outlined, size: 20, color: colors.semanticInfo),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              context.l10n.homeDebugTestPayment,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}

/// Bills / Recharge / Government / Insurance / Education / Remittance /
/// Rewards / More — 2 rows x 4 columns of [_ActionTile]s.
class _ServicesGrid extends StatelessWidget {
  const _ServicesGrid();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).extension<AppColors>()!;
    final items = <({IconData icon, String label, VoidCallback onTap})>[
      (
        icon: Icons.description_outlined,
        label: l10n.homeServiceBills,
        onTap: () => context.push(Routes.bills),
      ),
      (
        icon: Icons.bolt_outlined,
        label: l10n.homeServiceRecharge,
        onTap: () => context.push(Routes.billsRecharge),
      ),
      (
        icon: Icons.account_balance_outlined,
        label: l10n.homeServiceGovernment,
        onTap: () => context.push(Routes.gov),
      ),
      (
        icon: Icons.shield_outlined,
        label: l10n.homeServiceInsurance,
        onTap: () => context.push(Routes.insurance),
      ),
      (
        icon: Icons.school_outlined,
        label: l10n.homeServiceEducation,
        onTap: () => context.push(Routes.education),
      ),
      (
        icon: Icons.public,
        label: l10n.homeServiceRemittance,
        onTap: () => context.push(Routes.remit),
      ),
      (
        icon: Icons.card_giftcard_outlined,
        label: l10n.homeServiceRewards,
        onTap: () => context.go(Routes.rewards),
      ),
      (
        icon: Icons.more_horiz,
        label: l10n.homeServiceMore,
        onTap: () => context.push(Routes.settings),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.homeServicesSectionTitle,
          style: textTheme.labelLarge?.copyWith(
            color: colors.inkTertiary,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: AppSpacing.sm,
          crossAxisSpacing: AppSpacing.sm,
          childAspectRatio: 0.85,
          children: [
            for (final item in items)
              _ActionTile(
                icon: item.icon,
                label: item.label,
                onTap: item.onTap,
              ),
          ],
        ),
      ],
    );
  }
}

/// Feature-local static promo data — not one of the 9 domain repositories,
/// just 2-3 hardcoded entries whose copy comes from new l10n keys.
class _PromoCarousel extends StatelessWidget {
  const _PromoCarousel();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final promos = <({String title, String body})>[
      (title: l10n.homePromoTitle1, body: l10n.homePromoBody1),
      (title: l10n.homePromoTitle2, body: l10n.homePromoBody2),
      (title: l10n.homePromoTitle3, body: l10n.homePromoBody3),
    ];

    return SizedBox(
      height: 128,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.88),
        itemCount: promos.length,
        itemBuilder: (context, index) {
          final promo = promos[index];
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: AppSpacing.md),
            child: NPCard(
              interactive: false,
              color: colors.accentTint,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    promo.title,
                    style: textTheme.titleLarge?.copyWith(
                      color: colors.accentDeep,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    promo.body,
                    style: textTheme.bodyLarge?.copyWith(
                      color: colors.accentDeep,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Last 5 transactions — watches [appTransactionsProvider]. This app is
/// spend-only in the seeded mock data, so every row renders with
/// `isPositive: false` (`ink.primary`, never `accent.primary`) — a
/// deliberate simplification rather than inferring sign from [TxnType].
class _RecentTransactionsSection extends ConsumerWidget {
  const _RecentTransactionsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final txnsAsync = ref.watch(appTransactionsProvider);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.homeRecentTransactionsTitle, style: textTheme.titleLarge),
            NPButton(
              label: l10n.homeViewAll,
              variant: NPButtonVariant.ghost,
              onPressed: () => context.go(Routes.history),
            ),
          ],
        ),
        txnsAsync.when(
          data: (txns) {
            final recent = txns.take(5).toList();
            if (recent.isEmpty) {
              return NPEmptyState(
                title: l10n.homeRecentEmptyTitle,
                body: l10n.homeRecentEmptyBody,
              );
            }
            return Column(
              children: [
                for (final txn in recent)
                  NPListTile(
                    title: txn.title,
                    subtitle: txn.subtitle,
                    trailingAmount: txn.amount,
                    isPositive: false,
                  ),
              ],
            );
          },
          loading: () => Column(
            children: List.generate(
              3,
              (index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
                child: NPShimmer(height: 56),
              ),
            ),
          ),
          error: (error, stackTrace) => NPErrorState(
            title: l10n.homeErrorTitle,
            body: l10n.homeErrorBody,
            onRetry: () =>
                unawaited(ref.read(appTransactionsProvider.notifier).refresh()),
            retryLabel: l10n.homeErrorRetry,
          ),
        ),
      ],
    );
  }
}

/// Full-width rewards row — watches [appRewardsProvider], tap navigates to
/// the Rewards shell tab. Built on the shared [NPListTile] (56px min-height,
/// so the touch target clears the 44px minimum) rather than a small floating
/// chip: the previous chip was `Align`-ed alone at the screen's bottom-start
/// corner with no context or definite touch target, reading as a stray
/// leftover rather than a placed element (impeccable audit finding).
///
/// NOTE: design-tokens.md scopes `gold.reward` to the rewards screens
/// (I1/I2) only — this row stays on `accent.tint`/`accent.deep`, matching
/// the original chip's token choice.
class _RewardsSection extends ConsumerWidget {
  const _RewardsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rewardsAsync = ref.watch(appRewardsProvider);
    final colors = Theme.of(context).extension<AppColors>()!;
    final l10n = context.l10n;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return rewardsAsync.when(
      data: (rewards) => NPListTile(
        onTap: () => context.go(Routes.rewards),
        leading: Icon(Icons.star_rounded, size: 20, color: colors.accentDeep),
        title: l10n.homeServiceRewards,
        subtitle: '${rewards.points} ${l10n.homeRewardsPointsSuffix}',
        trailingWidget: Icon(
          isRtl ? Icons.chevron_left_rounded : Icons.chevron_right_rounded,
          color: colors.inkTertiary,
        ),
      ),
      loading: () => const NPShimmer(height: 56),
      error: (error, stackTrace) => NPListTile(
        onTap: () => ref.invalidate(appRewardsProvider),
        leading: Icon(
          Icons.star_rounded,
          size: 20,
          color: colors.inkTertiary,
        ),
        title: l10n.homeServiceRewards,
        subtitle: l10n.homeErrorRetry,
      ),
    );
  }
}
