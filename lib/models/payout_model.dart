class PayoutModel {
  final String availableBalance;
  final String nextPayout;
  final String payoutMethod;
  final String bankName;
  final String accountNumber;

  PayoutModel({
    required this.availableBalance,
    required this.nextPayout,
    required this.payoutMethod,
    required this.bankName,
    required this.accountNumber,
  });
}