import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final IconData icon;
  final String title;
  final int count;
  final Color color;
  final Color background;

  const StatusChip({
    super.key,
    required this.icon,
    required this.title,
    required this.count,
    required this.color,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Icon(
            icon,
            color: color,
            size: 24,
          ),

          const SizedBox(width: 10),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),

          const SizedBox(width: 10),

          Text(
            "$count",
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}