import 'package:flutter/material.dart';

class RevenueDateRange extends StatelessWidget {
  final String dateRange;
  final VoidCallback onTap;

  const RevenueDateRange({
    super.key,
    required this.dateRange,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today,
              color: Color(0xff168C4B),
              size: 20,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                dateRange,
                style: TextStyle(
                  fontSize: 15,
                  color: dateRange == "Select Date Range"
                      ? Colors.grey
                      : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}