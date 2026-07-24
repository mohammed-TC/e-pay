import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router/routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/extensions/build_context_l10n.dart';
import '../../../core/models/money.dart';
import '../../../core/models/txn_type.dart';
import '../../../core/widgets/np_amount_input.dart';
import '../../../core/widgets/np_badge.dart';
import '../../../core/widgets/np_bottom_sheet.dart';
import '../../../core/widgets/np_button.dart';
import '../../../core/widgets/np_card.dart';
import '../../../core/widgets/np_empty_state.dart';
import '../../../core/widgets/np_error_state.dart';
import '../../../core/widgets/np_list_tile.dart';
import '../../../core/widgets/np_scaffold.dart';
import '../../../core/widgets/np_shimmer.dart';
import '../../../core/widgets/np_text_field.dart';
import '../../../l10n/app_localizations.dart';
import '../../payment/models/payment_request.dart';
import '../../payment/models/payment_result.dart';
import '../models/money_request.dart';
import '../models/wallet_contact.dart';
import '../providers/contacts_provider.dart';
import '../providers/money_requests_provider.dart';

/// Screen C4 — Request Money
///
/// A new request is *not* money-moving (no `PaymentRequest`, no PIN) —
/// payment-flow.md only gates flows that actually debit/credit the wallet.
/// Accepting an *incoming* request, however, pays the requester, so that
/// path does build a `PaymentRequest(type: walletSend)` and routes through
/// the shared flow like C3.
class RequestMoneyScreen extends ConsumerStatefulWidget {
  const RequestMoneyScreen({super.key});

  @override
  ConsumerState<RequestMoneyScreen> createState() => _RequestMoneyScreenState();
}

class _RequestMoneyScreenState extends ConsumerState<RequestMoneyScreen> {
  // New-request form is transient, screen-local UI state — not a payment,
  // so it doesn't warrant a dedicated autodispose provider like C2/C3's
  // money-moving forms (flutter-conventions.md's local-UI-state exception).
  WalletContact? _payer;
  String _amountDigits = '';
  String _note = '';

  Money get _amount =>
      Money(minorUnits: _amountDigits.isEmpty ? 0 : int.parse(_amountDigits));

  bool get _isValid => _payer != null && _amount.amount > 0;

  Future<void> _pickPayer(BuildContext context) async {
    final contacts = await ref.read(walletContactsProvider.future);
    if (!context.mounted) return;
    final selected = await showNPBottomSheet<WalletContact>(
      context,
      builder: (sheetContext) => _ContactPickerSheet(contacts: contacts),
    );
    if (selected != null) setState(() => _payer = selected);
  }

  void _sendRequest() {
    final payer = _payer;
    if (payer == null) return;
    unawaited(
      ref
          .read(moneyRequestsProvider.notifier)
          .add(
            MoneyRequest(
              id: 'req_${DateTime.now().microsecondsSinceEpoch}',
              direction: RequestDirection.outgoing,
              counterpartyName: payer.name,
              counterpartyContactId: payer.id,
              amount: _amount,
              note: _note,
              status: RequestStatus.pending,
              date: DateTime.now(),
            ),
          ),
    );
    setState(() {
      _payer = null;
      _amountDigits = '';
      _note = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final requestsAsync = ref.watch(moneyRequestsProvider);

    return NPScaffold(
      appBar: AppBar(title: Text(l10n.walletRequestTitle)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [
          NPCard(
            interactive: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NPListTile(
                  leading: Icon(
                    Icons.person_outline,
                    color: Theme.of(context).extension<AppColors>()!.inkPrimary,
                  ),
                  title: _payer?.name ?? l10n.walletRequestPayerPlaceholder,
                  subtitle: _payer?.mobileNumber,
                  onTap: () => unawaited(_pickPayer(context)),
                ),
                const SizedBox(height: AppSpacing.lg),
                NPAmountInput(
                  value: _amountDigits,
                  onChanged: (digits) => setState(() => _amountDigits = digits),
                ),
                const SizedBox(height: AppSpacing.lg),
                NPTextField(
                  label: l10n.walletRequestNoteLabel,
                  hint: l10n.walletRequestNoteHint,
                  onChanged: (note) => setState(() => _note = note),
                ),
                const SizedBox(height: AppSpacing.lg),
                NPButton(
                  label: l10n.walletRequestSendCta,
                  onPressed: _isValid ? _sendRequest : null,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sectionGap),
          Text(
            l10n.walletRequestPendingTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          requestsAsync.when(
            data: (requests) {
              if (requests.isEmpty) {
                return NPEmptyState(
                  title: l10n.walletRequestEmptyTitle,
                  body: l10n.walletRequestEmptyBody,
                );
              }
              return Column(
                children: [
                  for (final request in requests)
                    _PendingRequestCard(request: request),
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
              onRetry: () => ref.invalidate(moneyRequestsProvider),
              retryLabel: l10n.homeErrorRetry,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactPickerSheet extends StatelessWidget {
  const _ContactPickerSheet({required this.contacts});

  final List<WalletContact> contacts;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final contact in contacts)
          NPListTile(
            title: contact.name,
            subtitle: contact.mobileNumber,
            onTap: () => Navigator.of(context).pop(contact),
          ),
      ],
    );
  }
}

class _PendingRequestCard extends ConsumerWidget {
  const _PendingRequestCard({required this.request});

  final MoneyRequest request;

  Future<void> _accept(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final paymentRequest = PaymentRequest(
      type: TxnType.walletSend,
      payeeName: request.counterpartyName,
      payeeSubtitle: request.note,
      lineItems: [
        PaymentLineItem(
          label: l10n.walletSendAmountLabel,
          amount: request.amount,
        ),
      ],
      amount: request.amount,
      fee: Money.zero,
      meta: {'requestId': request.id},
    );
    final result = await context.push<PaymentResult>(
      Routes.paymentConfirm,
      extra: paymentRequest,
    );
    if (result is PaymentSuccess) {
      await ref
          .read(moneyRequestsProvider.notifier)
          .respond(request.id, RequestStatus.accepted);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final canRespond =
        request.direction == RequestDirection.incoming &&
        request.status == RequestStatus.pending;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: NPCard(
        interactive: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NPListTile(
              title: request.counterpartyName,
              subtitle: request.note,
              trailingAmount: request.amount,
              isPositive: request.direction == RequestDirection.incoming,
            ),
            if (canRespond) ...[
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Expanded(
                    child: NPButton(
                      label: l10n.walletRequestDecline,
                      variant: NPButtonVariant.secondary,
                      onPressed: () => unawaited(
                        ref
                            .read(moneyRequestsProvider.notifier)
                            .respond(request.id, RequestStatus.declined),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: NPButton(
                      label: l10n.walletRequestAccept,
                      onPressed: () => unawaited(_accept(context, ref)),
                    ),
                  ),
                ],
              ),
            ] else ...[
              const SizedBox(height: AppSpacing.sm),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: NPBadge(label: _statusLabel(request.status, l10n)),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _statusLabel(RequestStatus status, AppLocalizations l10n) {
    return switch (status) {
      RequestStatus.pending => l10n.walletRequestStatusPending,
      RequestStatus.accepted => l10n.walletRequestStatusAccepted,
      RequestStatus.declined => l10n.walletRequestStatusDeclined,
    };
  }
}
