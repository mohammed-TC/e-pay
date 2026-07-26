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

  /// No description provided for @homeServiceCarRental.
  ///
  /// In en, this message translates to:
  /// **'Car Rental'**
  String get homeServiceCarRental;

  /// No description provided for @homeServiceRewards.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get homeServiceRewards;

  /// No description provided for @homeServiceAiAssistant.
  ///
  /// In en, this message translates to:
  /// **'Ask Emral'**
  String get homeServiceAiAssistant;

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

  /// No description provided for @historyFilterRental.
  ///
  /// In en, this message translates to:
  /// **'Rental'**
  String get historyFilterRental;

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

  /// No description provided for @walletHomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get walletHomeTitle;

  /// No description provided for @walletHomeBalanceLabel.
  ///
  /// In en, this message translates to:
  /// **'Wallet balance'**
  String get walletHomeBalanceLabel;

  /// No description provided for @walletActionMyQr.
  ///
  /// In en, this message translates to:
  /// **'My QR'**
  String get walletActionMyQr;

  /// No description provided for @walletMiniStatementTitle.
  ///
  /// In en, this message translates to:
  /// **'Mini statement'**
  String get walletMiniStatementTitle;

  /// No description provided for @walletViewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get walletViewAll;

  /// No description provided for @walletStatementEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get walletStatementEmptyTitle;

  /// No description provided for @walletStatementEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Your wallet activity will show up here.'**
  String get walletStatementEmptyBody;

  /// No description provided for @walletTopUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Top-up'**
  String get walletTopUpTitle;

  /// No description provided for @walletTopUpAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Top-up amount'**
  String get walletTopUpAmountLabel;

  /// No description provided for @walletTopUpSourceLabel.
  ///
  /// In en, this message translates to:
  /// **'Pay from'**
  String get walletTopUpSourceLabel;

  /// No description provided for @walletTopUpApplePay.
  ///
  /// In en, this message translates to:
  /// **'Apple Pay'**
  String get walletTopUpApplePay;

  /// No description provided for @walletTopUpCta.
  ///
  /// In en, this message translates to:
  /// **'Top up'**
  String get walletTopUpCta;

  /// No description provided for @walletSendTitle.
  ///
  /// In en, this message translates to:
  /// **'Send Money'**
  String get walletSendTitle;

  /// No description provided for @walletSendTabMobile.
  ///
  /// In en, this message translates to:
  /// **'To Mobile'**
  String get walletSendTabMobile;

  /// No description provided for @walletSendTabWallet.
  ///
  /// In en, this message translates to:
  /// **'To Wallet'**
  String get walletSendTabWallet;

  /// No description provided for @walletSendTabBank.
  ///
  /// In en, this message translates to:
  /// **'To Bank'**
  String get walletSendTabBank;

  /// No description provided for @walletSendAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get walletSendAmountLabel;

  /// No description provided for @walletSendNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get walletSendNoteLabel;

  /// No description provided for @walletSendNoteHint.
  ///
  /// In en, this message translates to:
  /// **'What\'s this for? (optional)'**
  String get walletSendNoteHint;

  /// No description provided for @walletSendBankAccountNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Account holder name'**
  String get walletSendBankAccountNameLabel;

  /// No description provided for @walletSendBankAccountNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter account holder name'**
  String get walletSendBankAccountNameHint;

  /// No description provided for @walletSendBankIbanLabel.
  ///
  /// In en, this message translates to:
  /// **'IBAN'**
  String get walletSendBankIbanLabel;

  /// No description provided for @walletSendBankIbanHint.
  ///
  /// In en, this message translates to:
  /// **'Enter IBAN'**
  String get walletSendBankIbanHint;

  /// No description provided for @walletSendCta.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get walletSendCta;

  /// No description provided for @walletRequestTitle.
  ///
  /// In en, this message translates to:
  /// **'Request Money'**
  String get walletRequestTitle;

  /// No description provided for @walletRequestPayerPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Select a contact'**
  String get walletRequestPayerPlaceholder;

  /// No description provided for @walletRequestNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get walletRequestNoteLabel;

  /// No description provided for @walletRequestNoteHint.
  ///
  /// In en, this message translates to:
  /// **'What\'s this for? (optional)'**
  String get walletRequestNoteHint;

  /// No description provided for @walletRequestSendCta.
  ///
  /// In en, this message translates to:
  /// **'Send request'**
  String get walletRequestSendCta;

  /// No description provided for @walletRequestPendingTitle.
  ///
  /// In en, this message translates to:
  /// **'Pending requests'**
  String get walletRequestPendingTitle;

  /// No description provided for @walletRequestEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No requests yet'**
  String get walletRequestEmptyTitle;

  /// No description provided for @walletRequestEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Requests you send or receive will show up here.'**
  String get walletRequestEmptyBody;

  /// No description provided for @walletRequestAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get walletRequestAccept;

  /// No description provided for @walletRequestDecline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get walletRequestDecline;

  /// No description provided for @walletRequestStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get walletRequestStatusPending;

  /// No description provided for @walletRequestStatusAccepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get walletRequestStatusAccepted;

  /// No description provided for @walletRequestStatusDeclined.
  ///
  /// In en, this message translates to:
  /// **'Declined'**
  String get walletRequestStatusDeclined;

  /// No description provided for @scanTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan & Pay'**
  String get scanTitle;

  /// No description provided for @scanCameraCta.
  ///
  /// In en, this message translates to:
  /// **'Scan a QR code'**
  String get scanCameraCta;

  /// No description provided for @scanManualLabel.
  ///
  /// In en, this message translates to:
  /// **'Or enter a merchant code'**
  String get scanManualLabel;

  /// No description provided for @scanManualHint.
  ///
  /// In en, this message translates to:
  /// **'Enter merchant code'**
  String get scanManualHint;

  /// No description provided for @scanManualCta.
  ///
  /// In en, this message translates to:
  /// **'Look up'**
  String get scanManualCta;

  /// No description provided for @scanCancelCamera.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get scanCancelCamera;

  /// No description provided for @scanPayCta.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get scanPayCta;

  /// No description provided for @scanTryAnother.
  ///
  /// In en, this message translates to:
  /// **'Try another code'**
  String get scanTryAnother;

  /// No description provided for @scanUnknownMerchantName.
  ///
  /// In en, this message translates to:
  /// **'Unknown merchant'**
  String get scanUnknownMerchantName;

  /// No description provided for @walletQrTitle.
  ///
  /// In en, this message translates to:
  /// **'My QR'**
  String get walletQrTitle;

  /// No description provided for @walletQrSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Scan to pay or send money to me'**
  String get walletQrSubtitle;

  /// No description provided for @walletQrShareCta.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get walletQrShareCta;

  /// No description provided for @walletQrShareCopied.
  ///
  /// In en, this message translates to:
  /// **'QR code link copied'**
  String get walletQrShareCopied;

  /// No description provided for @billCategoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Bills & Recharges'**
  String get billCategoriesTitle;

  /// No description provided for @billCategoryElectricity.
  ///
  /// In en, this message translates to:
  /// **'Electricity'**
  String get billCategoryElectricity;

  /// No description provided for @billCategoryWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get billCategoryWater;

  /// No description provided for @billCategoryTelecom.
  ///
  /// In en, this message translates to:
  /// **'Telecom'**
  String get billCategoryTelecom;

  /// No description provided for @billCategoryInternet.
  ///
  /// In en, this message translates to:
  /// **'Internet'**
  String get billCategoryInternet;

  /// No description provided for @billCategoryTvEntertainment.
  ///
  /// In en, this message translates to:
  /// **'TV & Entertainment'**
  String get billCategoryTvEntertainment;

  /// No description provided for @billSmartMeterEntry.
  ///
  /// In en, this message translates to:
  /// **'Smart Meter Recharge'**
  String get billSmartMeterEntry;

  /// No description provided for @billerSelectTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Provider'**
  String get billerSelectTitle;

  /// No description provided for @billerSelectEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No providers yet'**
  String get billerSelectEmptyTitle;

  /// No description provided for @billerSelectEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'There are no providers in this category right now.'**
  String get billerSelectEmptyBody;

  /// No description provided for @accountEntryTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Account'**
  String get accountEntryTitle;

  /// No description provided for @accountEntryFetchByMobileLabel.
  ///
  /// In en, this message translates to:
  /// **'Fetch by mobile number'**
  String get accountEntryFetchByMobileLabel;

  /// No description provided for @accountEntryMobileLabel.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get accountEntryMobileLabel;

  /// No description provided for @accountEntryMobileHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 9XXXXXXX'**
  String get accountEntryMobileHint;

  /// No description provided for @accountEntryAccountNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Account number'**
  String get accountEntryAccountNumberLabel;

  /// No description provided for @accountEntryAccountNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Enter account number'**
  String get accountEntryAccountNumberHint;

  /// No description provided for @accountEntrySaveToggleLabel.
  ///
  /// In en, this message translates to:
  /// **'Save this account'**
  String get accountEntrySaveToggleLabel;

  /// No description provided for @accountEntryNicknameLabel.
  ///
  /// In en, this message translates to:
  /// **'Nickname'**
  String get accountEntryNicknameLabel;

  /// No description provided for @accountEntryNicknameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Home Electricity'**
  String get accountEntryNicknameHint;

  /// No description provided for @accountEntryFetchBillCta.
  ///
  /// In en, this message translates to:
  /// **'Fetch Bill'**
  String get accountEntryFetchBillCta;

  /// No description provided for @savedAccountsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No saved accounts'**
  String get savedAccountsEmptyTitle;

  /// No description provided for @savedAccountsEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Add an account to fetch and pay its bill.'**
  String get savedAccountsEmptyBody;

  /// No description provided for @savedAccountsAddCta.
  ///
  /// In en, this message translates to:
  /// **'Add Account'**
  String get savedAccountsAddCta;

  /// No description provided for @billDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Bill Detail'**
  String get billDetailTitle;

  /// No description provided for @billDetailAmountDueLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount due'**
  String get billDetailAmountDueLabel;

  /// No description provided for @billDetailDueDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Due'**
  String get billDetailDueDateLabel;

  /// No description provided for @billDetailViewPdfCta.
  ///
  /// In en, this message translates to:
  /// **'View PDF'**
  String get billDetailViewPdfCta;

  /// No description provided for @billDetailPayCta.
  ///
  /// In en, this message translates to:
  /// **'Pay Bill'**
  String get billDetailPayCta;

  /// No description provided for @paymentMethodSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment method'**
  String get paymentMethodSectionTitle;

  /// No description provided for @paymentMethodWallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet balance'**
  String get paymentMethodWallet;

  /// No description provided for @paymentMethodApplePay.
  ///
  /// In en, this message translates to:
  /// **'Apple Pay'**
  String get paymentMethodApplePay;

  /// No description provided for @paymentMethodAddCard.
  ///
  /// In en, this message translates to:
  /// **'Add new card'**
  String get paymentMethodAddCard;

  /// No description provided for @rechargeTitle.
  ///
  /// In en, this message translates to:
  /// **'Prepaid Recharge'**
  String get rechargeTitle;

  /// No description provided for @rechargeProviderLabel.
  ///
  /// In en, this message translates to:
  /// **'Select provider'**
  String get rechargeProviderLabel;

  /// No description provided for @rechargeCustomAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Or enter a custom amount'**
  String get rechargeCustomAmountLabel;

  /// No description provided for @rechargeAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Recharge amount'**
  String get rechargeAmountLabel;

  /// No description provided for @rechargeVatLabel.
  ///
  /// In en, this message translates to:
  /// **'VAT (15%)'**
  String get rechargeVatLabel;

  /// No description provided for @rechargePayCta.
  ///
  /// In en, this message translates to:
  /// **'Recharge Now'**
  String get rechargePayCta;

  /// No description provided for @smartMeterTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Meter Recharge'**
  String get smartMeterTitle;

  /// No description provided for @smartMeterNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Meter number'**
  String get smartMeterNumberLabel;

  /// No description provided for @smartMeterNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Enter meter number'**
  String get smartMeterNumberHint;

  /// No description provided for @smartMeterFetchCta.
  ///
  /// In en, this message translates to:
  /// **'Fetch Charge'**
  String get smartMeterFetchCta;

  /// No description provided for @smartMeterTotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get smartMeterTotalLabel;

  /// No description provided for @smartMeterPayCta.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get smartMeterPayCta;

  /// No description provided for @chatScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Ask Emral'**
  String get chatScreenTitle;

  /// No description provided for @chatFabSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'Open Ask Emral chat'**
  String get chatFabSemanticLabel;

  /// No description provided for @chatInputHint.
  ///
  /// In en, this message translates to:
  /// **'Ask about bills, balance, rewards…'**
  String get chatInputHint;

  /// No description provided for @chatVoiceComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Voice input coming soon'**
  String get chatVoiceComingSoon;

  /// No description provided for @chatPayNowCta.
  ///
  /// In en, this message translates to:
  /// **'Pay now'**
  String get chatPayNowCta;

  /// No description provided for @chatReviewAndPayCta.
  ///
  /// In en, this message translates to:
  /// **'Review & pay'**
  String get chatReviewAndPayCta;

  /// No description provided for @chatWalletSummaryLabel.
  ///
  /// In en, this message translates to:
  /// **'Available balance'**
  String get chatWalletSummaryLabel;

  /// No description provided for @chatQuickReplyBills.
  ///
  /// In en, this message translates to:
  /// **'Show my bills'**
  String get chatQuickReplyBills;

  /// No description provided for @chatQuickReplyBalance.
  ///
  /// In en, this message translates to:
  /// **'Wallet balance'**
  String get chatQuickReplyBalance;

  /// No description provided for @chatQuickReplyRewards.
  ///
  /// In en, this message translates to:
  /// **'My rewards'**
  String get chatQuickReplyRewards;

  /// No description provided for @chatQuickReplyTxns.
  ///
  /// In en, this message translates to:
  /// **'Recent transactions'**
  String get chatQuickReplyTxns;

  /// No description provided for @chatQuickReplyRentalCar.
  ///
  /// In en, this message translates to:
  /// **'Rent a car'**
  String get chatQuickReplyRentalCar;

  /// No description provided for @chatErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load chat'**
  String get chatErrorTitle;

  /// No description provided for @chatErrorBody.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong loading Ask Emral.'**
  String get chatErrorBody;

  /// No description provided for @chatErrorRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get chatErrorRetry;

  /// No description provided for @chatReplyGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi! I\'m Emral, your money assistant. Ask me about bills, your wallet, or rewards.'**
  String get chatReplyGreeting;

  /// No description provided for @chatReplyHelp.
  ///
  /// In en, this message translates to:
  /// **'I can check bills due, your wallet balance, reward points, recent transactions, or help you pay a bill or send money.'**
  String get chatReplyHelp;

  /// No description provided for @chatReplyFallback.
  ///
  /// In en, this message translates to:
  /// **'I didn\'t quite catch that. Try asking about bills, balance, or rewards — or tap a suggestion below.'**
  String get chatReplyFallback;

  /// No description provided for @chatReplyWalletBalanceIntro.
  ///
  /// In en, this message translates to:
  /// **'Here\'s your wallet balance:'**
  String get chatReplyWalletBalanceIntro;

  /// No description provided for @chatReplyRewardsIntro.
  ///
  /// In en, this message translates to:
  /// **'Here\'s where your rewards stand:'**
  String get chatReplyRewardsIntro;

  /// No description provided for @chatReplyNoTxns.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any transactions yet.'**
  String get chatReplyNoTxns;

  /// No description provided for @chatReplyTxnLine.
  ///
  /// In en, this message translates to:
  /// **'{title} — {amount}'**
  String chatReplyTxnLine(String title, String amount);

  /// No description provided for @chatReplyRecentTxnsIntro.
  ///
  /// In en, this message translates to:
  /// **'Here are your recent transactions:\n{lines}'**
  String chatReplyRecentTxnsIntro(String lines);

  /// No description provided for @chatReplyNoBills.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any saved billers yet. Add one from Bills to get reminders here.'**
  String get chatReplyNoBills;

  /// No description provided for @chatReplyBillsDueIntro.
  ///
  /// In en, this message translates to:
  /// **'Here\'s what\'s due:'**
  String get chatReplyBillsDueIntro;

  /// No description provided for @chatReplyPayBillNotFound.
  ///
  /// In en, this message translates to:
  /// **'I couldn\'t find that biller in your saved accounts. Try naming one, like \"pay VoltGrid\".'**
  String get chatReplyPayBillNotFound;

  /// No description provided for @chatReplyPayBillFound.
  ///
  /// In en, this message translates to:
  /// **'Found it — here\'s {accountNickname}:'**
  String chatReplyPayBillFound(String accountNickname);

  /// No description provided for @chatReplySendMoneyFound.
  ///
  /// In en, this message translates to:
  /// **'Here\'s a quick send to {contactName}:'**
  String chatReplySendMoneyFound(String contactName);

  /// No description provided for @chatReplySendMoneyNotFound.
  ///
  /// In en, this message translates to:
  /// **'I couldn\'t find that contact. Try naming a saved contact, like \"send to Aisha\".'**
  String get chatReplySendMoneyNotFound;

  /// No description provided for @chatSendMoneyCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Send to {contactName}'**
  String chatSendMoneyCardTitle(String contactName);

  /// No description provided for @chatBillDueBadge.
  ///
  /// In en, this message translates to:
  /// **'Due in {days} days'**
  String chatBillDueBadge(int days);

  /// No description provided for @chatBillDueSoonBadge.
  ///
  /// In en, this message translates to:
  /// **'Due in {days} days'**
  String chatBillDueSoonBadge(int days);

  /// No description provided for @chatRewardsPointsLabel.
  ///
  /// In en, this message translates to:
  /// **'{points} points'**
  String chatRewardsPointsLabel(int points);

  /// No description provided for @chatRewardsThresholdLabel.
  ///
  /// In en, this message translates to:
  /// **'{threshold} points to redeem'**
  String chatRewardsThresholdLabel(int threshold);

  /// No description provided for @chatPaymentCompletedAck.
  ///
  /// In en, this message translates to:
  /// **'Payment successful. Your {payeeName} bill has been paid.'**
  String chatPaymentCompletedAck(String payeeName);

  /// No description provided for @chatAnythingElsePrompt.
  ///
  /// In en, this message translates to:
  /// **'Is there anything else you\'d like to pay today? Bills, wallet transfers, or rewards?'**
  String get chatAnythingElsePrompt;

  /// No description provided for @chatVehicleRenewalNudge.
  ///
  /// In en, this message translates to:
  /// **'I noticed your vehicle registration ({plateNumber}) expires on {expiryDate}. Renewing now can help you avoid a lapse. Would you like to see the renewal now?'**
  String chatVehicleRenewalNudge(String plateNumber, String expiryDate);

  /// No description provided for @chatVehicleRenewalReminderSet.
  ///
  /// In en, this message translates to:
  /// **'No problem. I\'ve set a reminder for next week.'**
  String get chatVehicleRenewalReminderSet;

  /// No description provided for @chatVehicleRenewalOfferAccept.
  ///
  /// In en, this message translates to:
  /// **'Sure — here\'s the renewal for {plateNumber}:'**
  String chatVehicleRenewalOfferAccept(String plateNumber);

  /// No description provided for @chatVehicleRenewalCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Renew registration — {plateNumber}'**
  String chatVehicleRenewalCardTitle(String plateNumber);

  /// No description provided for @chatVehicleRenewalCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Vehicle registration renewal'**
  String get chatVehicleRenewalCardSubtitle;

  /// No description provided for @chatVehicleRenewalFeeLabel.
  ///
  /// In en, this message translates to:
  /// **'Renewal fee'**
  String get chatVehicleRenewalFeeLabel;

  /// No description provided for @chatAutoPayPitchIntro.
  ///
  /// In en, this message translates to:
  /// **'Before you go, would you like to enrol in AutoPay for future bills on this account? It helps avoid late payment charges.'**
  String get chatAutoPayPitchIntro;

  /// No description provided for @chatAutoPayExplain.
  ///
  /// In en, this message translates to:
  /// **'AutoPay automatically pays this bill on the due date using your wallet balance. You stay in control and can cancel anytime. Would you like to enable it?'**
  String get chatAutoPayExplain;

  /// No description provided for @chatAutoPayEnabled.
  ///
  /// In en, this message translates to:
  /// **'Done! AutoPay is now active.'**
  String get chatAutoPayEnabled;

  /// No description provided for @chatAutoPayDeclined.
  ///
  /// In en, this message translates to:
  /// **'No problem, AutoPay stays off for now.'**
  String get chatAutoPayDeclined;

  /// No description provided for @rentalSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Rental Search'**
  String get rentalSearchTitle;

  /// No description provided for @rentalSearchLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'Pickup location'**
  String get rentalSearchLocationLabel;

  /// No description provided for @rentalSearchLocationPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Select pickup location'**
  String get rentalSearchLocationPlaceholder;

  /// No description provided for @rentalSearchPickupLabel.
  ///
  /// In en, this message translates to:
  /// **'Pickup date'**
  String get rentalSearchPickupLabel;

  /// No description provided for @rentalSearchReturnLabel.
  ///
  /// In en, this message translates to:
  /// **'Return date'**
  String get rentalSearchReturnLabel;

  /// No description provided for @rentalSearchDatePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get rentalSearchDatePlaceholder;

  /// No description provided for @rentalSearchTimeMorning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get rentalSearchTimeMorning;

  /// No description provided for @rentalSearchTimeEvening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get rentalSearchTimeEvening;

  /// No description provided for @rentalSearchCta.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get rentalSearchCta;

  /// No description provided for @rentalResultsTitle.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Results'**
  String get rentalResultsTitle;

  /// No description provided for @rentalResultsTripLabel.
  ///
  /// In en, this message translates to:
  /// **'{days}-day trip'**
  String rentalResultsTripLabel(int days);

  /// No description provided for @rentalResultsRewardsBannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Use your rewards'**
  String get rentalResultsRewardsBannerTitle;

  /// No description provided for @rentalResultsRewardsBannerBody.
  ///
  /// In en, this message translates to:
  /// **'You have {points} PayHub Rewards Points, worth {value} towards this booking.'**
  String rentalResultsRewardsBannerBody(int points, String value);

  /// No description provided for @rentalResultsRewardsBadge.
  ///
  /// In en, this message translates to:
  /// **'Redeemable'**
  String get rentalResultsRewardsBadge;

  /// No description provided for @rentalResultsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No vehicles available'**
  String get rentalResultsEmptyTitle;

  /// No description provided for @rentalResultsEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Try different dates or a different pickup location.'**
  String get rentalResultsEmptyBody;

  /// No description provided for @rentalDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Vehicle & Extras'**
  String get rentalDetailTitle;

  /// No description provided for @rentalDetailSpecsSeats.
  ///
  /// In en, this message translates to:
  /// **'{count} seats'**
  String rentalDetailSpecsSeats(int count);

  /// No description provided for @rentalDetailSpecsBags.
  ///
  /// In en, this message translates to:
  /// **'{count} bags'**
  String rentalDetailSpecsBags(int count);

  /// No description provided for @rentalDetailRedeemPointsTitle.
  ///
  /// In en, this message translates to:
  /// **'Redeem reward points'**
  String get rentalDetailRedeemPointsTitle;

  /// No description provided for @rentalDetailRedeemPointsBody.
  ///
  /// In en, this message translates to:
  /// **'{points} pts available'**
  String rentalDetailRedeemPointsBody(int points);

  /// No description provided for @rentalDetailAddonsTitle.
  ///
  /// In en, this message translates to:
  /// **'Add-ons'**
  String get rentalDetailAddonsTitle;

  /// No description provided for @rentalDetailContinueCta.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get rentalDetailContinueCta;

  /// No description provided for @rentalAddonDoublePoints.
  ///
  /// In en, this message translates to:
  /// **'2× points'**
  String get rentalAddonDoublePoints;

  /// No description provided for @rentalReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Booking Review'**
  String get rentalReviewTitle;

  /// No description provided for @rentalReviewRentalCostLabel.
  ///
  /// In en, this message translates to:
  /// **'Rental cost'**
  String get rentalReviewRentalCostLabel;

  /// No description provided for @rentalReviewAddonsCostLabel.
  ///
  /// In en, this message translates to:
  /// **'Add-ons'**
  String get rentalReviewAddonsCostLabel;

  /// No description provided for @rentalReviewPointsDiscountLabel.
  ///
  /// In en, this message translates to:
  /// **'Rewards discount'**
  String get rentalReviewPointsDiscountLabel;

  /// No description provided for @rentalReviewEarnedPointsLabel.
  ///
  /// In en, this message translates to:
  /// **'You\'ll earn'**
  String get rentalReviewEarnedPointsLabel;

  /// No description provided for @rentalReviewEarnedPointsValue.
  ///
  /// In en, this message translates to:
  /// **'{points} pts'**
  String rentalReviewEarnedPointsValue(int points);

  /// No description provided for @rentalReviewConfirmCta.
  ///
  /// In en, this message translates to:
  /// **'Confirm & Pay'**
  String get rentalReviewConfirmCta;

  /// No description provided for @rentalMyRentalsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Rentals'**
  String get rentalMyRentalsTitle;

  /// No description provided for @rentalMyRentalsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No rentals yet'**
  String get rentalMyRentalsEmptyTitle;

  /// No description provided for @rentalMyRentalsEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Book a car to see it here.'**
  String get rentalMyRentalsEmptyBody;

  /// No description provided for @rentalMyRentalsEmptyCta.
  ///
  /// In en, this message translates to:
  /// **'Rent a car'**
  String get rentalMyRentalsEmptyCta;

  /// No description provided for @chatRentalLocationPrompt.
  ///
  /// In en, this message translates to:
  /// **'Happy to help. Where will you be collecting the vehicle?'**
  String get chatRentalLocationPrompt;

  /// No description provided for @chatRentalLocationNotFound.
  ///
  /// In en, this message translates to:
  /// **'I couldn\'t find that pickup location. Could you try naming an airport or branch, like Muscat International Airport?'**
  String get chatRentalLocationNotFound;

  /// No description provided for @chatRentalDatesPrompt.
  ///
  /// In en, this message translates to:
  /// **'Great. What are your pick-up and return dates?'**
  String get chatRentalDatesPrompt;

  /// No description provided for @chatRentalDatesNotUnderstood.
  ///
  /// In en, this message translates to:
  /// **'I couldn\'t quite work out those dates. Try something like \"Friday morning until Monday evening.\"'**
  String get chatRentalDatesNotUnderstood;

  /// No description provided for @chatRentalOptionsIntro.
  ///
  /// In en, this message translates to:
  /// **'I\'ve found several options.\n\n{options}'**
  String chatRentalOptionsIntro(String options);

  /// No description provided for @chatRentalPointsOffer.
  ///
  /// In en, this message translates to:
  /// **'I also noticed you have {points} PayHub Rewards Points, worth {value} towards this booking.\n\nWould you like to use your points to reduce the cost?'**
  String chatRentalPointsOffer(int points, String value);

  /// No description provided for @chatRentalPointsApplied.
  ///
  /// In en, this message translates to:
  /// **'Done.\n\nYour {vehicleClass} will now cost {total} after applying your rewards.\n\nYou will also earn approximately {points} new points on this booking.'**
  String chatRentalPointsApplied(String vehicleClass, String total, int points);

  /// No description provided for @chatRentalPointsSkipped.
  ///
  /// In en, this message translates to:
  /// **'No problem, we\'ll keep your rewards points for next time.'**
  String get chatRentalPointsSkipped;

  /// No description provided for @chatRentalAddonAcceptedTitle.
  ///
  /// In en, this message translates to:
  /// **'Done.\n\nYour booking now includes:\n✓ Full Damage Protection\n✓ Double reward points'**
  String get chatRentalAddonAcceptedTitle;

  /// No description provided for @chatRentalAddonAcceptedPoints.
  ///
  /// In en, this message translates to:
  /// **'Estimated points earned:\n{points} points'**
  String chatRentalAddonAcceptedPoints(int points);

  /// No description provided for @chatRentalAddonDeclined.
  ///
  /// In en, this message translates to:
  /// **'No problem, we won\'t add Full Damage Protection.'**
  String get chatRentalAddonDeclined;

  /// No description provided for @chatRentalLicenceNudge.
  ///
  /// In en, this message translates to:
  /// **'I also noticed your driving licence expires in three months. Would you like me to remind you before it expires?'**
  String get chatRentalLicenceNudge;

  /// No description provided for @chatRentalLicenceReminderSet.
  ///
  /// In en, this message translates to:
  /// **'Reminder scheduled.'**
  String get chatRentalLicenceReminderSet;

  /// No description provided for @chatRentalLicenceReminderSkipped.
  ///
  /// In en, this message translates to:
  /// **'No problem.'**
  String get chatRentalLicenceReminderSkipped;

  /// No description provided for @chatRentalRoadsideOffer.
  ///
  /// In en, this message translates to:
  /// **'Since you\'re collecting the vehicle at {location}, many customers also purchase Roadside Assistance Plus.\n\nBenefits include:\n\n• 24/7 breakdown assistance\n• Flat tyre cover\n• Lost key assistance\n\nIt costs {price} for your trip.\n\nWould you like to add it?'**
  String chatRentalRoadsideOffer(String location, String price);

  /// No description provided for @chatRentalRoadsideAccepted.
  ///
  /// In en, this message translates to:
  /// **'Great, I\'ve added Roadside Assistance Plus.'**
  String get chatRentalRoadsideAccepted;

  /// No description provided for @chatRentalRoadsideDeclined.
  ///
  /// In en, this message translates to:
  /// **'No problem.'**
  String get chatRentalRoadsideDeclined;

  /// No description provided for @chatRentalBookingReadyIntro.
  ///
  /// In en, this message translates to:
  /// **'Your booking is ready. Tap below to review and confirm.'**
  String get chatRentalBookingReadyIntro;

  /// No description provided for @chatRentalCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{location} · {days}-day trip'**
  String chatRentalCardSubtitle(String location, int days);

  /// No description provided for @chatRentalAwaitingPayment.
  ///
  /// In en, this message translates to:
  /// **'Please tap the booking card above to complete your payment.'**
  String get chatRentalAwaitingPayment;

  /// No description provided for @chatRentalSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Here\'s your summary:\n\nRental Vehicle:\n{vehicleClass}\n\nRental Cost:\n{cost}\n\nRewards Discount:\n-{discount}\n\nInsurance:\n{insurance}\n\nTotal:\n{total}'**
  String chatRentalSummaryTitle(
    String vehicleClass,
    String cost,
    String discount,
    String insurance,
    String total,
  );

  /// No description provided for @chatRentalSummaryInsuranceIncluded.
  ///
  /// In en, this message translates to:
  /// **'Included'**
  String get chatRentalSummaryInsuranceIncluded;

  /// No description provided for @chatRentalSummaryInsuranceNotIncluded.
  ///
  /// In en, this message translates to:
  /// **'Not included'**
  String get chatRentalSummaryInsuranceNotIncluded;

  /// No description provided for @chatRentalSummaryEarned.
  ///
  /// In en, this message translates to:
  /// **'You\'ll earn:\n\n• {points} PayHub Rewards Points'**
  String chatRentalSummaryEarned(int points);

  /// No description provided for @chatRentalSummaryReceiptSent.
  ///
  /// In en, this message translates to:
  /// **'Your e-receipt has been sent.\n\nSafe travels!'**
  String get chatRentalSummaryReceiptSent;
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
