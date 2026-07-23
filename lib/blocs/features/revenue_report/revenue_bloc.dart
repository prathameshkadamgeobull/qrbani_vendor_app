import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/revenue_report/revenue_event.dart';
import 'package:qrbani_vender_app/blocs/features/revenue_report/revenue_state.dart';

import '../../../Screens/revenue_report/repository/revenue_report_repository.dart';



class RevenueReportBloc
    extends Bloc<RevenueReportEvent, RevenueReportState> {
  final RevenueReportRepository repository;

  RevenueReportBloc({
    required this.repository,
  }) : super(RevenueReportInitial()) {
    on<LoadRevenueReport>(_loadRevenueReport);
    on<RefreshRevenueReport>(_refreshRevenueReport);
  }

  Future<void> _loadRevenueReport(
      LoadRevenueReport event,
      Emitter<RevenueReportState> emit,
      ) async {
    emit(RevenueReportLoading());

    try {
      final report = await repository.getRevenueReport(
        startDate: event.startDate,
        endDate: event.endDate,
      );

      emit(RevenueReportLoaded(report));
    } catch (e) {
      emit(
        RevenueReportError(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _refreshRevenueReport(
      RefreshRevenueReport event,
      Emitter<RevenueReportState> emit,
      ) async {
    add(const LoadRevenueReport());
  }
}