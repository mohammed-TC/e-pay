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
  String get homeServiceCarRental => 'Car Rental';

  @override
  String get homeServiceRewards => 'Rewards';

  @override
  String get homeServiceAiAssistant => 'Ask Emral';

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
  String get historyFilterRental => 'Rental';

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

  @override
  String get walletHomeTitle => 'Wallet';

  @override
  String get walletHomeBalanceLabel => 'Wallet balance';

  @override
  String get walletActionMyQr => 'My QR';

  @override
  String get walletMiniStatementTitle => 'Mini statement';

  @override
  String get walletViewAll => 'View all';

  @override
  String get walletStatementEmptyTitle => 'No transactions yet';

  @override
  String get walletStatementEmptyBody =>
      'Your wallet activity will show up here.';

  @override
  String get walletTopUpTitle => 'Top-up';

  @override
  String get walletTopUpAmountLabel => 'Top-up amount';

  @override
  String get walletTopUpSourceLabel => 'Pay from';

  @override
  String get walletTopUpApplePay => 'Apple Pay';

  @override
  String get walletTopUpCta => 'Top up';

  @override
  String get walletSendTitle => 'Send Money';

  @override
  String get walletSendTabMobile => 'To Mobile';

  @override
  String get walletSendTabWallet => 'To Wallet';

  @override
  String get walletSendTabBank => 'To Bank';

  @override
  String get walletSendAmountLabel => 'Amount';

  @override
  String get walletSendNoteLabel => 'Note';

  @override
  String get walletSendNoteHint => 'What\'s this for? (optional)';

  @override
  String get walletSendBankAccountNameLabel => 'Account holder name';

  @override
  String get walletSendBankAccountNameHint => 'Enter account holder name';

  @override
  String get walletSendBankIbanLabel => 'IBAN';

  @override
  String get walletSendBankIbanHint => 'Enter IBAN';

  @override
  String get walletSendCta => 'Send';

  @override
  String get walletRequestTitle => 'Request Money';

  @override
  String get walletRequestPayerPlaceholder => 'Select a contact';

  @override
  String get walletRequestNoteLabel => 'Note';

  @override
  String get walletRequestNoteHint => 'What\'s this for? (optional)';

  @override
  String get walletRequestSendCta => 'Send request';

  @override
  String get walletRequestPendingTitle => 'Pending requests';

  @override
  String get walletRequestEmptyTitle => 'No requests yet';

  @override
  String get walletRequestEmptyBody =>
      'Requests you send or receive will show up here.';

  @override
  String get walletRequestAccept => 'Accept';

  @override
  String get walletRequestDecline => 'Decline';

  @override
  String get walletRequestStatusPending => 'Pending';

  @override
  String get walletRequestStatusAccepted => 'Accepted';

  @override
  String get walletRequestStatusDeclined => 'Declined';

  @override
  String get scanTitle => 'Scan & Pay';

  @override
  String get scanCameraCta => 'Scan a QR code';

  @override
  String get scanManualLabel => 'Or enter a merchant code';

  @override
  String get scanManualHint => 'Enter merchant code';

  @override
  String get scanManualCta => 'Look up';

  @override
  String get scanCancelCamera => 'Cancel';

  @override
  String get scanPayCta => 'Pay';

  @override
  String get scanTryAnother => 'Try another code';

  @override
  String get scanUnknownMerchantName => 'Unknown merchant';

  @override
  String get walletQrTitle => 'My QR';

  @override
  String get walletQrSubtitle => 'Scan to pay or send money to me';

  @override
  String get walletQrShareCta => 'Share';

  @override
  String get walletQrShareCopied => 'QR code link copied';

  @override
  String get billCategoriesTitle => 'Bills & Recharges';

  @override
  String get billCategoryElectricity => 'Electricity';

  @override
  String get billCategoryWater => 'Water';

  @override
  String get billCategoryTelecom => 'Telecom';

  @override
  String get billCategoryInternet => 'Internet';

  @override
  String get billCategoryTvEntertainment => 'TV & Entertainment';

  @override
  String get billSmartMeterEntry => 'Smart Meter Recharge';

  @override
  String get billerSelectTitle => 'Select Provider';

  @override
  String get billerSelectEmptyTitle => 'No providers yet';

  @override
  String get billerSelectEmptyBody =>
      'There are no providers in this category right now.';

  @override
  String get accountEntryTitle => 'Add Account';

  @override
  String get accountEntryFetchByMobileLabel => 'Fetch by mobile number';

  @override
  String get accountEntryMobileLabel => 'Mobile number';

  @override
  String get accountEntryMobileHint => 'e.g. 9XXXXXXX';

  @override
  String get accountEntryAccountNumberLabel => 'Account number';

  @override
  String get accountEntryAccountNumberHint => 'Enter account number';

  @override
  String get accountEntrySaveToggleLabel => 'Save this account';

  @override
  String get accountEntryNicknameLabel => 'Nickname';

  @override
  String get accountEntryNicknameHint => 'e.g. Home Electricity';

  @override
  String get accountEntryFetchBillCta => 'Fetch Bill';

  @override
  String get savedAccountsEmptyTitle => 'No saved accounts';

  @override
  String get savedAccountsEmptyBody =>
      'Add an account to fetch and pay its bill.';

  @override
  String get savedAccountsAddCta => 'Add Account';

  @override
  String get billDetailTitle => 'Bill Detail';

  @override
  String get billDetailAmountDueLabel => 'Amount due';

  @override
  String get billDetailDueDateLabel => 'Due';

  @override
  String get billDetailViewPdfCta => 'View PDF';

  @override
  String get billDetailPayCta => 'Pay Bill';

  @override
  String get paymentMethodSectionTitle => 'Payment method';

  @override
  String get paymentMethodWallet => 'Wallet balance';

  @override
  String get paymentMethodApplePay => 'Apple Pay';

  @override
  String get paymentMethodAddCard => 'Add new card';

  @override
  String get rechargeTitle => 'Prepaid Recharge';

  @override
  String get rechargeProviderLabel => 'Select provider';

  @override
  String get rechargeCustomAmountLabel => 'Or enter a custom amount';

  @override
  String get rechargeAmountLabel => 'Recharge amount';

  @override
  String get rechargeVatLabel => 'VAT (15%)';

  @override
  String get rechargePayCta => 'Recharge Now';

  @override
  String get smartMeterTitle => 'Smart Meter Recharge';

  @override
  String get smartMeterNumberLabel => 'Meter number';

  @override
  String get smartMeterNumberHint => 'Enter meter number';

  @override
  String get smartMeterFetchCta => 'Fetch Charge';

  @override
  String get smartMeterTotalLabel => 'Total';

  @override
  String get smartMeterPayCta => 'Pay Now';

  @override
  String get chatScreenTitle => 'Ask Emral';

  @override
  String get chatFabSemanticLabel => 'Open Ask Emral chat';

  @override
  String get chatInputHint => 'Ask about bills, balance, rewards…';

  @override
  String get chatVoiceComingSoon => 'Voice input coming soon';

  @override
  String get chatPayNowCta => 'Pay now';

  @override
  String get chatReviewAndPayCta => 'Review & pay';

  @override
  String get chatWalletSummaryLabel => 'Available balance';

  @override
  String get chatQuickReplyBills => 'Show my bills';

  @override
  String get chatQuickReplyBalance => 'Wallet balance';

  @override
  String get chatQuickReplyRewards => 'My rewards';

  @override
  String get chatQuickReplyTxns => 'Recent transactions';

  @override
  String get chatErrorTitle => 'Couldn\'t load chat';

  @override
  String get chatErrorBody => 'Something went wrong loading Ask Emral.';

  @override
  String get chatErrorRetry => 'Retry';

  @override
  String get chatReplyGreeting =>
      'Hi! I\'m Emral, your money assistant. Ask me about bills, your wallet, or rewards.';

  @override
  String get chatReplyHelp =>
      'I can check bills due, your wallet balance, reward points, recent transactions, or help you pay a bill or send money.';

  @override
  String get chatReplyFallback =>
      'I didn\'t quite catch that. Try asking about bills, balance, or rewards — or tap a suggestion below.';

  @override
  String get chatReplyWalletBalanceIntro => 'Here\'s your wallet balance:';

  @override
  String get chatReplyRewardsIntro => 'Here\'s where your rewards stand:';

  @override
  String get chatReplyNoTxns => 'You don\'t have any transactions yet.';

  @override
  String chatReplyTxnLine(String title, String amount) {
    return '$title — $amount';
  }

  @override
  String chatReplyRecentTxnsIntro(String lines) {
    return 'Here are your recent transactions:\n$lines';
  }

  @override
  String get chatReplyNoBills =>
      'You don\'t have any saved billers yet. Add one from Bills to get reminders here.';

  @override
  String get chatReplyBillsDueIntro => 'Here\'s what\'s due:';

  @override
  String get chatReplyPayBillNotFound =>
      'I couldn\'t find that biller in your saved accounts. Try naming one, like \"pay VoltGrid\".';

  @override
  String chatReplyPayBillFound(String accountNickname) {
    return 'Found it — here\'s $accountNickname:';
  }

  @override
  String chatReplySendMoneyFound(String contactName) {
    return 'Here\'s a quick send to $contactName:';
  }

  @override
  String get chatReplySendMoneyNotFound =>
      'I couldn\'t find that contact. Try naming a saved contact, like \"send to Aisha\".';

  @override
  String chatSendMoneyCardTitle(String contactName) {
    return 'Send to $contactName';
  }

  @override
  String chatBillDueBadge(int days) {
    return 'Due in $days days';
  }

  @override
  String chatBillDueSoonBadge(int days) {
    return 'Due in $days days';
  }

  @override
  String chatRewardsPointsLabel(int points) {
    return '$points points';
  }

  @override
  String chatRewardsThresholdLabel(int threshold) {
    return '$threshold points to redeem';
  }

  @override
  String chatPaymentCompletedAck(String payeeName) {
    return 'Payment successful. Your $payeeName bill has been paid.';
  }

  @override
  String get chatAnythingElsePrompt =>
      'Is there anything else you\'d like to pay today? Bills, wallet transfers, or rewards?';

  @override
  String chatVehicleRenewalNudge(String plateNumber, String expiryDate) {
    return 'I noticed your vehicle registration ($plateNumber) expires on $expiryDate. Renewing now can help you avoid a lapse. Would you like to see the renewal now?';
  }

  @override
  String get chatVehicleRenewalReminderSet =>
      'No problem. I\'ve set a reminder for next week.';

  @override
  String chatVehicleRenewalOfferAccept(String plateNumber) {
    return 'Sure — here\'s the renewal for $plateNumber:';
  }

  @override
  String chatVehicleRenewalCardTitle(String plateNumber) {
    return 'Renew registration — $plateNumber';
  }

  @override
  String get chatVehicleRenewalCardSubtitle => 'Vehicle registration renewal';

  @override
  String get chatVehicleRenewalFeeLabel => 'Renewal fee';

  @override
  String get chatAutoPayPitchIntro =>
      'Before you go, would you like to enrol in AutoPay for future bills on this account? It helps avoid late payment charges.';

  @override
  String get chatAutoPayExplain =>
      'AutoPay automatically pays this bill on the due date using your wallet balance. You stay in control and can cancel anytime. Would you like to enable it?';

  @override
  String get chatAutoPayEnabled => 'Done! AutoPay is now active.';

  @override
  String get chatAutoPayDeclined => 'No problem, AutoPay stays off for now.';

  @override
  String get rentalSearchTitle => 'Rental Search';

  @override
  String get rentalSearchLocationLabel => 'Pickup location';

  @override
  String get rentalSearchLocationPlaceholder => 'Select pickup location';

  @override
  String get rentalSearchPickupLabel => 'Pickup date';

  @override
  String get rentalSearchReturnLabel => 'Return date';

  @override
  String get rentalSearchDatePlaceholder => 'Select date';

  @override
  String get rentalSearchTimeMorning => 'Morning';

  @override
  String get rentalSearchTimeEvening => 'Evening';

  @override
  String get rentalSearchCta => 'Search';

  @override
  String get rentalResultsTitle => 'Vehicle Results';

  @override
  String rentalResultsTripLabel(int days) {
    return '$days-day trip';
  }

  @override
  String get rentalResultsRewardsBannerTitle => 'Use your rewards';

  @override
  String rentalResultsRewardsBannerBody(int points, String value) {
    return 'You have $points PayHub Rewards Points, worth $value towards this booking.';
  }

  @override
  String get rentalResultsRewardsBadge => 'Redeemable';

  @override
  String get rentalResultsEmptyTitle => 'No vehicles available';

  @override
  String get rentalResultsEmptyBody =>
      'Try different dates or a different pickup location.';

  @override
  String get rentalDetailTitle => 'Vehicle & Extras';

  @override
  String rentalDetailSpecsSeats(int count) {
    return '$count seats';
  }

  @override
  String rentalDetailSpecsBags(int count) {
    return '$count bags';
  }

  @override
  String get rentalDetailRedeemPointsTitle => 'Redeem reward points';

  @override
  String rentalDetailRedeemPointsBody(int points) {
    return '$points pts available';
  }

  @override
  String get rentalDetailAddonsTitle => 'Add-ons';

  @override
  String get rentalDetailContinueCta => 'Continue';

  @override
  String get rentalAddonDoublePoints => '2× points';

  @override
  String get rentalReviewTitle => 'Booking Review';

  @override
  String get rentalReviewRentalCostLabel => 'Rental cost';

  @override
  String get rentalReviewAddonsCostLabel => 'Add-ons';

  @override
  String get rentalReviewPointsDiscountLabel => 'Rewards discount';

  @override
  String get rentalReviewEarnedPointsLabel => 'You\'ll earn';

  @override
  String rentalReviewEarnedPointsValue(int points) {
    return '$points pts';
  }

  @override
  String get rentalReviewConfirmCta => 'Confirm & Pay';

  @override
  String get rentalMyRentalsTitle => 'My Rentals';

  @override
  String get rentalMyRentalsEmptyTitle => 'No rentals yet';

  @override
  String get rentalMyRentalsEmptyBody => 'Book a car to see it here.';

  @override
  String get rentalMyRentalsEmptyCta => 'Rent a car';
}
