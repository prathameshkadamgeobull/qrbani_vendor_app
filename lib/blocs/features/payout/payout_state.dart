import '../../../models/payout_model.dart';

class PayoutState {
  final bool isLoading;
  final PayoutModel? payout;
  final String? error;

  const PayoutState({
    this.isLoading = false,
    this.payout,
    this.error,
  });

  PayoutState copyWith({
    bool? isLoading,
    PayoutModel? payout,
    String? error,
  }) {
    return PayoutState(
      isLoading: isLoading ?? this.isLoading,
      payout: payout ?? this.payout,
      error: error ?? this.error,
    );
  }
}