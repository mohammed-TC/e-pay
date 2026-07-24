import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// App display name, shown on Splash (Screen A1).
  ///
  /// In en, this message translates to:
  /// **'Emral Pay'**
  String get appTitle;

  /// Splash screen (A1) tagline shown under the logo.
  ///
  /// In en, this message translates to:
  /// **'Your money, in one place.'**
  String get splashTagline;

  /// Debug-only button on Splash, removed before release (Phase 9).
  ///
  /// In en, this message translates to:
  /// **'Design system gallery (dev)'**
  String get galleryDebugLaunch;

  /// No description provided for @galleryTitle.
  ///
  /// In en, this message translates to:
  /// **'Design system gallery'**
  String get galleryTitle;

  /// No description provided for @galleryToggleTheme.
  ///
  /// In en, this message translates to:
  /// **'Toggle theme'**
  String get galleryToggleTheme;

  /// No description provided for @galleryToggleLanguage.
  ///
  /// In en, this message translates to:
  /// **'Toggle language'**
  String get galleryToggleLanguage;

  /// No description provided for @gallerySectionButtons.
  ///
  /// In en, this message translates to:
  /// **'Buttons'**
  String get gallerySectionButtons;

  /// No description provided for @gallerySectionCards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get gallerySectionCards;

  /// No description provided for @gallerySectionInputs.
  ///
  /// In en, this message translates to:
  /// **'Inputs'**
  String get gallerySectionInputs;

  /// No description provided for @gallerySectionListsAndTags.
  ///
  /// In en, this message translates to:
  /// **'Lists & tags'**
  String get gallerySectionListsAndTags;

  /// No description provided for @gallerySectionStates.
  ///
  /// In en, this message translates to:
  /// **'States'**
  String get gallerySectionStates;

  /// No description provided for @gallerySectionFeature.
  ///
  /// In en, this message translates to:
  /// **'Feature widgets'**
  String get gallerySectionFeature;

  /// No description provided for @galleryButtonPrimary.
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get galleryButtonPrimary;

  /// No description provided for @galleryButtonSecondary.
  ///
  /// In en, this message translates to:
  /// **'Secondary'**
  String get galleryButtonSecondary;

  /// No description provided for @galleryButtonGhost.
  ///
  /// In en, this message translates to:
  /// **'Ghost'**
  String get galleryButtonGhost;

  /// No description provided for @galleryButtonLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get galleryButtonLoading;

  /// No description provided for @galleryCardStatic.
  ///
  /// In en, this message translates to:
  /// **'Static card'**
  String get galleryCardStatic;

  /// No description provided for @galleryCardInteractive.
  ///
  /// In en, this message translates to:
  /// **'Tap me'**
  String get galleryCardInteractive;

  /// No description provided for @galleryTextFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get galleryTextFieldLabel;

  /// No description provided for @galleryTextFieldHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 9123 4567'**
  String get galleryTextFieldHint;

  /// No description provided for @galleryTextFieldError.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid number'**
  String get galleryTextFieldError;

  /// No description provided for @galleryOtpLabel.
  ///
  /// In en, this message translates to:
  /// **'One-time code'**
  String get galleryOtpLabel;

  /// No description provided for @galleryPinLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter PIN'**
  String get galleryPinLabel;

  /// No description provided for @galleryListTileTitle.
  ///
  /// In en, this message translates to:
  /// **'Electricity bill'**
  String get galleryListTileTitle;

  /// No description provided for @galleryListTileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Due in 3 days'**
  String get galleryListTileSubtitle;

  /// No description provided for @galleryBadgeLabel.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get galleryBadgeLabel;

  /// No description provided for @galleryChipUnselected.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get galleryChipUnselected;

  /// No description provided for @galleryChipSelected.
  ///
  /// In en, this message translates to:
  /// **'Bills'**
  String get galleryChipSelected;

  /// No description provided for @gallerySegmentHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get gallerySegmentHome;

  /// No description provided for @gallerySegmentHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get gallerySegmentHistory;

  /// No description provided for @gallerySegmentRewards.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get gallerySegmentRewards;

  /// No description provided for @galleryShimmerLabel.
  ///
  /// In en, this message translates to:
  /// **'Loading state'**
  String get galleryShimmerLabel;

  /// No description provided for @galleryEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No saved accounts yet'**
  String get galleryEmptyTitle;

  /// No description provided for @galleryEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Add one to pay in two taps.'**
  String get galleryEmptyBody;

  /// No description provided for @galleryEmptyCta.
  ///
  /// In en, this message translates to:
  /// **'Add account'**
  String get galleryEmptyCta;

  /// No description provided for @galleryErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load data'**
  String get galleryErrorTitle;

  /// No description provided for @galleryErrorBody.
  ///
  /// In en, this message translates to:
  /// **'Check your connection and try again.'**
  String get galleryErrorBody;

  /// No description provided for @galleryErrorRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get galleryErrorRetry;

  /// No description provided for @galleryBalanceLabel.
  ///
  /// In en, this message translates to:
  /// **'Available balance'**
  String get galleryBalanceLabel;

  /// No description provided for @galleryTimelineStep1.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get galleryTimelineStep1;

  /// No description provided for @galleryTimelineStep2.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get galleryTimelineStep2;

  /// No description provided for @galleryTimelineStep3.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get galleryTimelineStep3;

  /// No description provided for @gallerySuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Paid!'**
  String get gallerySuccessTitle;

  /// No description provided for @gallerySuccessDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get gallerySuccessDone;

  /// No description provided for @galleryShowSuccess.
  ///
  /// In en, this message translates to:
  /// **'Show success'**
  String get galleryShowSuccess;

  /// No description provided for @languageSelectTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get languageSelectTitle;

  /// No description provided for @languageSelectSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You can change this anytime in settings.'**
  String get languageSelectSubtitle;

  /// No description provided for @languageSelectEnglishLabel.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageSelectEnglishLabel;

  /// No description provided for @languageSelectArabicLabel.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get languageSelectArabicLabel;

  /// No description provided for @languageSelectContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get languageSelectContinue;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingGetStarted;

  /// No description provided for @onboardingSlideWalletHeadline.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get onboardingSlideWalletHeadline;

  /// No description provided for @onboardingSlideWalletBody.
  ///
  /// In en, this message translates to:
  /// **'Send, receive, and top up money instantly — all from one place.'**
  String get onboardingSlideWalletBody;

  /// No description provided for @onboardingSlideBillsHeadline.
  ///
  /// In en, this message translates to:
  /// **'Bills'**
  String get onboardingSlideBillsHeadline;

  /// No description provided for @onboardingSlideBillsBody.
  ///
  /// In en, this message translates to:
  /// **'Pay electricity, water, and telecom bills in seconds.'**
  String get onboardingSlideBillsBody;

  /// No description provided for @onboardingSlideRewardsHeadline.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get onboardingSlideRewardsHeadline;

  /// No description provided for @onboardingSlideRewardsBody.
  ///
  /// In en, this message translates to:
  /// **'Earn points on every payment and redeem them for real value.'**
  String get onboardingSlideRewardsBody;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Emral Pay'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number to continue'**
  String get loginSubtitle;

  /// No description provided for @loginMobileLabel.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get loginMobileLabel;

  /// No description provided for @loginMobileHint.
  ///
  /// In en, this message translates to:
  /// **'9123 4567'**
  String get loginMobileHint;

  /// No description provided for @loginMobileError.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid mobile number'**
  String get loginMobileError;

  /// No description provided for @loginCountryCode.
  ///
  /// In en, this message translates to:
  /// **'+968'**
  String get loginCountryCode;

  /// No description provided for @loginContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get loginContinue;

  /// No description provided for @otpTitle.
  ///
  /// In en, this message translates to:
  /// **'Verification code'**
  String get otpTitle;

  /// No description provided for @otpSentToPrefix.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code sent to'**
  String get otpSentToPrefix;

  /// No description provided for @otpIncorrectCode.
  ///
  /// In en, this message translates to:
  /// **'Incorrect code, try again'**
  String get otpIncorrectCode;

  /// No description provided for @otpResendCountdownLabel.
  ///
  /// In en, this message translates to:
  /// **'Resend in'**
  String get otpResendCountdownLabel;

  /// No description provided for @otpResendSecondsSuffix.
  ///
  /// In en, this message translates to:
  /// **'s'**
  String get otpResendSecondsSuffix;

  /// No description provided for @otpResendAction.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get otpResendAction;

  /// No description provided for @profileSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Set up your profile'**
  String get profileSetupTitle;

  /// No description provided for @profileSetupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tell us a bit about yourself'**
  String get profileSetupSubtitle;

  /// No description provided for @profileSetupAvatarDemoMessage.
  ///
  /// In en, this message translates to:
  /// **'Photo upload isn\'t available in this demo'**
  String get profileSetupAvatarDemoMessage;

  /// No description provided for @profileSetupAvatarUploadLabel.
  ///
  /// In en, this message translates to:
  /// **'Add profile photo'**
  String get profileSetupAvatarUploadLabel;

  /// No description provided for @profileSetupNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get profileSetupNameLabel;

  /// No description provided for @profileSetupNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Ahmed Al Balushi'**
  String get profileSetupNameHint;

  /// No description provided for @profileSetupNameError.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get profileSetupNameError;

  /// No description provided for @profileSetupEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email (optional)'**
  String get profileSetupEmailLabel;

  /// No description provided for @profileSetupEmailHint.
  ///
  /// In en, this message translates to:
  /// **'you@example.com'**
  String get profileSetupEmailHint;

  /// No description provided for @profileSetupEmailError.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get profileSetupEmailError;

  /// No description provided for @profileSetupContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get profileSetupContinue;

  /// No description provided for @pinSetupCreateTitle.
  ///
  /// In en, this message translates to:
  /// **'Create your PIN'**
  String get pinSetupCreateTitle;

  /// No description provided for @pinSetupCreateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You\'ll use this PIN to confirm payments'**
  String get pinSetupCreateSubtitle;

  /// No description provided for @pinSetupConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm your PIN'**
  String get pinSetupConfirmTitle;

  /// No description provided for @pinSetupConfirmSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Re-enter the PIN to confirm'**
  String get pinSetupConfirmSubtitle;

  /// No description provided for @pinSetupMismatch.
  ///
  /// In en, this message translates to:
  /// **'PINs didn\'t match, try again'**
  String get pinSetupMismatch;

  /// Screen-reader label announcing how many PIN digits have been entered.
  ///
  /// In en, this message translates to:
  /// **'PIN entry, {filled} of {length} digits entered'**
  String pinSetupProgressLabel(int filled, int length);

  /// No description provided for @biometricEnableTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable biometric login'**
  String get biometricEnableTitle;

  /// No description provided for @biometricEnableBody.
  ///
  /// In en, this message translates to:
  /// **'Use your fingerprint or face to sign in faster next time.'**
  String get biometricEnableBody;

  /// No description provided for @biometricEnableCta.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get biometricEnableCta;

  /// No description provided for @biometricEnableSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get biometricEnableSkip;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get navHistory;

  /// No description provided for @navRewards.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get navRewards;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @homeAvailableBalance.
  ///
  /// In en, this message translates to:
  /// **'Available balance'**
  String get homeAvailableBalance;

  /// No description provided for @homeErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load'**
  String get homeErrorTitle;

  /// No description provided for @homeErrorBody.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get homeErrorBody;

  /// No description provided for @homeErrorRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get homeErrorRetry;

  /// No description provided for @homeQuickActionTopUp.
  ///
  /// In en, this message translates to:
  /// **'Top-up'**
  String get homeQuickActionTopUp;

  /// No description provided for @homeQuickActionSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get homeQuickActionSend;

  /// No description provided for @homeQuickActionScan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get homeQuickActionScan;

  /// No description provided for @homeQuickActionRequest.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get homeQuickActionRequest;

  /// No description provided for @homeDebugTestPayment.
  ///
  /// In en, this message translates to:
  /// **'Debug: test payment'**
  String get homeDebugTestPayment;

  /// No description provided for @homeServicesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get homeServicesSectionTitle;

  /// No description provided for @homeServiceBills.
  ///
  /// In en, this message translates to:
  /// **'Bills'**
  String get homeServiceBills;

  /// No description provided for @homeServiceRecharge.
  ///
  /// In en, this message translates to:
  /// **'Recharge'**
  String get homeServiceRecharge;

  /// No description provided for @homeServiceGovernment.
  ///
  /// In en, this message translates to:
  /// **'Government'**
  String get homeServiceGovernment;

  /// No description provided for @homeServiceInsurance.
  ///
  /// In en, this message translates to:
  /// **'Insurance'**
  String get homeServiceInsurance;

  /// No description provided for @homeServiceEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get homeServiceEducation;

  /// No description provided for @homeServiceRemittance.
  ///
  /// In en, this message translates to:
  /// **'Remittance'**
  String get homeServiceRemittance;

  /// No description provided for @homeServiceRewards.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get homeServiceRewards;

  /// No description provided for @homeServiceMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get homeServiceMore;

  /// No description provided for @homePromoTitle1.
  ///
  /// In en, this message translates to:
  /// **'Send money instantly'**
  String get homePromoTitle1;

  /// No description provided for @homePromoBody1.
  ///
  /// In en, this message translates to:
  /// **'Zero fees to any Emral Pay wallet.'**
  String get homePromoBody1;

  /// No description provided for @homePromoTitle2.
  ///
  /// In en, this message translates to:
  /// **'Earn rewards on every bill'**
  String get homePromoTitle2;

  /// No description provided for @homePromoBody2.
  ///
  /// In en, this message translates to:
  /// **'1 point for every 1 OMR you pay.'**
  String get homePromoBody2;

  /// No description provided for @homePromoTitle3.
  ///
  /// In en, this message translates to:
  /// **'Track your remittances'**
  String get homePromoTitle3;

  /// No description provided for @homePromoBody3.
  ///
  /// In en, this message translates to:
  /// **'Real-time status from send to delivery.'**
  String get homePromoBody3;

  /// No description provided for @homeRecentTransactionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent transactions'**
  String get homeRecentTransactionsTitle;

  /// No description provided for @homeViewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get homeViewAll;

  /// No description provided for @homeRecentEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get homeRecentEmptyTitle;

  /// No description provided for @homeRecentEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Your recent activity will show up here.'**
  String get homeRecentEmptyBody;

  /// No description provided for @homeRewardsPointsSuffix.
  ///
  /// In en, this message translates to:
  /// **'pts'**
  String get homeRewardsPointsSuffix;

  /// No description provided for @paymentConfirmAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Review payment'**
  String get paymentConfirmAppBarTitle;

  /// No description provided for @paymentConfirmCta.
  ///
  /// In en, this message translates to:
  /// **'Confirm & Pay'**
  String get paymentConfirmCta;

  /// No description provided for @paymentTotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get paymentTotalLabel;

  /// No description provided for @paymentPinTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your PIN'**
  String get paymentPinTitle;

  /// Remaining PIN attempts before cooldown lockout.
  ///
  /// In en, this message translates to:
  /// **'{count} attempts left'**
  String paymentPinAttemptsRemaining(int count);

  /// No description provided for @paymentPinCooldownMessage.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Please try again later.'**
  String get paymentPinCooldownMessage;

  /// No description provided for @paymentProcessingLabel.
  ///
  /// In en, this message translates to:
  /// **'Processing your payment…'**
  String get paymentProcessingLabel;

  /// No description provided for @paymentCancelCta.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get paymentCancelCta;

  /// No description provided for @paymentReceiptTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment successful'**
  String get paymentReceiptTitle;

  /// No description provided for @paymentReceiptDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get paymentReceiptDone;

  /// No description provided for @paymentReceiptReferenceLabel.
  ///
  /// In en, this message translates to:
  /// **'Reference no.'**
  String get paymentReceiptReferenceLabel;

  /// No description provided for @paymentErrorSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get paymentErrorSheetTitle;

  /// No description provided for @paymentErrorSheetBody.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t process your payment. Please try again.'**
  String get paymentErrorSheetBody;

  /// No description provided for @paymentErrorSheetRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get paymentErrorSheetRetry;

  /// No description provided for @paymentInsufficientFundsTitle.
  ///
  /// In en, this message translates to:
  /// **'Insufficient balance'**
  String get paymentInsufficientFundsTitle;

  /// No description provided for @paymentInsufficientFundsBody.
  ///
  /// In en, this message translates to:
  /// **'Your wallet balance isn\'t enough to complete this payment.'**
  String get paymentInsufficientFundsBody;

  /// No description provided for @paymentInsufficientFundsTopUp.
  ///
  /// In en, this message translates to:
  /// **'Top up wallet'**
  String get paymentInsufficientFundsTopUp;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'Transaction History'**
  String get historyTitle;

  /// No description provided for @historyFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get historyFilterAll;

  /// No description provided for @historyFilterBills.
  ///
  /// In en, this message translates to:
  /// **'Bills'**
  String get historyFilterBills;

  /// No description provided for @historyFilterRecharge.
  ///
  /// In en, this message translates to:
  /// **'Recharge'**
  String get historyFilterRecharge;

  /// No description provided for @historyFilterGovernment.
  ///
  /// In en, this message translates to:
  /// **'Government'**
  String get historyFilterGovernment;

  /// No description provided for @historyFilterWallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get historyFilterWallet;

  /// No description provided for @historyFilterRemittance.
  ///
  /// In en, this message translates to:
  /// **'Remittance'**
  String get historyFilterRemittance;

  /// No description provided for @historyStatusAll.
  ///
  /// In en, this message translates to:
  /// **'All statuses'**
  String get historyStatusAll;

  /// No description provided for @historyStatusSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get historyStatusSuccess;

  /// No description provided for @historyStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get historyStatusPending;

  /// No description provided for @historyStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get historyStatusFailed;

  /// No description provided for @historyErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load history'**
  String get historyErrorTitle;

  /// No description provided for @historyErrorBody.
  ///
  /// In en, this message translates to:
  /// **'Check your connection and try again.'**
  String get historyErrorBody;

  /// No description provided for @historyErrorRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get historyErrorRetry;

  /// No description provided for @historyEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get historyEmptyTitle;

  /// No description provided for @historyEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Your payments will show up here.'**
  String get historyEmptyBody;

  /// No description provided for @historyEmptyFilteredTitle.
  ///
  /// In en, this message translates to:
  /// **'No matching transactions'**
  String get historyEmptyFilteredTitle;

  /// No description provided for @historyEmptyFilteredBody.
  ///
  /// In en, this message translates to:
  /// **'Try a different filter.'**
  String get historyEmptyFilteredBody;

  /// No description provided for @txnDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Transaction Detail'**
  String get txnDetailTitle;

  /// No description provided for @txnDetailAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get txnDetailAmountLabel;

  /// No description provided for @txnDetailFeeLabel.
  ///
  /// In en, this message translates to:
  /// **'Fee'**
  String get txnDetailFeeLabel;

  /// No description provided for @txnDetailTotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get txnDetailTotalLabel;

  /// No description provided for @txnDetailDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get txnDetailDateLabel;

  /// No description provided for @txnDetailReferenceLabel.
  ///
  /// In en, this message translates to:
  /// **'Reference number'**
  String get txnDetailReferenceLabel;

  /// No description provided for @txnDetailRewardPointsLabel.
  ///
  /// In en, this message translates to:
  /// **'Reward points earned'**
  String get txnDetailRewardPointsLabel;

  /// No description provided for @txnDetailRedownloadReceipt.
  ///
  /// In en, this message translates to:
  /// **'Re-download receipt'**
  String get txnDetailRedownloadReceipt;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
