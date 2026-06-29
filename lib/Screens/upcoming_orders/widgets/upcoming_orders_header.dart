import 'package:flutter/material.dart';

class UpcomingHeader extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNotification;

  const UpcomingHeader({
    super.key,
    required this.onBack,
    required this.onNotification,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [

            InkWell(
              onTap: onBack,
              child: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),

            const Expanded(
              child: Center(
                child: Text(
                  "Upcoming Orders",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: onNotification,
              child: const Icon(
                Icons.notifications_none,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}