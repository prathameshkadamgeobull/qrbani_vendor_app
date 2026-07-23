import 'package:flutter/material.dart';

import '../../../models/payout_report_model.dart';

class PayoutOverviewCard extends StatelessWidget {
  final PayoutReportModel report;

  const PayoutOverviewCard({
    super.key,
    required this.report,
  });

  Widget _buildRow(
      String title,
      String value, {
        bool isTotal = false,
        bool isNegative = false,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight:
                isTotal ? FontWeight.w600 : FontWeight.w400,
                color: isTotal ? Colors.green : Colors.black87,
              ),
            ),
          ),
          Text(
            "${isNegative ? "-" : ""}SAR $value",
            style: TextStyle(
              fontSize: 14,
              fontWeight:
              isTotal ? FontWeight.bold : FontWeight.w500,
              color: isTotal ? Colors.green : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Payout Overview",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            _buildRow(
              "Total Revenue",
              report.totalRevenue.toStringAsFixed(0),
            ),

            _buildRow(
              "Platform Fee",
              report.platformFee.toStringAsFixed(0),
              isNegative: true,
            ),

            _buildRow(
              "Processing Fee",
              report.processingFee.toStringAsFixed(0),
              isNegative: true,
            ),

            _buildRow(
              "Other Deductions",
              report.otherDeductions.toStringAsFixed(0),
              isNegative: true,
            ),

            const Divider(height: 25),

            _buildRow(
              "Total Payout",
              report.totalPayout.toStringAsFixed(0),
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }
}