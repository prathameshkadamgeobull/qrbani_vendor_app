import 'package:equatable/equatable.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object?> get props => [];
}

/// Load Orders
class LoadOrders extends OrdersEvent {
  final String initialStatus;

  const LoadOrders({
    this.initialStatus = "All",
  });

  @override
  List<Object?> get props => [initialStatus];
}

/// Refresh Orders
class RefreshOrders extends OrdersEvent {}

/// Change Filter
class ChangeOrderStatus extends OrdersEvent {
  final String status;

  const ChangeOrderStatus(this.status);

  @override
  List<Object?> get props => [status];
}

/// Expand / Collapse Card
class ToggleOrderExpand extends OrdersEvent {
  final String orderNo;

  const ToggleOrderExpand(this.orderNo);

  @override
  List<Object?> get props => [orderNo];
}