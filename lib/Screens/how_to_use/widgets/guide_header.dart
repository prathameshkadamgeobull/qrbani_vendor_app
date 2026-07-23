import 'package:flutter/material.dart';

import '../../../Core/constants/app_colors.dart';
import '../../../Core/constants/app_text_style.dart';

class GuideHeader extends StatelessWidget {
  const GuideHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff148843),
            Color(0xff0C6A34),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.menu_book_rounded,
              color: Colors.white,
              size: 36,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome!",
                  style: AppTextStyles.cardTitle.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Learn how to use the Vendor App with this step-by-step guide. "
                      "Follow each section to manage orders, inventory, reports and payouts easily.",
                  style: AppTextStyles.body.copyWith(
                    color: Colors.white.withOpacity(.95),
                    height: 1.5,
                    fontSize: 12,
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