import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';

class TimeSlotHeader extends StatelessWidget {
  final VoidCallback onBack;

  const TimeSlotHeader({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      child: Row(
        children: [

          InkWell(
            onTap: onBack,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xffE8E8E8),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
              ),
            ),
          ),

          const Expanded(
            child: Center(
              child: Text(
                "Time Slot Management",
                style: AppTextStyles.orderTitle,
              ),
            ),
          ),

          const SizedBox(width: 40),
        ],
      ),
    );
  }
}