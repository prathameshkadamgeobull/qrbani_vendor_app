import 'package:flutter/material.dart';

import '../../../../Core/constants/app_text_style.dart';


class AccountTypeDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const AccountTypeDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const accountTypes = [
      "Business Current Account",
      "Business Savings Account",
      "Current Account",
      "Savings Account",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Account Type",
          style: AppTextStyles.body.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
          decoration: InputDecoration(
            hintText: "Select Account Type",

            filled: true,
            fillColor: Colors.white,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xff0B8A47),
                width: 1.5,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
          ),

          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please select account type";
            }
            return null;
          },

          items: accountTypes.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Text(
                type,
                style: AppTextStyles.body,
              ),
            );
          }).toList(),

          onChanged: onChanged,
        ),
      ],
    );
  }
}