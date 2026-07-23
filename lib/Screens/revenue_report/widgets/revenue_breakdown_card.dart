import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/revenue_report_model.dart';

class RevenueBreakdownCard extends StatelessWidget {
  final RevenueReportModel report;

  const RevenueBreakdownCard({
    super.key,
    required this.report,
  });

  String formatAmount(double value) {
    return NumberFormat("#,##0").format(value);
  }

  Widget _buildRow({
    required String title,
    required double amount,
    required double percentage,
    bool isTotal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight:
                isTotal ? FontWeight.w700 : FontWeight.w500,
                color: isTotal
                    ? const Color(0xff168C4B)
                    : Colors.black87,
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "SAR ${formatAmount(amount)}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isTotal
                      ? const Color(0xff168C4B)
                      : Colors.black,
                ),
              ),
            ),
          ),

          const SizedBox(width: 18),

          SizedBox(
            width: 42,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                isTotal
                    ? ""
                    : "${percentage.toStringAsFixed(1)}%",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Revenue Breakdown",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 12),

          _buildRow(
            title: "Product Sales",
            amount: report.productSales,
            percentage: report.productPercentage,
          ),

          _buildRow(
            title: "Shipping Charges",
            amount: report.shippingCharges,
            percentage: report.shippingPercentage,
          ),

          _buildRow(
            title: "Other Income",
            amount: report.otherIncome,
            percentage: report.otherPercentage,
          ),

          const SizedBox(height: 8),

          Divider(
            color: Colors.grey.shade300,
            height: 1,
          ),

          const SizedBox(height: 8),

          _buildRow(
            title: "Total",
            amount: report.totalRevenue,
            percentage: 0,
            isTotal: true,
          ),
        ],
      ),
    );
  }
}