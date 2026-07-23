import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/tax_report/tax_report_event.dart';
import 'package:qrbani_vender_app/blocs/features/tax_report/tax_report_state.dart';

import '../../../models/tax_report_model.dart';

class TaxReportBloc extends Bloc<TaxReportEvent, TaxReportState> {
  TaxReportBloc() : super(TaxReportInitial()) {
    on<LoadTaxReport>(_loadTaxReport);
  }

  Future<void> _loadTaxReport(
      LoadTaxReport event,
      Emitter<TaxReportState> emit,
      ) async {
    emit(TaxReportLoading());

    await Future.delayed(const Duration(milliseconds: 500));

    TaxReportModel report;

    if (event.startDate != null && event.endDate != null) {
      final days =
          event.endDate!.difference(event.startDate!).inDays + 1;

      final collected = days * 1800.0;
      final paid = days * 1500.0;

      report = TaxReportModel(
        totalCollected: collected,
        totalPaid: paid,
        cgst: collected * 0.09,
        sgst: collected * 0.09,
      );
    } else {
      report = TaxReportModel(
        totalCollected: 13400,
        totalPaid: 10800,
        cgst: 6700,
        sgst: 6700,
      );
    }

    emit(TaxReportLoaded(report));
  }
}