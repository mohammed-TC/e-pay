/// Every payment type that flows through the shared payment flow —
/// architecture.md §4.
enum TxnType {
  bill,
  prepaidRecharge,
  smartMeterRecharge,
  trafficFine,
  vehicleRenewal,
  judiciary,
  socialProtection,
  insurance,
  education,
  walletTopup,
  walletSend,
  walletRequest,
  remittance,
  qrPay,
}
