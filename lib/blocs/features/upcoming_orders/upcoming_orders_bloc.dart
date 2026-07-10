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
      /// Tomorrow
      UpcomingOrderModel(
        hijriDate: "11 Dhul-Hijjah 1446",
        totalOrders: 96,
        butcherCount: 2,
        goatCount: 25,
        sheepCount: 12,
        camelCount: 61,
      ),
      UpcomingOrderModel(
        hijriDate: "11 Dhul-Hijjah 1446",
        totalOrders: 82,
        butcherCount: 3,
        goatCount: 20,
        sheepCount: 18,
        camelCount: 44,
      ),
      UpcomingOrderModel(
        hijriDate: "11 Dhul-Hijjah 1446",
        totalOrders: 105,
        butcherCount: 4,
        goatCount: 40,
        sheepCount: 15,
        camelCount: 50,
      ),

      /// Day After
      UpcomingOrderModel(
        hijriDate: "12 Dhul-Hijjah 1446",
        totalOrders: 110,
        butcherCount: 2,
        goatCount: 25,
        sheepCount: 12,
        camelCount: 61,
      ),
      UpcomingOrderModel(
        hijriDate: "12 Dhul-Hijjah 1446",
        totalOrders: 90,
        butcherCount: 3,
        goatCount: 32,
        sheepCount: 14,
        camelCount: 44,
      ),
      UpcomingOrderModel(
        hijriDate: "12 Dhul-Hijjah 1446",
        totalOrders: 120,
        butcherCount: 5,
        goatCount: 48,
        sheepCount: 22,
        camelCount: 50,
      ),

      /// This Week
      UpcomingOrderModel(
        hijriDate: "13 Dhul-Hijjah 1446",
        totalOrders: 95,
        butcherCount: 2,
        goatCount: 25,
        sheepCount: 12,
        camelCount: 61,
      ),
      UpcomingOrderModel(
        hijriDate: "13 Dhul-Hijjah 1446",
        totalOrders: 87,
        butcherCount: 3,
        goatCount: 28,
        sheepCount: 17,
        camelCount: 42,
      ),
      UpcomingOrderModel(
        hijriDate: "14 Dhul-Hijjah 1446",
        totalOrders: 98,
        butcherCount: 4,
        goatCount: 31,
        sheepCount: 19,
        camelCount: 48,
      ),
      UpcomingOrderModel(
        hijriDate: "14 Dhul-Hijjah 1446",
        totalOrders: 130,
        butcherCount: 6,
        goatCount: 50,
        sheepCount: 30,
        camelCount: 50,
      ),
      UpcomingOrderModel(
        hijriDate: "15 Dhul-Hijjah 1446",
        totalOrders: 102,
        butcherCount: 3,
        goatCount: 36,
        sheepCount: 24,
        camelCount: 42,
      ),
      UpcomingOrderModel(
        hijriDate: "16 Dhul-Hijjah 1446",
        totalOrders: 115,
        butcherCount: 5,
        goatCount: 45,
        sheepCount: 20,
        camelCount: 50,
      ),
      UpcomingOrderModel(
        hijriDate: "17 Dhul-Hijjah 1446",
        totalOrders: 108,
        butcherCount: 4,
        goatCount: 38,
        sheepCount: 25,
        camelCount: 45,
      ),
    ];
    emit(
      state.copyWith(
        isLoading: false,
        allOrders: orders,
        filteredOrders: orders
            .where((e) => e.hijriDate == "11 Dhul-Hijjah 1446")
            .toList(),
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
    List<UpcomingOrderModel> filtered = [];

    switch (event.tab) {
      case "Tomorrow":
        filtered = state.allOrders
            .where((e) => e.hijriDate == "11 Dhul-Hijjah 1446")
            .toList();
        break;

      case "Day After":
        filtered = state.allOrders
            .where((e) => e.hijriDate == "12 Dhul-Hijjah 1446")
            .toList();
        break;

      case "This Week":
        filtered = state.allOrders;
        break;
    }

    emit(
      state.copyWith(
        selectedTab: event.tab,
        filteredOrders: filtered,
      ),
    );
  }
}