import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';
import '../../../models/bank_details_model.dart';

class BankHeaderCard extends StatelessWidget {
  final BankDetailsModel bank;

  const BankHeaderCard({
    super.key,
    required this.bank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff0B6A40),
            Color(0xff064D2E),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          /// Bank Icon
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xffFFF5D7),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.account_balance,
              color: Color(0xff0B6A40),
              size: 36,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bank.businessName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.cardTitle.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  bank.accountType,
                  style: AppTextStyles.body.copyWith(
                    color: Colors.white.withOpacity(.92),
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 14),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffEAF8EF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.verified,
                        color: Color(0xff0B8A47),
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        bank.verified
                            ? "Verified"
                            : "Not Verified",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: const Color(0xff0B8A47),
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}