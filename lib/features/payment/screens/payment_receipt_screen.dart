import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/txn.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_success_animation.dart';

/// Screen C7/E9 shared — Payment Receipt
///
/// Takes a [Txn] (not a `PaymentResult`) so this screen doubles as both the
/// live success takeover pushed by `PaymentConfirmScreen` at the end of the
/// shared flow, and History's "view/re-download receipt" screen — both cases
/// already have a concrete [Txn] in hand. architecture.md §4.
class PaymentReceiptScreen extends StatelessWidget {
  const PaymentReceiptScreen({required this.txn, super.key});

  final Txn txn;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return NPScaffold(
      applyGutter: false,
      body: Stack(
        children: [
          NPSuccessAnimation(
            amount: txn.amount,
            title: l10n.paymentReceiptTitle,
            rewardsEarned: txn.rewardPointsEarned,
            onDismiss: () => context.pop(),
            doneLabel: l10n.paymentReceiptDone,
          ),
          PositionedDirectional(
            bottom: AppSpacing.xxxl + 56,
            start: AppSpacing.gutter,
            end: AppSpacing.gutter,
            child: Text(
              '${l10n.paymentReceiptReferenceLabel}: ${txn.referenceNo}',
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(color: colors.inkTertiary),
            ),
          ),
        ],
      ),
    );
  }
}
