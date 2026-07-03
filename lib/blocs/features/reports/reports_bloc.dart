import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/report_model.dart';
import 'reports_event.dart';
import 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  ReportsBloc() : super(ReportsInitial()) {
    on<LoadReports>(_loadReports);
    on<ReportClicked>(_reportClicked);
  }

  void _loadReports(
      LoadReports event,
      Emitter<ReportsState> emit,
      ) {
    emit(
      ReportsLoaded(
        [
          ReportModel(
            title: "Daily Report",
            icon: Icons.calendar_today_outlined,
          ),
          ReportModel(
            title: "Orders Report",
            icon: Icons.receipt_long_outlined,
          ),
          ReportModel(
            title: "Inventory Report",
            icon: Icons.inventory_2_outlined,
          ),
          ReportModel(
            title: "Revenue Report",
            icon: Icons.bar_chart_outlined,
          ),
          ReportModel(
            title: "Payout Report",
            icon: Icons.account_balance_wallet_outlined,
          ),
          ReportModel(
            title: "Tax Report",
            icon: Icons.request_quote_outlined,
          ),
        ],
      ),
    );
  }

  void _reportClicked(
      ReportClicked event,
      Emitter<ReportsState> emit,
      ) {}
}