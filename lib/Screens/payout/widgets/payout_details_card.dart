import 'package:flutter/material.dart';

class PayoutDetailCard extends StatelessWidget {
  final String nextPayout;
  final String payoutMethod;
  final String bankName;
  final String accountNumber;

  const PayoutDetailCard({
    super.key,
    required this.nextPayout,
    required this.payoutMethod,
    required this.bankName,
    required this.accountNumber,
  });

  Widget buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            value,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildRow("Next Payout", nextPayout),

            const Divider(height: 1, thickness: 0.6),

            buildRow("Payout Method", payoutMethod),

            const Divider(height: 1, thickness: 0.6),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Bank Details",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    bankName,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    accountNumber,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}