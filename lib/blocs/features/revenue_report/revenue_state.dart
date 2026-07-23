import 'package:equatable/equatable.dart';

import '../../../models/revenue_report_model.dart';

abstract class RevenueReportState extends Equatable {
  const RevenueReportState();

  @override
  List<Object?> get props => [];
}

/// Initial State
class RevenueReportInitial extends RevenueReportState {}

/// Loading State
class RevenueReportLoading extends RevenueReportState {}

/// Loaded State
class RevenueReportLoaded extends RevenueReportState {
  final RevenueReportModel report;

  const RevenueReportLoaded(this.report);

  @override
  List<Object?> get props => [report];
}

/// Error State
class RevenueReportError extends RevenueReportState {
  final String message;

  const RevenueReportError(this.message);

  @override
  List<Object?> get props => [message];
}