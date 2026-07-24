import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/biller.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_empty_state.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_list_tile.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../providers/saved_accounts_provider.dart';

/// Screen E4 — Saved Accounts
///
/// Nicknamed accounts saved against [biller] — product.md E4. Swipe to
/// delete; tap fetches the current bill and pushes E5. The "add account"
/// row always pushes E3 for a new account against the same biller.
class SavedAccountsScreen extends ConsumerWidget {
  const SavedAccountsScreen({required this.biller, super.key});

  final Biller biller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final accountsAsync = ref.watch(savedAccountsProvider);
    final colors = Theme.of(context).extension<AppColors>()!;

    return NPScaffold(
      appBar: AppBar(title: Text(biller.name)),
      body: accountsAsync.when(
        data: (accounts) {
          final filtered = accounts
              .where((account) => account.billerId == biller.id)
              .toList();
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
            children: [
              if (filtered.isEmpty)
                NPEmptyState(
                  title: l10n.savedAccountsEmptyTitle,
                  body: l10n.savedAccountsEmptyBody,
                  ctaLabel: l10n.savedAccountsAddCta,
                  onCta: () => context.push(
                    Routes.billsAccountEntry,
                    extra: biller,
                  ),
                )
              else ...[
                for (final account in filtered)
                  Dismissible(
                    key: ValueKey(account.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: AlignmentDirectional.centerEnd,
                      padding: const EdgeInsetsDirectional.only(
                        end: AppSpacing.lg,
                      ),
                      child: Icon(
                        Icons.delete_outline,
                        color: colors.semanticDanger,
                      ),
                    ),
                    onDismissed: (direction) => ref
                        .read(savedAccountsProvider.notifier)
                        .delete(account.id),
                    child: NPListTile(
                      leading: Icon(
                        Icons.receipt_long_outlined,
                        color: colors.inkPrimary,
                      ),
                      title: account.nickname,
                      subtitle: account.accountNumber,
                      onTap: () =>
                          context.push(Routes.billsDetail, extra: account),
                    ),
                  ),
                const SizedBox(height: AppSpacing.md),
                NPButton(
                  label: l10n.savedAccountsAddCta,
                  variant: NPButtonVariant.secondary,
                  onPressed: () => context.push(
                    Routes.billsAccountEntry,
                    extra: biller,
                  ),
                ),
              ],
            ],
          );
        },
        loading: () => Column(
          children: List.generate(
            3,
            (index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
              child: NPShimmer(height: 72),
            ),
          ),
        ),
        error: (error, stackTrace) => NPErrorState(
          title: l10n.homeErrorTitle,
          body: l10n.homeErrorBody,
          onRetry: () => ref.invalidate(savedAccountsProvider),
          retryLabel: l10n.homeErrorRetry,
        ),
      ),
    );
  }
}
