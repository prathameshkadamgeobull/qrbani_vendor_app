import 'package:flutter/material.dart';

class ImportantCard extends StatelessWidget {
  final String title;
  final String description;

  const ImportantCard({
    super.key,
    this.title = "Important",
    this.description =
    "Payouts are usually processed within 1–2 business days.\nPlease verify that your bank details are correct before proceeding.",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffEAF8F0),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xffD3EEDF),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_outline,
            color: Color(0xff0A5A36),
            size: 28,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0A5A36),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}