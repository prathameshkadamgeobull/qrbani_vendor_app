import 'package:flutter_bloc/flutter_bloc.dart';

import 'dasboard_state.dart';
import 'dashboard_event.dart';


class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    on<LoadDashboard>((event, emit) {
      emit(
        state.copyWith(
          vendorName: "Al Noor Slaughterhouse",
          hijriDate: "10 Dhu’l-Hijjah 1446",
          lastUpdated: "09:30 AM",
          currentDate: "10 Jun 2025",
          totalOrders: 120,
          completedOrders: 75,
          todayOrders: 18,
          inProgressOrders: 18,
          pendingOrders: 27,
        ),
      );
    });
  }
}