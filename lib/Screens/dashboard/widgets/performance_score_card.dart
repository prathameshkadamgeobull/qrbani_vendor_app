import 'package:flutter/material.dart';

import '../../../Core/constants/app_colors.dart';
import '../../../Core/constants/app_text_style.dart';

class PerformanceScoreCard extends StatelessWidget {
  final double rating;
  final String status;
  final VoidCallback onTap;

  const PerformanceScoreCard({
    super.key,
    required this.rating,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.textGrey.withOpacity(.4),
            ),
          ),
          child: Row(
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.star_rounded,
                  color: AppColors.primary,
                  size: 32,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Performance Score",
                      style: AppTextStyles.cardTitle,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "$rating / 5  •  $status",
                      style: AppTextStyles.bodySemiBold.copyWith(
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      "View detailed performance metrics",
                      style: AppTextStyles.cardSubtitle,
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}