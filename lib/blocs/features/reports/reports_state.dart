import 'package:equatable/equatable.dart';
import '../../../models/report_model.dart';

abstract class ReportsState extends Equatable {
  const ReportsState();

  @override
  List<Object> get props => [];
}

class ReportsInitial extends ReportsState {}

class ReportsLoaded extends ReportsState {
  final List<ReportModel> reports;

  const ReportsLoaded(this.reports);

  @override
  List<Object> get props => [reports];
}