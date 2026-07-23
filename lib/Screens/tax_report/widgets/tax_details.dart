import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/tax_report_model.dart';

class TaxDetails extends StatelessWidget {
  final TaxReportModel report;

  const TaxDetails({
    super.key,
    required this.report,
  });

  String formatAmount(num amount) {
    final formatter = NumberFormat('#,##0');
    return formatter.format(amount);
  }

  Widget _taxRow({
    required String title,
    required String value,
    bool isTotal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: isTotal ? Colors.green.shade700 : Colors.grey.shade700,
              fontWeight:
              isTotal ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isTotal ? Colors.green.shade700 : Colors.black87,
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
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tax Details",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          _taxRow(
            title: "CGST (9%)",
            value: "SAR ${formatAmount(report.cgst)}",
          ),

          _taxRow(
            title: "SGST (9%)",
            value: "SAR ${formatAmount(report.sgst)}",
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(
              thickness: 1,
              height: 1,
            ),
          ),

          _taxRow(
            title: "Total",
            value: "SAR ${formatAmount(report.totalCollected)}",
            isTotal: true,
          ),
        ],
      ),
    );
  }
}