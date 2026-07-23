class ReviewPayoutModel {
  final double availableBalance;
  final double payoutAmount;
  final double payoutFee;

  final String bankName;
  final String accountNumber;
  final String accountHolder;

  final String payoutMethod;

  const ReviewPayoutModel({
    required this.availableBalance,
    required this.payoutAmount,
    required this.payoutFee,
    required this.bankName,
    required this.accountNumber,
    required this.accountHolder,
    required this.payoutMethod,
  });

  double get receiveAmount => payoutAmount - payoutFee;
}