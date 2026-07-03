import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';

class AnimalChip extends StatelessWidget {
  final String title;
  final int count;
  final Color color;

  const AnimalChip({
    super.key,
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 34,
        decoration: BoxDecoration(
          color: color.withOpacity(.08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title ",
                  style: AppTextStyles.upcomingAnimal.copyWith(
                    color: color,
                  ),
                ),
                TextSpan(
                  text: "$count",
                  style: AppTextStyles.upcomingCount.copyWith(
                    color: color,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}