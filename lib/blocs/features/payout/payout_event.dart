abstract class PayoutEvent {}

class LoadPayout extends PayoutEvent {}

class RefreshPayout extends PayoutEvent {}

class RequestPayout extends PayoutEvent {
  final double amount;

  RequestPayout(this.amount);
}
class DeductBalance extends PayoutEvent {
  final double amount;

  DeductBalance(this.amount);
}