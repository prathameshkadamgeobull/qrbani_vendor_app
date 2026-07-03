abstract class PayoutEvent {}

class LoadPayout extends PayoutEvent {}

class RefreshPayout extends PayoutEvent {}

class RequestPayout extends PayoutEvent {}