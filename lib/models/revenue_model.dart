class RevenueModel {
  final double todayRevenue;
  final double monthRevenue;
  final double totalRevenue;
  final double growthPercentage;

  final List<double> chartValues;
  final List<String> chartDates;

  const RevenueModel({
    required this.todayRevenue,
    required this.monthRevenue,
    required this.totalRevenue,
    required this.growthPercentage,
    required this.chartValues,
    required this.chartDates,
  });
}