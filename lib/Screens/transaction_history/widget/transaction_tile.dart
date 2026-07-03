import 'package:flutter/material.dart';

import '../../../models/transaction_model.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionTile({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE5E5E5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),

                if (transaction.id != null &&
                    transaction.id!.isNotEmpty) ...[
                  const SizedBox(height: 3),
                  Text(
                    transaction.id!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],

                const SizedBox(height: 3),

                Text(
                  "${transaction.date}, ${transaction.time}",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          Text(
            "${transaction.isCredit ? '+' : '-'} SAR ${transaction.amount.toStringAsFixed(transaction.amount % 1 == 0 ? 0 : 2)}",
            style: TextStyle(
              color: transaction.isCredit
                  ? Colors.green
                  : Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}