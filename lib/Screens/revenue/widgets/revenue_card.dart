import 'package:flutter/material.dart';

class RevenueSummaryCard extends StatelessWidget {
  final String title;
  final double amount;
  final double? growth;

  const RevenueSummaryCard({
    super.key,
    required this.title,
    required this.amount,
    this.growth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xffE8E8E8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xff666666),
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 12),

          /// Revenue
          Text(
            "SAR ${amount.toStringAsFixed(0)}",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          if (growth != null) ...[
            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(
                  Icons.arrow_upward,
                  color: Color(0xff19A55A),
                  size: 18,
                ),

                const SizedBox(width: 5),

                Text(
                  "+${growth!.toStringAsFixed(1)}% vs last month",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff19A55A),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}