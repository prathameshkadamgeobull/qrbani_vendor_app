import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if (label.isNotEmpty) ...[
            Text(
              label,
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(height: 8),
          ],

          TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            style: AppTextStyles.body,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.caption,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xffE5E5E5),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xff0B8A47),
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      );
  }
}