import 'top_selling_model.dart';

class ReportModel {
  final String date;
  final int totalOrders;
  final int completedOrders;
  final int pendingOrders;
  final double totalRevenue;

  // Graph data
  final List<double> chartData;

  // Top selling list
  final List<TopSellingModel> topSellingItems;

  const ReportModel({
    required this.date,
    required this.totalOrders,
    required this.completedOrders,
    required this.pendingOrders,
    required this.totalRevenue,
    required this.chartData,
    required this.topSellingItems,
  });
}