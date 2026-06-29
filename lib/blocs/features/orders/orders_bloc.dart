import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/order_model.dart';
import 'orders_event.dart';
import 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(const OrdersState()) {
    on<LoadOrders>(_loadOrders);
    on<RefreshOrders>(_refreshOrders);
    on<ChangeOrderStatus>(_changeStatus);
    on<ToggleOrderExpand>(_toggleExpand);
  }

  Future<void> _loadOrders(
      LoadOrders event,
      Emitter<OrdersState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 500));

    final orders = [

      OrderModel(
        orderNo: "QB-2024-0001258",
        animal: "Goat",
        pickupTime: "06:00 AM - 08:00 AM",
        customerName: "Mohand",
        location: "Mehfudali",
        amount: 650,
        status: "Pending",
      ),

      OrderModel(
        orderNo: "QB-2024-0001259",
        animal: "Sheep",
        pickupTime: "08:00 AM - 09:00 AM",
        customerName: "Ahmed",
        location: "Alwerd",
        amount: 750,
        status: "In Progress",
      ),

      OrderModel(
        orderNo: "QB-2024-0001260",
        animal: "Camel",
        pickupTime: "09:00 AM - 10:00 AM",
        customerName: "Bilal",
        location: "Bangalore",
        amount: 950,
        status: "Completed",
      ),

      OrderModel(
        orderNo: "QB-2024-0001261",
        animal: "Goat",
        pickupTime: "10:00 AM - 11:00 AM",
        customerName: "Salman",
        location: "Riyadh",
        amount: 680,
        status: "Pending",
      ),

      OrderModel(
        orderNo: "QB-2024-0001262",
        animal: "Camel",
        pickupTime: "11:00 AM - 12:00 PM",
        customerName: "Yasir",
        location: "Jeddah",
        amount: 1100,
        status: "Completed",
      ),
    ];

    emit(
      state.copyWith(
        isLoading: false,
        hijriDate: "10 Dhul-Hijjah 1446",
        allOrders: orders,
        filteredOrders: orders,
        selectedStatus: "All",
      ),
    );
  }
  void _toggleExpand(
      ToggleOrderExpand event,
      Emitter<OrdersState> emit,
      ) {
    if (state.expandedOrderNo == event.orderNo) {
      emit(
        state.copyWith(
          expandedOrderNo: "",
        ),
      );
    } else {
      emit(
        state.copyWith(
          expandedOrderNo: event.orderNo,
        ),
      );
    }
  }
  Future<void> _refreshOrders(
      RefreshOrders event,
      Emitter<OrdersState> emit,
      ) async {
    add(LoadOrders());
  }

  void _changeStatus(
      ChangeOrderStatus event,
      Emitter<OrdersState> emit,
      ) {
    List<OrderModel> filtered = [];

    if (event.status == "All") {
      filtered = state.allOrders;
    } else {
      filtered = state.allOrders.where((order) {
        return order.status == event.status;
      }).toList();
    }

    emit(
      state.copyWith(
        selectedStatus: event.status,
        filteredOrders: filtered,
        expandedOrderNo: "",
      ),
    );

  }
}