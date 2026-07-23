abstract class PayoutReportEvent{}



class LoadPayoutReport extends PayoutReportEvent{

  final DateTime? startDate;
  final DateTime? endDate;

  LoadPayoutReport({
    this.startDate,
    this.endDate,
  });
}



class RefreshPayoutReport extends PayoutReportEvent{}