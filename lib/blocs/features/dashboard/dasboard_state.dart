class DashboardState {
  final String vendorName;
  final int totalOrders;
  final int completedOrders;
  final int todayOrders;
  final int inProgressOrders;
  final int pendingOrders;
  final double todayRevenue;
  final double monthGrowth;
  final String hijriDate;
  final String lastUpdated;
  final String currentDate;

  DashboardState({
    this.vendorName = "Al Noor Slaughterhouse",
    this.totalOrders = 120,
    this.completedOrders = 75,
    this.todayOrders = 18,
    this.inProgressOrders = 18,
    this.pendingOrders = 27,
    this.todayRevenue = 24350,
    this.monthGrowth = 12.5,
    this.hijriDate = "10 Dhu’l-Hijjah 1446",
    this.lastUpdated = "09:30 AM",
    this.currentDate = "10 Jun 2025",
  });

  DashboardState copyWith({
    String? vendorName,
    int? totalOrders,
    int? completedOrders,
    int? todayOrders,
    int? inProgressOrders,
    int? pendingOrders,
    double? todayRevenue,
    double? monthGrowth,
    String? hijriDate,
    String? lastUpdated,
    String? currentDate,
  }) {
    return DashboardState(
      vendorName: vendorName ?? this.vendorName,
      totalOrders: totalOrders ?? this.totalOrders,
      completedOrders: completedOrders ?? this.completedOrders,
      todayOrders: todayOrders ?? this.todayOrders,
      inProgressOrders: inProgressOrders ?? this.inProgressOrders,
      pendingOrders: pendingOrders ?? this.pendingOrders,
      todayRevenue: todayRevenue ?? this.todayRevenue,
      monthGrowth: monthGrowth ?? this.monthGrowth,
      hijriDate: hijriDate ?? this.hijriDate,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      currentDate: currentDate ?? this.currentDate,
    );
  }
}