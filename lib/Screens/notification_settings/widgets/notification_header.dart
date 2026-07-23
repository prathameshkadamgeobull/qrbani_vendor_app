import 'package:flutter/material.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        left: 8,
        right: 16,
        top: 12,
        bottom: 18,
      ),
      child: Row(
        children: [
          IconButton(
            splashRadius: 22,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 22,
              color: Colors.black,
            ),
          ),

          const Expanded(
            child: Center(
              child: Text(
                "Notification Settings",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff111827),
                  letterSpacing: -.3,
                ),
              ),
            ),
          ),

          const SizedBox(width: 48),
        ],
      ),
    );
  }
}