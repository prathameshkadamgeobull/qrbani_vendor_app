import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RevenueSummaryCard extends StatelessWidget {
  final double totalRevenue;
  final double growthPercentage;
  final int selectedDays;

  const RevenueSummaryCard({
    super.key,
    required this.totalRevenue,
    required this.growthPercentage ,
    required this.selectedDays,
  });

  String get formattedRevenue =>
      NumberFormat('#,##0').format(totalRevenue);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff0C6A34),
            Color(0xff09562B),
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Revenue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "SAR ${formattedRevenue}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "${growthPercentage >= 0 ? '+' : ''}${growthPercentage.toStringAsFixed(1)}% vs previous $selectedDays day${selectedDays > 1 ? 's' : ''}",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.attach_money_rounded,
              color: Color(0xff0C6A34),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}