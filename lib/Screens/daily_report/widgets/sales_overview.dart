import 'package:flutter/material.dart';

import 'sales_chart.dart';

class SalesOverview extends StatelessWidget {
  const SalesOverview({super.key});

  @override
  Widget build(BuildContext context) {

      return Container(
        width: double.infinity,

        margin: const EdgeInsets.symmetric(horizontal: 5),

        padding: const EdgeInsets.all(10),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.12),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              const Expanded(
                child: Text(
                  "Sales Overview",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [

                    Text(
                      "This Week",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(width: 5),

                    // Icon(
                    //   Icons.keyboard_arrow_down,
                    //   size: 18,
                    // ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          const Text(
            "+12.5% vs last month",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 25),

          const SizedBox(
            width: double.infinity,
            child: SalesChart(),
          ),
        ],
      ),
    );
  }
}