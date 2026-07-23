import 'package:equatable/equatable.dart';

import '../../../models/tax_report_model.dart';

abstract class TaxReportState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TaxReportInitial extends TaxReportState {}

class TaxReportLoading extends TaxReportState {}

class TaxReportLoaded extends TaxReportState {
  final TaxReportModel report;

  TaxReportLoaded(this.report);

  @override
  List<Object?> get props => [report];
}

class TaxReportError extends TaxReportState {}