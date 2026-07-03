import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';

class HijriDateWidget extends StatelessWidget {
  final String date;

  const HijriDateWidget({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xffE8E8E8),
        ),
      ),
      child: Center(
        child: Text(
          date,
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          ),
        ),
    );
  }
}