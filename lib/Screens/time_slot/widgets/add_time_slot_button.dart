import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';

class AddTimeSlotButton extends StatelessWidget {
  const AddTimeSlotButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton.icon(
          onPressed: () {
            // Navigate to Add Time Slot Screen
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: const Text(
            "Add Time Slot",
            style: AppTextStyles.buttonText,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff0B8A47),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ),
    );
  }
}