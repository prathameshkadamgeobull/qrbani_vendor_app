import 'package:equatable/equatable.dart';

abstract class UpcomingOrdersEvent extends Equatable {
  const UpcomingOrdersEvent();

  @override
  List<Object?> get props => [];
}

/// Load Orders
class LoadUpcomingOrders extends UpcomingOrdersEvent {}

/// Refresh Orders
class RefreshUpcomingOrders extends UpcomingOrdersEvent {}

/// Change Tab
class ChangeUpcomingTab extends UpcomingOrdersEvent {
  final String tab;

  const ChangeUpcomingTab(this.tab);

  @override
  List<Object?> get props => [tab];
}