import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Screens/daily_report/repository/report_repository.dart';
import 'daily_report_event.dart';
import 'daily_report_state.dart';



class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepository repository;

  ReportBloc(this.repository) : super(ReportInitial()) {
    on<LoadReport>(_loadReport);

    on<ChangeReportDate>(_changeDate);
  }

  Future<void> _loadReport(
      LoadReport event,
      Emitter<ReportState> emit,
      ) async {
    emit(ReportLoading());

    try {
      final report = await repository.getReport();

      emit(
        ReportLoaded(
          report: report,
          selectedDate: DateTime.now(),
        ),
      );
    } catch (e) {
      emit(
        ReportError(e.toString()),
      );
    }
  }

  Future<void> _changeDate(
      ChangeReportDate event,
      Emitter<ReportState> emit,
      ) async {
    emit(ReportLoading());

    try {
      final report = await repository.getReport();

      emit(
        ReportLoaded(
          report: report,
          selectedDate: event.selectedDate,
        ),
      );
    } catch (e) {
      emit(
        ReportError(e.toString()),
      );
    }
  }
}