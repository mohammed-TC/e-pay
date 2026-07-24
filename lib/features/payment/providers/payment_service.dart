import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/demo_constants.dart';
import '../../../core/models/txn.dart';
import '../../../core/models/txn_status.dart';
import '../../../data/repositories/history_repository.dart';
import '../../../data/repositories/rewards_repository.dart';
import '../../../data/repositories/wallet_repository.dart';
import '../../history/providers/transactions_provider.dart';
import '../../rewards/providers/rewards_provider.dart';
import '../../wallet/providers/wallet_provider.dart';
import '../models/payment_request.dart';
import '../models/payment_result.dart';

part 'payment_service.g.dart';

/// Atomic invariant (architecture.md §3): every successful payment does
/// exactly three things, and only here — (1) debit wallet, (2) append
/// transaction, (3) credit reward points. No screen implements this itself.
class PaymentService {
  PaymentService(this._ref);

  final Ref _ref;

  Future<PaymentResult> execute(PaymentRequest request) async {
    final wallet = _ref.read(walletRepositoryProvider);
    final total = request.amount + request.fee;

    if (wallet.balance < total) {
      return const PaymentResult.insufficientFunds();
    }

    wallet.debit(total);

    final rewardPoints =
        request.amount.amount.floor() * DemoConstants.rewardPointsPerOmr;
    final now = DateTime.now();
    final txn = Txn(
      id: 'txn_${now.microsecondsSinceEpoch}',
      type: request.type,
      title: request.payeeName,
      subtitle: request.payeeSubtitle,
      amount: request.amount,
      fee: request.fee,
      status: TxnStatus.success,
      date: now,
      referenceNo: 'REF${now.microsecondsSinceEpoch}',
      rewardPointsEarned: rewardPoints,
      meta: request.meta,
    );

    await _ref.read(historyRepositoryProvider).append(txn);
    _ref.read(rewardsRepositoryProvider).credit(rewardPoints);

    await _ref.read(appWalletProvider.notifier).refresh();
    await _ref.read(appTransactionsProvider.notifier).refresh();
    await _ref.read(appRewardsProvider.notifier).refresh();

    return PaymentResult.success(txn: txn);
  }
}

@Riverpod(keepAlive: true)
PaymentService paymentService(Ref ref) => PaymentService(ref);
