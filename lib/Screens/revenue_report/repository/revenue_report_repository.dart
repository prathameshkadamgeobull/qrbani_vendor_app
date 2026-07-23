import 'dart:math';

import '../../../models/revenue_report_model.dart';

class RevenueReportRepository {
  Future<RevenueReportModel> getRevenueReport({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));

    final random = Random();

    DateTime start =
        startDate ?? DateTime.now().subtract(const Duration(days: 6));

    int days = 7;

    if (startDate != null && endDate != null) {
      days = endDate.difference(startDate).inDays + 1;
    }

    final List<String> chartLabels = List.generate(
      days,
          (index) {
        final date = start.add(Duration(days: index));
        return "${date.day} ${_month(date.month)}";
      },
    );

    final List<double> chartValues = List.generate(
      days,
          (index) =>
          (90000 +
              random.nextInt(80000) +
              (index * 2500))
              .toDouble(),
    );

    final double totalRevenue =
    chartValues.fold<double>(0.0, (sum, value) => sum + value);

    final double productSales = totalRevenue * 0.896;
    final double shippingCharges = totalRevenue * 0.074;
    final double otherIncome = totalRevenue * 0.030;

    final double growthPercentage =
    (5 + random.nextDouble() * 20);

    return RevenueReportModel(
      totalRevenue: totalRevenue,
      growthPercentage: growthPercentage,
      productSales: productSales,
      shippingCharges: shippingCharges,
      otherIncome: otherIncome,
      productPercentage: 89.6,
      shippingPercentage: 7.4,
      otherPercentage: 3.0,
      chartValues: chartValues,
      chartLabels: chartLabels,
    );
  }

  String _month(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];

    return months[month - 1];
  }
}