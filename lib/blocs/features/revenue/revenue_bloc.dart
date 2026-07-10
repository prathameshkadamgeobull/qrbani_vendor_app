import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/revenue_model.dart';
import 'revenue_event.dart';
import 'revenue_state.dart';

class RevenueBloc extends Bloc<RevenueEvent, RevenueState> {
  RevenueBloc() : super(const RevenueState()) {
    on<LoadRevenue>(_loadRevenue);
  }

  Future<void> _loadRevenue(
      LoadRevenue event,
      Emitter<RevenueState> emit,
      ) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    /// Simulate API
    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    emit(
      state.copyWith(
        isLoading: false,
        revenue: const RevenueModel(
          todayRevenue: 24350,
          monthRevenue: 165450,
          totalRevenue: 485750,
          growthPercentage: 12.5,

          chartValues: [
            80000,
            65000,
            125000, 
            105000,
            118000,
            160000,
            135000,
            170000,
          ],

          chartDates: [
            "5 Jun",
            "6 Jun",
            "7 Jun",
            "8 Jun",
            "9 Jun",
            "10 Jun",
            "11 Jun",
            "12 Jun",
          ],
        ),
      ),
    );
  }
}