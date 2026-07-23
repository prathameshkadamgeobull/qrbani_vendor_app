abstract class TaxReportEvent {}

class LoadTaxReport extends TaxReportEvent {
  final DateTime? startDate;
  final DateTime? endDate;

  LoadTaxReport({
    this.startDate,
    this.endDate,
  });
}