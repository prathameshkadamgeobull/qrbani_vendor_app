import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';

class SaveInventoryButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveInventoryButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff0B8A47),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Save Inventory",
          style: AppTextStyles.buttonText,
        ),
      ),
    );
  }
}