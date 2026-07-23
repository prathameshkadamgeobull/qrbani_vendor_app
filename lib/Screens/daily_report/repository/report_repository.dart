import 'package:qrbani_vender_app/models/top_selling_model.dart';

import '../../../models/daily_report_model.dart';


class ReportRepository {
  Future<ReportModel> getReport() async {
    await Future.delayed(const Duration(seconds: 1));

    return ReportModel(
      date: "20 May 2024",
      totalOrders: 120,
      completedOrders: 95,
      pendingOrders: 25,
      totalRevenue: 15450,

      chartData: const [
        20,
        40,
        30,
        60,
        45,
        80,
        70,
      ],

      topSellingItems: const [
        TopSellingModel(
          image: "assets/images/goat.png",
          name: "Goat",
          quantity: 20,
          amount: 25000,
        ),
        TopSellingModel(
          image: "assets/images/sheep.png",
          name: "Sheep",
          quantity: 15,
          amount: 18000,
        ),
      ],
    );
  }
}