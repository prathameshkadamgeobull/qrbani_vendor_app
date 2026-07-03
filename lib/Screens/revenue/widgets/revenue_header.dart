import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';

class RevenueHeader extends StatelessWidget {
  final VoidCallback onBack;

  const RevenueHeader({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        /// Back Button
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
              color: Colors.black,
            ),
          ),
        ),

        /// Title
        const Expanded(
          child: Center(
            child: Text(
              "Revenue Dashboard",
              style: AppTextStyles.orderTitle,
            ),
          ),
        ),

        /// Right Space
        const SizedBox(
          width: 40,
        ),
      ],
    );
  }
}