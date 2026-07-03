import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String icon;
  final bool isRead;
  final VoidCallback? onTap;

  const NotificationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
    required this.isRead,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isRead
              ? Colors.grey.shade100
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isRead
                ? Colors.grey.shade300
                : Colors.green.shade200,
          ),
        ),
        child: Row(
          children: [

            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: isRead
                    ? Colors.grey.shade300
                    : Colors.green.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  icon,
                  style: TextStyle(
                    fontSize: 22,
                    color: isRead
                        ? Colors.grey
                        : Colors.green,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isRead
                          ? Colors.grey
                          : Colors.black,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: isRead
                          ? Colors.grey
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            Text(
              time,
              style: TextStyle(
                color: isRead
                    ? Colors.grey
                    : Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}