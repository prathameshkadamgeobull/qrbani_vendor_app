import '../../../models/payout_model.dart';

class PayoutState {
  final bool isLoading;
  final PayoutModel? payout;
  final String? error;
  final double amount;

  const PayoutState({
    this.isLoading = false,
    this.payout,
    this.error,
    this.amount = 0,

  });




  PayoutState copyWith({
    bool? isLoading,
    PayoutModel? payout,
    String? error,
    double? amount,
  }) {
    return PayoutState(
      isLoading: isLoading ?? this.isLoading,
      payout: payout ?? this.payout,
      error: error ?? this.error,
      amount: amount ?? this.amount,
    );
  }
  }
