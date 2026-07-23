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
  PayoutModel copyWith({
    String? availableBalance,
    String? nextPayout,
    String? payoutMethod,
    String? bankName,
    String? accountNumber,
  }) {
    return PayoutModel(
      availableBalance: availableBalance ?? this.availableBalance,
      nextPayout: nextPayout ?? this.nextPayout,
      payoutMethod: payoutMethod ?? this.payoutMethod,
      bankName: bankName ?? this.bankName,
      accountNumber: accountNumber ?? this.accountNumber,
    );
  }
}