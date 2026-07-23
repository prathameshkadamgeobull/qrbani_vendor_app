import 'package:equatable/equatable.dart';

import '../../../models/order_model.dart';

class OrdersState extends Equatable {
  final bool isLoading;

  final List<OrderModel> allOrders;

  final List<OrderModel> filteredOrders;

  final String selectedStatus;

  final String hijriDate;

  /// Expanded Order
  final String expandedOrderNo;

  const OrdersState({
    this.isLoading = false,
    this.allOrders = const [],
    this.filteredOrders = const [],
    this.selectedStatus = "All",
    this.hijriDate = "",
    this.expandedOrderNo = "",
  });


  OrdersState copyWith({
    bool? isLoading,
    List<OrderModel>? allOrders,
    List<OrderModel>? filteredOrders,
    String? selectedStatus,
    String? hijriDate,
    String? expandedOrderNo,
  }) {
    return OrdersState(
      isLoading: isLoading ?? this.isLoading,
      allOrders: allOrders ?? this.allOrders,
      filteredOrders: filteredOrders ?? this.filteredOrders,
      selectedStatus: selectedStatus ?? this.selectedStatus,
      hijriDate: hijriDate ?? this.hijriDate,
      expandedOrderNo: expandedOrderNo ?? this.expandedOrderNo,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    allOrders,
    filteredOrders,
    selectedStatus,
    hijriDate,
    expandedOrderNo,
  ];

}