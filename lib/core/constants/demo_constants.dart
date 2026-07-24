import '../models/money.dart';

/// Fixed demo-mode values — product.md §6, CLAUDE.md "Demo constants".
abstract final class DemoConstants {
  static const String mockOtp = '123456';
  static const String currencyCode = 'OMR';

  static final Money seedWalletBalance = Money.fromAmount(
    250,
    currencyCode: currencyCode,
  );

  static const int rewardPointsPerOmr = 1;
  static const int rewardRedemptionThreshold = 500;
  static const int seedRewardPoints = 320;
}
