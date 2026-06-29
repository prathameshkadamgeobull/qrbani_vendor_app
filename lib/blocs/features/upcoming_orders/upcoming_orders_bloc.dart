import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/upcoming_order_model.dart';
import 'upcoming_orders_event.dart';
import 'upcoming_orders_state.dart';

  class UpcomingOrdersBloc
    extends Bloc<UpcomingOrdersEvent, UpcomingOrdersState> {
  UpcomingOrdersBloc() : super(const UpcomingOrdersState()) {
    on<LoadUpcomingOrders>(_loadOrders);
    on<RefreshUpcomingOrders>(_refreshOrders);
    on<ChangeUpcomingTab>(_changeTab);
  }

  Future<void> _loadOrders(
      LoadUpcomingOrders event,
      Emitter<UpcomingOrdersState> emit,
      ) async {

    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 500));

    final orders = [

      UpcomingOrderModel(
        hijriDate: "11 Dhul-Hijjah 1446",
        totalOrders: 96,
        butcherCount: 2,
        goatCount: 25,
        sheepCount: 12,
        camelCount: 18,
        completedCount: 61,
      ),

      UpcomingOrderModel(
        hijriDate: "12 Dhul-Hijjah 1446",
        totalOrders: 102,
        butcherCount: 3,
        goatCount: 30,
        sheepCount: 22,
        camelCount: 0,
        completedCount: 50,
      ),

      UpcomingOrderModel(
        hijriDate: "13 Dhul-Hijjah 1446",
        totalOrders: 80,
        butcherCount: 2,
        goatCount: 0,
        sheepCount: 40,
        camelCount: 10,
        completedCount: 30,
      ),
    ];

    emit(
      state.copyWith(
        isLoading: false,
        allOrders: orders,
        filteredOrders: orders,
        selectedTab: "Tomorrow",
      ),
    );
  }

  Future<void> _refreshOrders(
      RefreshUpcomingOrders event,
      Emitter<UpcomingOrdersState> emit,
      ) async {
    add(LoadUpcomingOrders());
  }

  void _changeTab(
      ChangeUpcomingTab event,
      Emitter<UpcomingOrdersState> emit,
      ) {

    // For now all tabs show same data.
    // Later you can filter API response here.

    emit(
      state.copyWith(
        selectedTab: event.tab,
        filteredOrders: state.allOrders,
      ),
    );
  }
}