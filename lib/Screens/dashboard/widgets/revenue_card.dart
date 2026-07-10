import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RevenueCard extends StatelessWidget {
  final double todayRevenue;
  final double monthGrowth;
  final VoidCallback onTap;

  const RevenueCard({
    super.key,
    required this.todayRevenue,
    required this.monthGrowth,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,##0");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.08),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              /// LEFT SIDE
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Today's Revenue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff2D3748),
                      ),
                    ),

                    const SizedBox(height: 14),

                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "SAR ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text: formatter.format(todayRevenue),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -1.2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Text(
                          "+${monthGrowth.toStringAsFixed(1)}%",
                          style: const TextStyle(
                           color:  Color(0xff08552F),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(width: 8),

                        const Icon(
                          Icons.arrow_upward,
                          size: 18,
                          color:  Color(0xff08552F),
                        ),

                        const SizedBox(width: 10),

                        const Flexible(
                          child: Text(
                            "vs last month",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 15),

              /// RIGHT SIDE
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: const Color(0xffEAF8EF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.trending_up_rounded,
                  color: Color(0xff0A6A3C),
                  size: 42,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}