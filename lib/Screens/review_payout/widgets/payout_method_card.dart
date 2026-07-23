import 'package:flutter/material.dart';

import '../../../models/review_payout_model.dart';

class ReviewPayoutMethodCard extends StatelessWidget {
  final ReviewPayoutModel payout;
  final VoidCallback? onChange;

  const ReviewPayoutMethodCard({
    super.key,
    required this.payout,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Payout Method",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 14),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 15,
                height: 45,
                decoration: const BoxDecoration(
                  color: Color(0xffE9F7F0),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.account_balance,
                  color: Color(0xff0A5A36),
                  size: 25,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      payout.payoutMethod,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff111827),
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      "Transfer to your bank account",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff6B7280),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: onChange,
                child: const Text(
                  "Change",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0A5A36),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}