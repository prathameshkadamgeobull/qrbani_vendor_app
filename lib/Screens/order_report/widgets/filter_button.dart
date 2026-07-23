import 'package:flutter/material.dart';

import '../../../Core/constants/AppConstants.dart';
import '../../../Core/constants/app_colors.dart';

class CalendarButton extends StatelessWidget {
  final VoidCallback onTap;

  const CalendarButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppConstants.cardRadius),
      child: Container(
        height: 56,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: const Icon(
          Icons.calendar_month_outlined,
          size: 24,
          color: Colors.black87,
        ),
      ),
    );
  }
}