import 'package:flutter/material.dart';

import '../../../models/BankModel.dart';
import '../../../models/review_payout_model.dart';

class ReviewBankDetailsCard extends StatelessWidget {
  final ReviewPayoutModel payout;
  final BankModel? selectedBank;


  const ReviewBankDetailsCard({
    super.key,
    required this.payout,
    this.selectedBank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          /// Bank Header
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: Color(0xffE9F7F0),
                child: Icon(
                  Icons.account_balance,
                  color: Color(0xff0A5A36),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  selectedBank?.bankName ?? payout.bankName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

          const Divider(height: 20),

          /// Account Number
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Account Number",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              Text(
                selectedBank?.accountNumber ?? payout.accountNumber,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          /// Account Holder
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Account Holder",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              Flexible(
                child: Text(
                  selectedBank?.accountHolder ?? payout.accountHolder,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}