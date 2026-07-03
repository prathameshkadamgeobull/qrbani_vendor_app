import 'package:equatable/equatable.dart';

abstract class ReportsEvent extends Equatable {
  const ReportsEvent();

  @override
  List<Object> get props => [];
}

class LoadReports extends ReportsEvent {}

class ReportClicked extends ReportsEvent {
  final String reportName;

  const ReportClicked(this.reportName);

  @override
  List<Object> get props => [reportName];
}