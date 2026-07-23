import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../blocs/features/request_payout/request_payout_state.dart';

class BalanceCard extends StatelessWidget {
  final PayoutState state;
  final formatter = NumberFormat('#,##0');

   BalanceCard({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff0A5A36),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Available Balance",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 8),


                    Text(
                    "SAR ${formatter.format(state.availableBalance)}",
                style: const TextStyle(
               fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),

                const SizedBox(height: 6),

                const Text(
                  "You can request a payout anytime.",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white24,
            child: Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
              size: 34,
            ),
          ),
        ],
      ),
    );
  }
}