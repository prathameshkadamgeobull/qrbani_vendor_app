import 'package:flutter/material.dart';
import '../../../models/recent_order_model.dart';

class RecentOrderTile extends StatelessWidget {
  final RecentOrderModel order;

  const RecentOrderTile({
    super.key,
    required this.order,
  });

  Color getStatusColor() {
    switch (order.status.toLowerCase()) {
      case "completed":
        return const Color(0xff22C55E);
      case "pending":
        return const Color(0xffF59E0B);
      case "in progress":
        return const Color(0xff3B82F6);
      default:
        return const Color(0xffEF4444);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [

          Expanded(
            flex: 4,
            child: Text(
              order.orderId,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),

          Expanded(
            flex: 4,
            child: Text(
              order.date,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                order.status,
                style: TextStyle(
                  color: getStatusColor(),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}