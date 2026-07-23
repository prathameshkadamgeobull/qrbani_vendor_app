import 'package:equatable/equatable.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object?> get props => [];
}

/// Load Report
class LoadReport extends ReportEvent {
  const LoadReport();
}

/// Change Date
class ChangeReportDate extends ReportEvent {
  final DateTime selectedDate;

  const ChangeReportDate(this.selectedDate);

  @override
  List<Object?> get props => [selectedDate];
}