/// Route path constants — architecture.md §6.
abstract final class Routes {
  static const splash = '/';
  static const language = '/language';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const otp = '/otp';
  static const profileSetup = '/profile-setup';
  static const pinSetup = '/pin-setup';
  static const biometricSetup = '/biometric-setup';

  // Shell (bottom nav)
  static const home = '/home';
  static const history = '/history';
  static const transactionDetail = '/history/detail';
  static const rewards = '/rewards';
  static const profile = '/profile';

  static const scan = '/scan';

  // Wallet C1–C6
  static const wallet = '/wallet';
  static const walletTopUp = '/wallet/top-up';
  static const walletSend = '/wallet/send';
  static const walletRequest = '/wallet/request';
  static const walletQr = '/wallet/qr';

  // Shared payment flow (§4)
  static const paymentConfirm = '/payment/confirm';
  static const paymentReceipt = '/payment/receipt';

  // Remittance D1–D5
  static const remit = '/remit';
  static const remitBeneficiaries = '/remit/beneficiaries';
  static const remitAddBeneficiary = '/remit/beneficiaries/add';
  static const remitSend = '/remit/send';
  static const remitTracker = '/remit/tracker';

  // Bills E1–E9
  static const bills = '/bills';
  static const billsBiller = '/bills/biller';
  static const billsAccountEntry = '/bills/account-entry';
  static const billsSavedAccounts = '/bills/saved-accounts';
  static const billsDetail = '/bills/detail';
  static const billsRecharge = '/bills/recharge';
  static const billsSmartMeter = '/bills/smart-meter';

  // Government F1–F5
  static const gov = '/gov';
  static const govFines = '/gov/fines';
  static const govRenewal = '/gov/renewal';
  static const govJudiciary = '/gov/judiciary';
  static const govSocialProtection = '/gov/social-protection';

  // Insurance G1–G3
  static const insurance = '/insurance';
  static const insuranceQuote = '/insurance/quote';

  // Education H1–H3
  static const education = '/education';
  static const educationStudent = '/education/student';

  static const notifications = '/notifications';
  static const search = '/search';

  // AI Assistant K1
  static const assistant = '/assistant';

  // Car Rental L1–L5
  static const rentalSearch = '/rental/search';
  static const rentalResults = '/rental/results';
  static const rentalVehicleDetail = '/rental/vehicle-detail';
  static const rentalBookingReview = '/rental/booking-review';
  static const myRentals = '/rental/my-rentals';

  // Settings J4–J9
  static const settings = '/settings';
  static const settingsCards = '/settings/cards';
  static const settingsSecurity = '/settings/security';
  static const settingsBranchLocator = '/settings/branch-locator';
  static const settingsMeterReading = '/settings/meter-reading';
  static const settingsSupport = '/settings/support';
}
