abstract class PayoutEvent {}

class AmountChanged extends PayoutEvent {
  final String amount;

  AmountChanged(this.amount);
}

class SelectQuickAmount extends PayoutEvent {
  final double amount;

  SelectQuickAmount(this.amount);
}

class SubmitPayout extends PayoutEvent {}

class CompletePayout extends PayoutEvent {}