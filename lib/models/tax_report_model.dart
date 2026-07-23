class TaxReportModel {
  final double totalCollected;
  final double totalPaid;
  final double cgst;
  final double sgst;

  TaxReportModel({
    required this.totalCollected,
    required this.totalPaid,
    required this.cgst,
    required this.sgst,
  });
}