import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Screens/inventory_report/repository/inventory_report_repository.dart';
import 'inventory_report_event.dart';
import 'inventory_report_state.dart';


class StockReportBloc extends Bloc<StockReportEvent, StockReportState> {
  final StockReportRepository repository;

  StockReportBloc(this.repository) : super(const StockReportInitial()) {
    on<LoadStockReport>(_onLoadStockReport);
    on<RefreshStockReport>(_onRefreshStockReport);
    on<ChangeStockReportDate>(_onChangeStockReportDate);
    on<ApplyStockFilter>(_onApplyStockFilter);
  }

  Future<void> _onLoadStockReport(
      LoadStockReport event,
      Emitter<StockReportState> emit,
      ) async {
    emit(const StockReportLoading());

    try {
      final selectedDate = DateTime.now();

      final report = await repository.getStockReport(
        date: selectedDate,
      );

      emit(
        StockReportLoaded(
          report: report,
          selectedDate: selectedDate,
          selectedFilter: "All",
        ),
      );
    } catch (e) {
      emit(StockReportError(e.toString()));
    }
  }

  Future<void> _onRefreshStockReport(
      RefreshStockReport event,
      Emitter<StockReportState> emit,
      ) async {
    if (state is! StockReportLoaded) return;

    final currentState = state as StockReportLoaded;

    emit(const StockReportLoading());

    try {
      final report = await repository.getStockReport(
        date: currentState.selectedDate,
      );

      emit(
        currentState.copyWith(
          report: report,
        ),
      );
    } catch (e) {
      emit(StockReportError(e.toString()));
    }
  }

  Future<void> _onChangeStockReportDate(
      ChangeStockReportDate event,
      Emitter<StockReportState> emit,
      ) async {
    if (state is! StockReportLoaded) return;

    final currentState = state as StockReportLoaded;

    emit(const StockReportLoading());

    try {
      final report = await repository.getStockReport(
        date: event.selectedDate,
      );

      emit(
        currentState.copyWith(
          report: report,
          selectedDate: event.selectedDate,
        ),
      );
    } catch (e) {
      emit(StockReportError(e.toString()));
    }
  }

  Future<void> _onApplyStockFilter(
      ApplyStockFilter event,
      Emitter<StockReportState> emit,
      ) async {
    if (state is! StockReportLoaded) return;

    final currentState = state as StockReportLoaded;

    emit(
      currentState.copyWith(
        selectedFilter: event.filter,
      ),
    );
  }
}