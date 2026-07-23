import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/payout_report_model.dart';
import 'payout_report_event.dart';
import 'payout_report_state.dart';

class PayoutReportBloc
    extends Bloc<PayoutReportEvent, PayoutReportState> {

  PayoutReportBloc() : super(PayoutReportInitial()) {

    on<LoadPayoutReport>(_loadReport);
    on<RefreshPayoutReport>(_refreshReport);
  }

  Future<void> _loadReport(
      LoadPayoutReport event,
      Emitter<PayoutReportState> emit,
      ) async {

    await _fetchData(
      emit,
      event.startDate,
      event.endDate,
    );
  }

  Future<void> _refreshReport(
      RefreshPayoutReport event,
      Emitter<PayoutReportState> emit,
      ) async {

    await _fetchData(
      emit,
      null,
      null,
    );
  }

  Future<void> _fetchData(
      Emitter<PayoutReportState> emit,
      DateTime? startDate,
      DateTime? endDate,
      ) async {

    emit(PayoutReportLoading());


    await Future.delayed(
      const Duration(seconds: 1),
    );


    double payout;


    if (startDate != null && endDate != null) {

      final days =
          endDate.difference(startDate).inDays + 1;

      payout = days * 5000.0;

    } else {

      payout = 78650.0;

    }



    final paidDate = endDate != null
        ? "${endDate.day}/${endDate.month}/${endDate.year}"
        : "20 May, 2024";



    // CREATE HISTORY FIRST
    List<PayoutHistory> history = [];



    if (startDate != null && endDate != null) {


      DateTime current = startDate;


      while (
      current.isBefore(endDate) ||
          current.isAtSameMomentAs(endDate)
      ) {


        history.add(

          PayoutHistory(

            date:
            "${current.day}/${current.month}/${current.year}",

            amount: 5000.0,

            status: "Paid",

          ),

        );


        current = current.add(
          const Duration(days: 1),
        );


      }


    } else {


      // Default history when no date selected

      history = [

        PayoutHistory(
          date: "20/05/2024",
          amount: 78650,
          status: "Paid",
        ),

        PayoutHistory(
          date: "13/05/2024",
          amount: 72300,
          status: "Paid",
        ),

        PayoutHistory(
          date: "06/05/2024",
          amount: 69850,
          status: "Paid",
        ),

      ];

    }

    final data = PayoutReportModel(

      totalPayout: payout,

      paidDate: paidDate,

      totalRevenue: payout * 2,

      platformFee: payout / 10,

      processingFee: payout / 20,

      otherDeductions: payout / 5,

      history: history,

    );


    emit(
      PayoutReportLoaded(data),
    );



  }
}