import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TaxChart extends StatelessWidget {
  final List<double> values;
  final List<String> labels;

  const TaxChart({
    super.key,
    required this.values,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    final int count = values.length < labels.length
        ? values.length
        : labels.length;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tax Overview",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 200,
            child: BarChart(
                BarChartData(
                  maxY: 8000,

                  alignment: BarChartAlignment.spaceAround,

                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipRoundedRadius: 10,

                      // For fl_chart 1.x
                      getTooltipColor: (group) => Colors.white,

                      tooltipPadding: const EdgeInsets.all(8),

                      getTooltipItem: (
                          group,
                          groupIndex,
                          rod,
                          rodIndex,
                          ) {
                        return BarTooltipItem(
                          "SAR ${rod.toY.toStringAsFixed(0)}",
                          const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        );
                      },
                    ),
                  ),

                  borderData: FlBorderData(
                  show: true,
                  border: Border(
                    left: BorderSide(color: Colors.grey.shade300),
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 2000,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.shade200,
                      strokeWidth: 1,
                    );
                  },
                ),

                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 35,
                      showTitles: true,
                      interval: 2000,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value == 0
                              ? "0"
                              : "${(value / 1000).toInt()}K",
                          style: const TextStyle(fontSize: 11),
                        );
                      },
                    ),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 35,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();

                        if (index >= count) {
                          return const SizedBox();
                        }

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            labels[index],
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                barGroups: List.generate(
                  count,
                      (index) {
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: values[index],
                          width: 18,
                          color: const Color(0xff168C4B),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}