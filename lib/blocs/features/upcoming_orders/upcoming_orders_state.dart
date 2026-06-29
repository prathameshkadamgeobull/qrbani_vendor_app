import 'package:equatable/equatable.dart';

import '../../../models/upcoming_order_model.dart';

class UpcomingOrdersState extends Equatable {
  final bool isLoading;

  final List<UpcomingOrderModel> allOrders;

  final List<UpcomingOrderModel> filteredOrders;

  final String selectedTab;

  const UpcomingOrdersState({
    this.isLoading = false,
    this.allOrders = const [],
    this.filteredOrders = const [],
    this.selectedTab = "Tomorrow",
  });

  UpcomingOrdersState copyWith({
    bool? isLoading,
    List<UpcomingOrderModel>? allOrders,
    List<UpcomingOrderModel>? filteredOrders,
    String? selectedTab,
  }) {
    return UpcomingOrdersState(
      isLoading: isLoading ?? this.isLoading,
      allOrders: allOrders ?? this.allOrders,
      filteredOrders: filteredOrders ?? this.filteredOrders,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    allOrders,
    filteredOrders,
    selectedTab,
  ];
}