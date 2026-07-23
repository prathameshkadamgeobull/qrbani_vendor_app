import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../models/inventory_report_model.dart';

class StockStatusChart extends StatelessWidget {
  final StockReportModel report;

  const StockStatusChart({
    super.key,
    required this.report,
  });

  @override
  Widget build(BuildContext context) {

    final total = report.totalProducts;

    final double inStockPercent =
    total == 0 ? 0.0 : (report.inStock / total * 100).toDouble();

    final double lowStockPercent =
    total == 0 ? 0.0 : (report.lowStock / total * 100).toDouble();

    final double outStockPercent =
    total == 0 ? 0.0 : (report.outOfStock / total * 100).toDouble();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Stock Status",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),


          const SizedBox(height: 15),


          Row(
            children: [

              // Doughnut Chart
              SizedBox(
                height: 110,
                width: 110,

                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    PieChart(
                      PieChartData(

                        startDegreeOffset: -90,

                        centerSpaceRadius: 35,

                        sectionsSpace: 0,

                        borderData:
                        FlBorderData(show: false),


                        sections: [

                          PieChartSectionData(
                            value:
                            report.inStock.toDouble(),

                            color:
                            const Color(0xff087443),

                            radius: 18,

                            showTitle: false,
                          ),


                          PieChartSectionData(
                            value:
                            report.lowStock.toDouble(),

                            color:
                            const Color(0xffffa726),

                            radius: 18,

                            showTitle: false,
                          ),


                          PieChartSectionData(
                            value:
                            report.outOfStock.toDouble(),

                            color:
                            const Color(0xffff5722),

                            radius: 18,

                            showTitle: false,
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),

                      ],
                    )

                  ],
                ),
              ),



              const SizedBox(width: 25),



              // Legend
              Expanded(
                child: Column(
                  children: [

                    _legend(
                      color: const Color(0xff087443),
                      title: "In Stock",
                      value: report.inStock,
                      percent: inStockPercent,
                    ),


                    const SizedBox(height: 12),


                    _legend(
                      color: const Color(0xffffa726),
                      title: "Low Stock",
                      value: report.lowStock,
                      percent: lowStockPercent,
                    ),


                    const SizedBox(height: 12),


                    _legend(
                      color: const Color(0xffff5722),
                      title: "Out of Stock",
                      value: report.outOfStock,
                      percent: outStockPercent,
                    ),

                  ],
                ),
              )

            ],
          )

        ],
      ),
    );
  }



  Widget _legend({
    required Color color,
    required String title,
    required int value,
    required double percent,
  }) {

    return Row(
      children: [

        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),


        const SizedBox(width: 8),


        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),


        Text(
          "$value (${percent.toStringAsFixed(0)}%)",
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),

      ],
    );
  }
}