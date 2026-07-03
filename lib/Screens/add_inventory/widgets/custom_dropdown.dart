import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: AppTextStyles.bodyMedium,
        ),

        const SizedBox(height: 8),

        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xffE5E5E5),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: Text(
                "Select Type",
                style: AppTextStyles.caption,
              ),
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: AppTextStyles.body,
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}