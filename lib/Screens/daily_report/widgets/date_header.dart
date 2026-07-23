import 'package:flutter/material.dart';

import '../../../models/daily_report_model.dart';

class ReportHeader extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onDateTap;
  final ReportModel report;

  const ReportHeader({
    super.key,
    required this.selectedDate,
    required this.onDateTap,
    required this.report,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full available width
      height: 258, // Decrease height (adjust as needed)

      margin: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 10,
      ),

      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: const Color(0xff056B3D),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          /// Header Row
          Row(
            children: [

              const Text(
                "Date",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const Spacer(),

              InkWell(
                onTap: onDateTap,
                child: Container(
                  height: 32,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white24,
                    ),
                  ),

                  child: Row(
                    children: [

                      Text(
                        "${selectedDate.day} ${_month(selectedDate.month)}, ${selectedDate.year}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(width: 6),

                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            crossAxisCount: 2,

            crossAxisSpacing: 8,
            mainAxisSpacing: 8,

            childAspectRatio: 2.4, // Wider cards with less height

            children: [

              _summaryCard(
                title: "Total Orders",
                value: report.totalOrders.toString(),
              ),

              _summaryCard(
                title: "Total Revenue",
                value: "SAR ${report.totalRevenue.toStringAsFixed(0)}",
              ),

              _summaryCard(
                title: "Completed Orders",
                value: report.completedOrders.toString(),
              ),

              _summaryCard(
                title: "Pending Orders",
                value: report.pendingOrders.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryCard({
    required String title,
    required String value,
  }){

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 4,
      ),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(8),

        boxShadow: [

          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 5,
            offset: const Offset(0,2),
          )

        ],
      ),


      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Text(
            title,

            style: const TextStyle(

              color: Color(0xff087344),

              fontSize: 14,

              fontWeight: FontWeight.w600,

            ),
          ),


          const SizedBox(height: 4),


          Text(

            value,

            style: const TextStyle(

              color: Colors.black87,

              fontSize: 16,

              fontWeight: FontWeight.bold,

            ),
          )

        ],
      ),
    );
  }



  String _month(int month){

    const months = [

      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"

    ];

    return months[month-1];

  }

}