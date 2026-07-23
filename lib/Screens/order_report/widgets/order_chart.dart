import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../Core/constants/app_colors.dart';

class OrderChart extends StatelessWidget {
  final int completed;
  final int pending;
  final int inProgress;
  final int cancelled;

  const OrderChart({
    super.key,
    required this.completed,
    required this.pending,
    required this.inProgress,
    required this.cancelled,
  });

  @override
  Widget build(BuildContext context) {
    final total = completed + pending + inProgress + cancelled;

    double percent(int value) =>
        total == 0 ? 0 : (value / total) * 100;

    return SizedBox(
        width: double.infinity,
        child: Container(
        padding: const EdgeInsets.all(2),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(14),
    border: Border.all(color: Colors.grey.shade200),
    ),


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Orders Overview",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /// Donut Chart
              SizedBox(
                width: 150,
                height: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 45,
                        startDegreeOffset: -90,
                        borderData: FlBorderData(show: false),
                        sections: [

                          PieChartSectionData(
                            value: completed.toDouble(),
                            color: AppColors.completed,
                            radius: 16,
                            title: '',
                          ),

                          PieChartSectionData(
                            value: inProgress.toDouble(),
                            color: AppColors.inProgress,
                            radius: 16,
                            title: '',
                          ),

                          PieChartSectionData(
                            value: pending.toDouble(),
                            color: AppColors.pending,
                            radius: 16,
                            title: '',
                          ),

                          PieChartSectionData(
                            value: cancelled.toDouble(),
                            color: AppColors.cancelled,
                            radius: 16,
                            title: '',
                          ),
                        ],
                      ),
                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Text(
                          "$total",
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        const Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 2),

              /// Legend
              Expanded(
                child: Column(
                  children: [

                    _legendItem(
                      AppColors.completed,
                      "Completed",
                      completed,
                      percent(completed),
                    ),

                    const SizedBox(height: 14),

                    _legendItem(
                      AppColors.inProgress,
                      "In Progress",
                      inProgress,
                      percent(inProgress),
                    ),

                    const SizedBox(height: 14),

                    _legendItem(
                      AppColors.pending,
                      "Pending",
                      pending,
                      percent(pending),
                    ),

                    const SizedBox(height: 14),

                    _legendItem(
                      AppColors.cancelled,
                      "Cancelled",
                      cancelled,
                      percent(cancelled),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
        ),
    );
  }

  Widget _legendItem(
      Color color,
      String title,
      int value,
      double percent,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 8),

          SizedBox(
            width: 70, // Adjust this value (80-100) as needed
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(width: 8),

          Text(
            "$value (${percent.toStringAsFixed(1)}%)",
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}