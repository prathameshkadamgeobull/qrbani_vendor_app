import 'package:flutter/material.dart';

import '../../../models/daily_report_model.dart';
import 'summary_card.dart';

class ReportStats extends StatelessWidget {
  final ReportModel report;

  const ReportStats({
    super.key,
    required this.report,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1.18,
      ),
      children: [

        SummaryCard(
          title: "Total Orders",
          value: report.totalOrders.toString(),
          icon: Icons.shopping_bag_outlined,
        ),

        SummaryCard(
          title: "Revenue",
          value: "SAR ${report.totalRevenue.toStringAsFixed(0)}",
          icon: Icons.payments_outlined,
        ),

        SummaryCard(
          title: "Completed",
          value: report.completedOrders.toString(),
          icon: Icons.check_circle_outline,
        ),

        SummaryCard(
          title: "Pending",
          value: report.pendingOrders.toString(),
          icon: Icons.pending_actions_outlined,
        ),
      ],
    );
  }
}