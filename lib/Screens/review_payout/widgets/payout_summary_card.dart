import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/review_payout_model.dart';

class PayoutSummaryCard extends StatelessWidget {
  final ReviewPayoutModel payout;

  const PayoutSummaryCard({
    super.key,
    required this.payout,
  });

  String format(num value) => NumberFormat('#,##0').format(value);

  static const Color green = Color(0xff0A5A36);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(8, 8, 10, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Payout Summary",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Color(0xff111827),
            ),
          ),

          const SizedBox(height: 20),

          _buildRow(
            "Available Balance",
            "SAR ${format(payout.availableBalance)}",
            valueColor: green,
          ),

          const SizedBox(height: 10),

          const _DashedDivider(),

          const SizedBox(height: 10),

          _buildRow(
            "Payout Amount",
            "SAR ${format(payout.payoutAmount)}",
            valueWeight: FontWeight.w700,
            valueSize: 15,
          ),

          const SizedBox(height: 10),

          const _DashedDivider(),

          const SizedBox(height: 10),

          Row(
            children: [

              const Text(
                "Payout Fee",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff111827),
                ),
              ),

              const SizedBox(width: 6),

              Icon(
                Icons.info_outline,
                size: 18,
                color: Colors.grey.shade700,
              ),

              const Spacer(),

              Text(
                "SAR ${format(payout.payoutFee)}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 2,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffF3FAF5),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [

                const Expanded(
                  child: Text(
                    "You Will Receive",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: green,
                    ),
                  ),
                ),

                Text(
                  "SAR ${format(payout.receiveAmount)}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
      String title,
      String value, {
        Color valueColor = Colors.black,
        FontWeight valueWeight = FontWeight.w700,
        double valueSize = 16,
      }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff111827),
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: valueSize,
            fontWeight: valueWeight,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            (constraints.constrainWidth() / 6).floor(),
                (index) => const SizedBox(
              width: 3,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xffE5E7EB),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}