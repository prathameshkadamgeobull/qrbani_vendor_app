import 'package:flutter/material.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 50,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.storefront,
              color: Colors.white,
              size: 28,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "Al Noor Slaughterhouse",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            "Vendor ID : VES-7845",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}