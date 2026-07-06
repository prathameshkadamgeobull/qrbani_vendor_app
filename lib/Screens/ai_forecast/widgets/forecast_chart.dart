import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ForecastChart extends StatelessWidget {
  final List<double> low;
  final List<double> medium;
  final List<double> high;

  const ForecastChart({
    super.key,
    required this.low,
    required this.medium,
    required this.high,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 260,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: BarChart(
            BarChartData(
              maxY: 10,
              minY: 0,

              barTouchData: BarTouchData(
                enabled: true,
                touchCallback: (event, response) {
                  if (!event.isInterestedForInteractions ||
                      response?.spot == null) {
                    return;
                  }

                  final index = response!.spot!.touchedBarGroupIndex;
                  final y = response.spot!.touchedRodData.toY;
                  final l = low[index];
                  final m = medium[index];
                  final h = high[index];

                  if (y <= l) {
                    debugPrint("Low: $l");
                  } else if (y <= l + m) {
                    debugPrint("Medium: $m");
                  } else {
                    debugPrint("High: $h");
                  }
                },
              ),

              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 2,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.grey.shade200,
                    strokeWidth: 1,
                  );
                },
              ),
              borderData: FlBorderData(show: false),

              titlesData: FlTitlesData(
                topTitles: const AxisTitles(),
                rightTitles: const AxisTitles(),

                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 2,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: const TextStyle(fontSize: 12),
                      );
                    },
                  ),
                ),

                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      const labels = ["7", "8", "9", "10", "11", "12", "13"];

                      if (value.toInt() < 0 || value.toInt() >= labels.length) {
                        return const SizedBox.shrink();
                      }

                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          labels[value.toInt()],
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              barGroups: List.generate(low.length, (i) {
                final l = low[i];
                final m = medium[i];
                final h = high[i];

                final total = l + m + h;

                return BarChartGroupData(
                  x: i,
                  barRods: [
                    BarChartRodData(
                      toY: total,
                      width: 14,
                      borderRadius: BorderRadius.circular(6),

                      rodStackItems: [
                        // LOW → Light Orange
                        BarChartRodStackItem(
                          0,
                          l,
                          Colors.green,
                        ),

                        // MEDIUM → Light Green
                        BarChartRodStackItem(
                          l,
                          l + m,
                          Colors.orange, // light green
                        ),

                        // HIGH → Dark Green
                        BarChartRodStackItem(
                          l + m,
                          l + m + h,
                          Colors.red,
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // 🔥 THIS IS THE "Dhul-Hijjah" label you wanted
        const Text(
          "Dhul-Hijjah",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}