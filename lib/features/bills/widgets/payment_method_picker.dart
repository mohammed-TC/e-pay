import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/saved_card.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_list_tile.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../../../l10n/app_localizations.dart';
import '../../wallet/providers/wallet_provider.dart';

/// Screen E8 — Payment Method Sheet
///
/// Wallet (default) / saved card / new card / Apple Pay mock — product.md
/// E8. Inline picker, not a route: mirrors `WalletTopUpScreen._SourceList`
/// (wallet_top_up_screen.dart), generalized so E5/E6/E7 all reuse it
/// instead of each re-implementing their own source list.
class PaymentMethodPicker extends ConsumerWidget {
  const PaymentMethodPicker({
    required this.selectedMethodId,
    required this.onSelect,
    super.key,
  });

  static const walletMethodId = 'wallet';
  static const applePayMethodId = 'apple_pay';

  final String? selectedMethodId;
  final ValueChanged<String> onSelect;

  static String labelFor(
    String? methodId,
    List<SavedCard> cards,
    AppLocalizations l10n,
  ) {
    if (methodId == null || methodId == walletMethodId) {
      return l10n.paymentMethodWallet;
    }
    if (methodId == applePayMethodId) return l10n.paymentMethodApplePay;
    final card = cards.where((c) => c.id == methodId).firstOrNull;
    return card == null ? '' : '${card.brand} ${card.maskedNumber}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colors = Theme.of(context).extension<AppColors>()!;
    final walletAsync = ref.watch(appWalletProvider);

    return walletAsync.when(
      data: (wallet) => Column(
        children: [
          NPListTile(
            leading: Icon(
              Icons.account_balance_wallet_outlined,
              size: 20,
              color: colors.inkPrimary,
            ),
            title: l10n.paymentMethodWallet,
            trailingWidget:
                selectedMethodId == null || selectedMethodId == walletMethodId
                ? Icon(Icons.check_circle, color: colors.accentPrimary)
                : null,
            onTap: () => onSelect(walletMethodId),
          ),
          for (final card in wallet.savedCards)
            NPListTile(
              leading: Icon(
                Icons.credit_card,
                size: 20,
                color: colors.inkPrimary,
              ),
              title: '${card.brand} ${card.maskedNumber}',
              subtitle: card.expiry,
              trailingWidget: selectedMethodId == card.id
                  ? Icon(Icons.check_circle, color: colors.accentPrimary)
                  : null,
              onTap: () => onSelect(card.id),
            ),
          NPListTile(
            leading: Icon(Icons.apple, size: 20, color: colors.inkPrimary),
            title: l10n.paymentMethodApplePay,
            trailingWidget: selectedMethodId == applePayMethodId
                ? Icon(Icons.check_circle, color: colors.accentPrimary)
                : null,
            onTap: () => onSelect(applePayMethodId),
          ),
          NPListTile(
            leading: Icon(Icons.add_card, size: 20, color: colors.inkPrimary),
            title: l10n.paymentMethodAddCard,
            onTap: () => context.push(Routes.settingsCards),
          ),
        ],
      ),
      loading: () => const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: NPShimmer(height: 56),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: NPShimmer(height: 56),
          ),
        ],
      ),
      error: (error, stackTrace) => NPErrorState(
        title: l10n.homeErrorTitle,
        body: l10n.homeErrorBody,
        onRetry: () => ref.invalidate(appWalletProvider),
        retryLabel: l10n.homeErrorRetry,
      ),
    );
  }
}
