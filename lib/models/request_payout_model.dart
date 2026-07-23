class PayoutRequestModel {
  final double availableBalance;
  final double payoutAmount;

  final String bankName;
  final String accountNumber;
  final String accountHolder;

  final String payoutMethod;

  const PayoutRequestModel({
    required this.availableBalance,
    required this.payoutAmount,
    required this.bankName,
    required this.accountNumber,
    required this.accountHolder,
    required this.payoutMethod,
  });

  PayoutRequestModel copyWith({
    double? availableBalance,
    double? payoutAmount,
    String? bankName,
    String? accountNumber,
    String? accountHolder,
    String? payoutMethod,
  }) {
    return PayoutRequestModel(
      availableBalance: availableBalance ?? this.availableBalance,
      payoutAmount: payoutAmount ?? this.payoutAmount,
      bankName: bankName ?? this.bankName,
      accountNumber: accountNumber ?? this.accountNumber,
      accountHolder: accountHolder ?? this.accountHolder,
      payoutMethod: payoutMethod ?? this.payoutMethod,
    );
  }
}