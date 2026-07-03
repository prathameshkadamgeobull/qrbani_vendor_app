import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../models/revenue_model.dart';

class RevenueChart extends StatelessWidget {
  final RevenueModel revenue;

  const RevenueChart({
    super.key,
    required this.revenue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffE8E8E8),
        ),
      ),
      child: LineChart(
        LineChartData(
          minY: 0,
          maxY: 200000,

          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 50000,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.shade300,
                strokeWidth: 1,
              );
            },
          ),

          borderData: FlBorderData(show: false),

          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 50000,
                reservedSize: 42,
                getTitlesWidget: (value, meta) {
                  return Text(
                    "${(value / 1000).toInt()}K",
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),

            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();

                  if (index >= revenue.chartDates.length) {
                    return const SizedBox();
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      revenue.chartDates[index],
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                revenue.chartValues.length,
                    (index) => FlSpot(
                  index.toDouble(),
                  revenue.chartValues[index],
                ),
              ),

              isCurved: true,

              color: const Color(0xff18A957),

              barWidth: 4,

              dotData: const FlDotData(
                show: false,
              ),

              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff18A957).withOpacity(0.35),
                    const Color(0xff18A957).withOpacity(0.05),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}