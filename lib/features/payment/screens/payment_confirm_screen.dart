import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../models/payment_request.dart';
import '../models/payment_result.dart';
import '../providers/payment_flow_provider.dart';
import '../widgets/error_sheet.dart';
import '../widgets/pin_step.dart';

/// Screen C7/E9 shared — Payment Confirm (ConfirmSheet)
///
/// Orchestrates the whole shared flow (architecture.md §4,
/// `.claude/rules/payment-flow.md`): review → [PinStep] → the terminal
/// [PaymentResult] drives either a nested push of `PaymentReceiptScreen`
/// (success), or an [error_sheet] (insufficient funds / failed). Never
/// implements its own confirm/PIN/receipt UI — those live in
/// `payment_flow_provider.dart` and the widgets it composes.
class PaymentConfirmScreen extends ConsumerWidget {
  const PaymentConfirmScreen({required this.request, super.key});

  final PaymentRequest request;

  Future<void> _handleResult(
    BuildContext context,
    WidgetRef ref,
    PaymentResult result,
  ) async {
    switch (result) {
      case PaymentSuccess(:final txn):
        await context.push(Routes.paymentReceipt, extra: txn);
        if (context.mounted) context.pop(result);
      case PaymentInsufficientFunds():
        await showInsufficientFundsSheet(
          context,
          onTopUp: () => context.push(Routes.walletTopUp),
          onDismiss: () => ref.read(paymentFlowProvider.notifier).reset(),
        );
      case PaymentFailed():
        await showPaymentErrorSheet(
          context,
          onRetry: () => ref.read(paymentFlowProvider.notifier).reset(),
          onCancel: () => context.pop(),
        );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    ref.listen(paymentFlowProvider, (previous, next) {
      final justResolved =
          next.step == PaymentFlowStep.terminal &&
          previous?.step != PaymentFlowStep.terminal;
      final result = next.result;
      if (justResolved && result != null) {
        unawaited(_handleResult(context, ref, result));
      }
    });

    final flowState = ref.watch(paymentFlowProvider);
    final showPin = flowState.step != PaymentFlowStep.reviewing;

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.paymentConfirmAppBarTitle)),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 240),
        child: showPin
            ? PinStep(
                key: const ValueKey('pin'),
                onSubmit: (pin) => ref
                    .read(paymentFlowProvider.notifier)
                    .submitPin(pin, request),
                onCooldownCancel: () => context.pop(),
              )
            : _ReviewBody(
                key: const ValueKey('review'),
                request: request,
                onConfirm: () =>
                    ref.read(paymentFlowProvider.notifier).beginPin(),
              ),
      ),
    );
  }
}

class _ReviewBody extends StatelessWidget {
  const _ReviewBody({
    required this.request,
    required this.onConfirm,
    super.key,
  });

  final PaymentRequest request;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    final total = request.amount + request.fee;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NPCard(
          interactive: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(request.payeeName, style: textTheme.titleLarge),
              const SizedBox(height: AppSpacing.xs),
              Text(
                request.payeeSubtitle,
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.inkSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        NPCard(
          interactive: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final item in request.lineItems)
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: AppSpacing.sm,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.label,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colors.inkSecondary,
                          ),
                        ),
                      ),
                      Text(
                        item.amount.format(context),
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              const Divider(height: AppSpacing.lg),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.paymentTotalLabel,
                      style: textTheme.titleMedium,
                    ),
                  ),
                  Text(
                    total.format(context),
                    style: textTheme.titleMedium?.copyWith(
                      color: colors.accentPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        NPButton(label: l10n.paymentConfirmCta, onPressed: onConfirm),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}
