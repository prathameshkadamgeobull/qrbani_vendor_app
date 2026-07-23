abstract class ReviewPayoutEvent {}

class LoadReviewPayout extends ReviewPayoutEvent {
  final double payoutAmount;

  LoadReviewPayout(this.payoutAmount);
}

class ConfirmPayout extends ReviewPayoutEvent {
}