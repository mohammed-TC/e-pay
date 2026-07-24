import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/money.dart';
import '../../../core/models/txn_type.dart';
import '../../../core/widgets/np_amount_input.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../../../core/widgets/np_text_field.dart';
import '../../payment/models/payment_request.dart';
import '../../payment/models/payment_result.dart';
import '../models/merchant.dart';
import '../providers/merchant_lookup_provider.dart';

/// Screen C5 — Scan & Pay
///
/// Manual code entry is the default view (works on devices/emulators with
/// no camera); "Scan a QR code" reveals the camera. A resolved code builds
/// a `PaymentRequest(type: qrPay)` and routes through the shared payment
/// flow (payment-flow.md) — never its own confirm/PIN/receipt.
class ScanPayScreen extends ConsumerStatefulWidget {
  const ScanPayScreen({super.key});

  @override
  ConsumerState<ScanPayScreen> createState() => _ScanPayScreenState();
}

class _ScanPayScreenState extends ConsumerState<ScanPayScreen> {
  bool _showCamera = false;
  String _manualCode = '';
  String? _resolvingCode;
  String _amountDigits = '';
  MobileScannerController? _controller;

  @override
  void dispose() {
    final controller = _controller;
    if (controller != null) unawaited(controller.dispose());
    super.dispose();
  }

  void _toggleCamera(bool show) {
    final previous = _controller;
    setState(() {
      _showCamera = show;
      _controller = show ? MobileScannerController() : null;
    });
    if (previous != null) unawaited(previous.dispose());
  }

  void _resolve(String code) {
    if (code.isEmpty) return;
    _toggleCamera(false);
    setState(() {
      _resolvingCode = code;
      _amountDigits = '';
    });
  }

  void _reset() {
    setState(() {
      _resolvingCode = null;
      _manualCode = '';
      _amountDigits = '';
    });
  }

  Future<void> _pay(Merchant? merchant, String code) async {
    final l10n = context.l10n;
    final amount =
        merchant?.fixedAmount ??
        Money(minorUnits: _amountDigits.isEmpty ? 0 : int.parse(_amountDigits));
    final request = PaymentRequest(
      type: TxnType.qrPay,
      payeeName: merchant?.name ?? l10n.scanUnknownMerchantName,
      payeeSubtitle: merchant?.category ?? code,
      lineItems: [
        PaymentLineItem(label: l10n.walletSendAmountLabel, amount: amount),
      ],
      amount: amount,
      fee: Money.zero,
      meta: {'qrCode': code},
    );
    final result = await context.push<PaymentResult>(
      Routes.paymentConfirm,
      extra: request,
    );
    if (result is PaymentSuccess && mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final resolvingCode = _resolvingCode;

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.scanTitle)),
      body: resolvingCode != null
          ? _MerchantConfirm(
              code: resolvingCode,
              amountDigits: _amountDigits,
              onAmountChanged: (digits) =>
                  setState(() => _amountDigits = digits),
              onBack: _reset,
              onPay: _pay,
            )
          : _showCamera
          ? _CameraView(
              controller: _controller!,
              onDetect: _resolve,
              onCancel: () => _toggleCamera(false),
            )
          : _ManualEntry(
              value: _manualCode,
              onChanged: (value) => setState(() => _manualCode = value),
              onSubmit: () => _resolve(_manualCode),
              onScanTap: () => _toggleCamera(true),
            ),
    );
  }
}

class _ManualEntry extends StatelessWidget {
  const _ManualEntry({
    required this.value,
    required this.onChanged,
    required this.onSubmit,
    required this.onScanTap,
  });

  final String value;
  final ValueChanged<String> onChanged;
  final VoidCallback onSubmit;
  final VoidCallback onScanTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        NPCard(
          onTap: onScanTap,
          child: Row(
            children: [
              Icon(
                Icons.qr_code_scanner_outlined,
                color: Theme.of(context).extension<AppColors>()!.accentPrimary,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  l10n.scanCameraCta,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sectionGap),
        Text(
          l10n.scanManualLabel,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: AppSpacing.sm),
        NPTextField(hint: l10n.scanManualHint, onChanged: onChanged),
        const SizedBox(height: AppSpacing.lg),
        NPButton(
          label: l10n.scanManualCta,
          onPressed: value.isNotEmpty ? onSubmit : null,
        ),
      ],
    );
  }
}

class _CameraView extends StatelessWidget {
  const _CameraView({
    required this.controller,
    required this.onDetect,
    required this.onCancel,
  });

  final MobileScannerController controller;
  final ValueChanged<String> onDetect;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.card),
            child: Stack(
              fit: StackFit.expand,
              children: [
                MobileScanner(
                  controller: controller,
                  onDetect: (capture) {
                    final rawValue = capture.barcodes
                        .map((b) => b.rawValue)
                        .whereType<String>()
                        .firstOrNull;
                    if (rawValue != null) onDetect(rawValue);
                  },
                ),
                IgnorePointer(
                  child: Center(
                    child: Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(AppRadius.card),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        NPButton(
          label: l10n.scanCancelCamera,
          variant: NPButtonVariant.secondary,
          onPressed: onCancel,
        ),
      ],
    );
  }
}

class _MerchantConfirm extends ConsumerWidget {
  const _MerchantConfirm({
    required this.code,
    required this.amountDigits,
    required this.onAmountChanged,
    required this.onBack,
    required this.onPay,
  });

  final String code;
  final String amountDigits;
  final ValueChanged<String> onAmountChanged;
  final VoidCallback onBack;
  final void Function(Merchant? merchant, String code) onPay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final merchantAsync = ref.watch(merchantLookupProvider(code));

    return merchantAsync.when(
      data: (merchant) {
        final hasFixedAmount = merchant?.fixedAmount != null;
        final amount = merchant?.fixedAmount != null
            ? merchant!.fixedAmount!
            : Money(
                minorUnits: amountDigits.isEmpty ? 0 : int.parse(amountDigits),
              );
        final canPay = amount.amount > 0;

        return ListView(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
          children: [
            NPCard(
              interactive: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    merchant?.name ?? l10n.scanUnknownMerchantName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    merchant?.category ?? code,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).extension<AppColors>()!.inkSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sectionGap),
            if (hasFixedAmount)
              Text(
                amount.format(context),
                style: Theme.of(context).textTheme.displayLarge,
              )
            else
              NPAmountInput(value: amountDigits, onChanged: onAmountChanged),
            const SizedBox(height: AppSpacing.sectionGap),
            NPButton(
              label: l10n.scanPayCta,
              onPressed: canPay ? () => onPay(merchant, code) : null,
            ),
            const SizedBox(height: AppSpacing.sm),
            NPButton(
              label: l10n.scanTryAnother,
              variant: NPButtonVariant.ghost,
              onPressed: onBack,
            ),
          ],
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
        child: NPShimmer.card(height: 120),
      ),
      error: (error, stackTrace) => NPErrorState(
        title: l10n.homeErrorTitle,
        body: l10n.homeErrorBody,
        onRetry: () => ref.invalidate(merchantLookupProvider(code)),
        retryLabel: l10n.homeErrorRetry,
      ),
    );
  }
}
