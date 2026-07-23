import '../../../models/review_payout_model.dart';

class ReviewPayoutState {
  final bool isLoading;
  final bool isSuccess;
  final ReviewPayoutModel? payout;

  const ReviewPayoutState({
    required this.isLoading,
    required this.isSuccess,
    this.payout,
  });

  factory ReviewPayoutState.initial() {
    return const ReviewPayoutState(
      isLoading: true,
      isSuccess: false,
      payout: null,
    );
  }

  ReviewPayoutState copyWith({
    bool? isLoading,
    bool? isSuccess,
    ReviewPayoutModel? payout,
  }) {
    return ReviewPayoutState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      payout: payout ?? this.payout,
    );
  }
}