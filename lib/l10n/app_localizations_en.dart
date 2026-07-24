// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Emral Pay';

  @override
  String get splashTagline => 'Your money, in one place.';

  @override
  String get galleryDebugLaunch => 'Design system gallery (dev)';

  @override
  String get galleryTitle => 'Design system gallery';

  @override
  String get galleryToggleTheme => 'Toggle theme';

  @override
  String get galleryToggleLanguage => 'Toggle language';

  @override
  String get gallerySectionButtons => 'Buttons';

  @override
  String get gallerySectionCards => 'Cards';

  @override
  String get gallerySectionInputs => 'Inputs';

  @override
  String get gallerySectionListsAndTags => 'Lists & tags';

  @override
  String get gallerySectionStates => 'States';

  @override
  String get gallerySectionFeature => 'Feature widgets';

  @override
  String get galleryButtonPrimary => 'Primary';

  @override
  String get galleryButtonSecondary => 'Secondary';

  @override
  String get galleryButtonGhost => 'Ghost';

  @override
  String get galleryButtonLoading => 'Loading';

  @override
  String get galleryCardStatic => 'Static card';

  @override
  String get galleryCardInteractive => 'Tap me';

  @override
  String get galleryTextFieldLabel => 'Mobile number';

  @override
  String get galleryTextFieldHint => 'e.g. 9123 4567';

  @override
  String get galleryTextFieldError => 'Enter a valid number';

  @override
  String get galleryOtpLabel => 'One-time code';

  @override
  String get galleryPinLabel => 'Enter PIN';

  @override
  String get galleryListTileTitle => 'Electricity bill';

  @override
  String get galleryListTileSubtitle => 'Due in 3 days';

  @override
  String get galleryBadgeLabel => 'New';

  @override
  String get galleryChipUnselected => 'All';

  @override
  String get galleryChipSelected => 'Bills';

  @override
  String get gallerySegmentHome => 'Home';

  @override
  String get gallerySegmentHistory => 'History';

  @override
  String get gallerySegmentRewards => 'Rewards';

  @override
  String get galleryShimmerLabel => 'Loading state';

  @override
  String get galleryEmptyTitle => 'No saved accounts yet';

  @override
  String get galleryEmptyBody => 'Add one to pay in two taps.';

  @override
  String get galleryEmptyCta => 'Add account';

  @override
  String get galleryErrorTitle => 'Couldn\'t load data';

  @override
  String get galleryErrorBody => 'Check your connection and try again.';

  @override
  String get galleryErrorRetry => 'Retry';

  @override
  String get galleryBalanceLabel => 'Available balance';

  @override
  String get galleryTimelineStep1 => 'Sent';

  @override
  String get galleryTimelineStep2 => 'Processing';

  @override
  String get galleryTimelineStep3 => 'Delivered';

  @override
  String get gallerySuccessTitle => 'Paid!';

  @override
  String get gallerySuccessDone => 'Done';

  @override
  String get galleryShowSuccess => 'Show success';

  @override
  String get languageSelectTitle => 'Choose your language';

  @override
  String get languageSelectSubtitle =>
      'You can change this anytime in settings.';

  @override
  String get languageSelectEnglishLabel => 'English';

  @override
  String get languageSelectArabicLabel => 'العربية';

  @override
  String get languageSelectContinue => 'Continue';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingGetStarted => 'Get started';

  @override
  String get onboardingSlideWalletHeadline => 'Wallet';

  @override
  String get onboardingSlideWalletBody =>
      'Send, receive, and top up money instantly — all from one place.';

  @override
  String get onboardingSlideBillsHeadline => 'Bills';

  @override
  String get onboardingSlideBillsBody =>
      'Pay electricity, water, and telecom bills in seconds.';

  @override
  String get onboardingSlideRewardsHeadline => 'Rewards';

  @override
  String get onboardingSlideRewardsBody =>
      'Earn points on every payment and redeem them for real value.';

  @override
  String get loginTitle => 'Welcome to Emral Pay';

  @override
  String get loginSubtitle => 'Enter your mobile number to continue';

  @override
  String get loginMobileLabel => 'Mobile number';

  @override
  String get loginMobileHint => '9123 4567';

  @override
  String get loginMobileError => 'Enter a valid mobile number';

  @override
  String get loginCountryCode => '+968';

  @override
  String get loginContinue => 'Continue';

  @override
  String get otpTitle => 'Verification code';

  @override
  String get otpSentToPrefix => 'Enter the 6-digit code sent to';

  @override
  String get otpIncorrectCode => 'Incorrect code, try again';

  @override
  String get otpResendCountdownLabel => 'Resend in';

  @override
  String get otpResendSecondsSuffix => 's';

  @override
  String get otpResendAction => 'Resend';

  @override
  String get profileSetupTitle => 'Set up your profile';

  @override
  String get profileSetupSubtitle => 'Tell us a bit about yourself';

  @override
  String get profileSetupAvatarDemoMessage =>
      'Photo upload isn\'t available in this demo';

  @override
  String get profileSetupAvatarUploadLabel => 'Add profile photo';

  @override
  String get profileSetupNameLabel => 'Full name';

  @override
  String get profileSetupNameHint => 'e.g. Ahmed Al Balushi';

  @override
  String get profileSetupNameError => 'Enter your full name';

  @override
  String get profileSetupEmailLabel => 'Email (optional)';

  @override
  String get profileSetupEmailHint => 'you@example.com';

  @override
  String get profileSetupEmailError => 'Enter a valid email address';

  @override
  String get profileSetupContinue => 'Continue';

  @override
  String get pinSetupCreateTitle => 'Create your PIN';

  @override
  String get pinSetupCreateSubtitle =>
      'You\'ll use this PIN to confirm payments';

  @override
  String get pinSetupConfirmTitle => 'Confirm your PIN';

  @override
  String get pinSetupConfirmSubtitle => 'Re-enter the PIN to confirm';

  @override
  String get pinSetupMismatch => 'PINs didn\'t match, try again';

  @override
  String pinSetupProgressLabel(int filled, int length) {
    return 'PIN entry, $filled of $length digits entered';
  }

  @override
  String get biometricEnableTitle => 'Enable biometric login';

  @override
  String get biometricEnableBody =>
      'Use your fingerprint or face to sign in faster next time.';

  @override
  String get biometricEnableCta => 'Enable';

  @override
  String get biometricEnableSkip => 'Skip';

  @override
  String get navHome => 'Home';

  @override
  String get navHistory => 'History';

  @override
  String get navRewards => 'Rewards';

  @override
  String get navProfile => 'Profile';

  @override
  String get homeAvailableBalance => 'Available balance';

  @override
  String get homeErrorTitle => 'Couldn\'t load';

  @override
  String get homeErrorBody => 'Something went wrong. Please try again.';

  @override
  String get homeErrorRetry => 'Retry';

  @override
  String get homeQuickActionTopUp => 'Top-up';

  @override
  String get homeQuickActionSend => 'Send';

  @override
  String get homeQuickActionScan => 'Scan';

  @override
  String get homeQuickActionRequest => 'Request';

  @override
  String get homeDebugTestPayment => 'Debug: test payment';

  @override
  String get homeServicesSectionTitle => 'Services';

  @override
  String get homeServiceBills => 'Bills';

  @override
  String get homeServiceRecharge => 'Recharge';

  @override
  String get homeServiceGovernment => 'Government';

  @override
  String get homeServiceInsurance => 'Insurance';

  @override
  String get homeServiceEducation => 'Education';

  @override
  String get homeServiceRemittance => 'Remittance';

  @override
  String get homeServiceRewards => 'Rewards';

  @override
  String get homeServiceMore => 'More';

  @override
  String get homePromoTitle1 => 'Send money instantly';

  @override
  String get homePromoBody1 => 'Zero fees to any Emral Pay wallet.';

  @override
  String get homePromoTitle2 => 'Earn rewards on every bill';

  @override
  String get homePromoBody2 => '1 point for every 1 OMR you pay.';

  @override
  String get homePromoTitle3 => 'Track your remittances';

  @override
  String get homePromoBody3 => 'Real-time status from send to delivery.';

  @override
  String get homeRecentTransactionsTitle => 'Recent transactions';

  @override
  String get homeViewAll => 'View all';

  @override
  String get homeRecentEmptyTitle => 'No transactions yet';

  @override
  String get homeRecentEmptyBody => 'Your recent activity will show up here.';

  @override
  String get homeRewardsPointsSuffix => 'pts';

  @override
  String get paymentConfirmAppBarTitle => 'Review payment';

  @override
  String get paymentConfirmCta => 'Confirm & Pay';

  @override
  String get paymentTotalLabel => 'Total';

  @override
  String get paymentPinTitle => 'Enter your PIN';

  @override
  String paymentPinAttemptsRemaining(int count) {
    return '$count attempts left';
  }

  @override
  String get paymentPinCooldownMessage =>
      'Too many attempts. Please try again later.';

  @override
  String get paymentProcessingLabel => 'Processing your payment…';

  @override
  String get paymentCancelCta => 'Cancel';

  @override
  String get paymentReceiptTitle => 'Payment successful';

  @override
  String get paymentReceiptDone => 'Done';

  @override
  String get paymentReceiptReferenceLabel => 'Reference no.';

  @override
  String get paymentErrorSheetTitle => 'Something went wrong';

  @override
  String get paymentErrorSheetBody =>
      'We couldn\'t process your payment. Please try again.';

  @override
  String get paymentErrorSheetRetry => 'Retry';

  @override
  String get paymentInsufficientFundsTitle => 'Insufficient balance';

  @override
  String get paymentInsufficientFundsBody =>
      'Your wallet balance isn\'t enough to complete this payment.';

  @override
  String get paymentInsufficientFundsTopUp => 'Top up wallet';

  @override
  String get historyTitle => 'Transaction History';

  @override
  String get historyFilterAll => 'All';

  @override
  String get historyFilterBills => 'Bills';

  @override
  String get historyFilterRecharge => 'Recharge';

  @override
  String get historyFilterGovernment => 'Government';

  @override
  String get historyFilterWallet => 'Wallet';

  @override
  String get historyFilterRemittance => 'Remittance';

  @override
  String get historyStatusAll => 'All statuses';

  @override
  String get historyStatusSuccess => 'Success';

  @override
  String get historyStatusPending => 'Pending';

  @override
  String get historyStatusFailed => 'Failed';

  @override
  String get historyErrorTitle => 'Couldn\'t load history';

  @override
  String get historyErrorBody => 'Check your connection and try again.';

  @override
  String get historyErrorRetry => 'Retry';

  @override
  String get historyEmptyTitle => 'No transactions yet';

  @override
  String get historyEmptyBody => 'Your payments will show up here.';

  @override
  String get historyEmptyFilteredTitle => 'No matching transactions';

  @override
  String get historyEmptyFilteredBody => 'Try a different filter.';

  @override
  String get txnDetailTitle => 'Transaction Detail';

  @override
  String get txnDetailAmountLabel => 'Amount';

  @override
  String get txnDetailFeeLabel => 'Fee';

  @override
  String get txnDetailTotalLabel => 'Total';

  @override
  String get txnDetailDateLabel => 'Date';

  @override
  String get txnDetailReferenceLabel => 'Reference number';

  @override
  String get txnDetailRewardPointsLabel => 'Reward points earned';

  @override
  String get txnDetailRedownloadReceipt => 'Re-download receipt';
}
