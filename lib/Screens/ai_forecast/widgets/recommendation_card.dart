import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
  final String recommendation;

  const RecommendationCard({
    super.key,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14), // Reduced from 18
      decoration: BoxDecoration(
        color: const Color(0xffEAF8EE),
        borderRadius: BorderRadius.circular(14), // Reduced from 18
        border: Border.all(
          color: Colors.green.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10), // Reduced from 14
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.psychology,
                  color: Colors.green,
                  size: 20, // Smaller icon
                ),
              ),

              const SizedBox(width: 10),

              const Text(
                "AI Recommendation",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // Reduced from 18
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Text(
            recommendation,
            style: const TextStyle(
              fontSize: 14, // Reduced from 15
              height: 1.4,
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0A5A36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 18,
              ),
              label: const Text(
                "Apply Recommendation",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).viewPadding.bottom,
          ),
        ],
      ),
    );
  }
}