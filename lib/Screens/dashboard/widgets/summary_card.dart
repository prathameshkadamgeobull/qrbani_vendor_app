import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String hijriDate;
  final String lastUpdated;
  final String currentDate;
  final VoidCallback? onRefresh;

  const SummaryCard({
    super.key,
    required this.hijriDate,
    required this.lastUpdated,
    required this.currentDate,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TOP ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today's Summary",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),

              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.calendar_today_outlined,
                  size: 22,
                  color: Color(0xff4A5568),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// HIJRI DATE
          Text(
            hijriDate,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 18),

          /// BOTTOM ROW
          Row(
            children: [
              Expanded(
                child: Text(
                  "Last updated: $lastUpdated",
                  style: const TextStyle(
                    color: Color(0xff718096),
                    fontSize: 14,
                  ),
                ),
              ),

              Text(
                currentDate,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff4A5568),
                  fontWeight: FontWeight.w500,
                ),
              ),

              // if (onRefresh != null) ...[
              //   const SizedBox(width: 10),
              //
              //   GestureDetector(
              //     onTap: onRefresh,
              //     child: const Icon(
              //       Icons.refresh_rounded,
              //       color: Color(0xff4A5568),
              //       size: 15,
              //     ),
              //   ),
              // ],
            ],
          ),
        ],
      ),
    );
  }
}