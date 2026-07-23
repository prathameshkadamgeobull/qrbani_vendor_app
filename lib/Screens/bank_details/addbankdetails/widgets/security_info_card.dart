import 'package:flutter/material.dart';

import '../../../../Core/constants/app_text_style.dart';

class SecurityInfoCard extends StatelessWidget {
  const SecurityInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xffF4FBF7),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xffD8F0E2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            height: 48,
            width: 20,
            decoration: BoxDecoration(
              color: const Color(0xffE2F6EA),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.verified_user_outlined,
              color: Color(0xff0B8A47),
              size: 30,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Your Information is Secure",
                  style: AppTextStyles.cardTitle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Your bank details are encrypted and used only for payout transfers. We never share your banking information with third parties.",
                  style: AppTextStyles.body.copyWith(
                    color: Colors.grey.shade700,
                    height: 1.5,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 14),

                Row(
                  children: [

                    const Icon(
                      Icons.lock_outline,
                      color: Color(0xff0B8A47),
                      size: 18,
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: Text(
                        "Protected with industry-standard security",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: const Color(0xff0B8A47),
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}