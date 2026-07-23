import 'package:equatable/equatable.dart';

import '../../../models/daily_report_model.dart';


abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object?> get props => [];
}

/// Initial
class ReportInitial extends ReportState {}

/// Loading
class ReportLoading extends ReportState {}

/// Loaded
class ReportLoaded extends ReportState {
  final ReportModel report;
  final DateTime selectedDate;

  const ReportLoaded({
    required this.report,
    required this.selectedDate,
  });

  @override
  List<Object?> get props => [
    report,
    selectedDate,
  ];
}

/// Error
class ReportError extends ReportState {
  final String message;

  const ReportError(this.message);

  @override
  List<Object?> get props => [message];
}