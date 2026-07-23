class PayoutReportModel {

  final double totalPayout;
  final String paidDate;

  final double totalRevenue;
  final double platformFee;
  final double processingFee;
  final double otherDeductions;

  final List<PayoutHistory> history;


  PayoutReportModel({
    required this.totalPayout,
    required this.paidDate,
    required this.totalRevenue,
    required this.platformFee,
    required this.processingFee,
    required this.otherDeductions,
    required this.history,
  });


}


class PayoutHistory {

  final String date;
  final double amount;
  final String status;


  PayoutHistory({
    required this.date,
    required this.amount,
    required this.status,
  });

}