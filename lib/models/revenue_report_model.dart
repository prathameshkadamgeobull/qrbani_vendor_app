class RevenueReportModel {
  final double totalRevenue;
  final double growthPercentage;

  final double shippingCharges;
  final double otherIncome;
  final double productSales;

  final double productPercentage;
  final double shippingPercentage;
  final double otherPercentage;

  final List<double> chartValues;
  final List<String> chartLabels;

  RevenueReportModel({
    required this.totalRevenue,
    required this.growthPercentage,
    required this.productSales,
    required this.shippingCharges,
    required this.otherIncome,
    required this.productPercentage,
    required this.shippingPercentage,
    required this.otherPercentage,
    required this.chartValues,
    required this.chartLabels,
  });

  factory RevenueReportModel.fromJson(Map<String, dynamic> json) {
    return RevenueReportModel(
      totalRevenue: (json['totalRevenue'] ?? 0).toDouble(),
      growthPercentage: (json['growthPercentage'] ?? 0).toDouble(),
      productSales: (json['productSales'] ?? 0).toDouble(),
      shippingCharges: (json['shippingCharges'] ?? 0).toDouble(),
      otherIncome: (json['otherIncome'] ?? 0).toDouble(),
      productPercentage: (json['productPercentage'] ?? 0).toDouble(),
      shippingPercentage: (json['shippingPercentage'] ?? 0).toDouble(),
      otherPercentage: (json['otherPercentage'] ?? 0).toDouble(),
      chartValues: List<double>.from(
        (json['chartValues'] ?? []).map((e) => e.toDouble()),
      ),
      chartLabels: List<String>.from(
        json['chartLabels'] ?? [],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "totalRevenue": totalRevenue,
      "growthPercentage": growthPercentage,
      "productSales": productSales,
      "shippingCharges": shippingCharges,
      "otherIncome": otherIncome,
      "productPercentage": productPercentage,
      "shippingPercentage": shippingPercentage,
      "otherPercentage": otherPercentage,
      "chartValues": chartValues,
      "chartLabels": chartLabels,
    };
  }
}