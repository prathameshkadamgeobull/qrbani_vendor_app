import 'package:qrbani_vender_app/models/recent_order_model.dart';

class OrderReportModel {

  final String dateRange;

  final int totalOrders;
  final int completed;
  final int inProgress;
  final int pending;
  final int cancelled;

  final double totalRevenue;


  final List<RecentOrderModel> recentOrders;

  final List<RecentOrderModel> allOrders;


  OrderReportModel({

    required this.dateRange,

    required this.totalOrders,
    required this.completed,
    required this.inProgress,
    required this.pending,
    required this.cancelled,

    required this.totalRevenue,

    required this.recentOrders,

    required this.allOrders,

  });

}