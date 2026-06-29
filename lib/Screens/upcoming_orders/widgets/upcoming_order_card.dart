import 'package:flutter/material.dart';

import '../../../models/upcoming_order_model.dart';
import 'status_chip.dart';

class UpcomingOrderCard extends StatelessWidget {
  final UpcomingOrderModel order;

  const UpcomingOrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.08),
            blurRadius: 12,
            offset: const Offset(0, 3),
          )
        ],
      ),

      child: Column(
        children: [

          /// Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      order.hijriDate,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Total Orders: ${order.totalOrders}",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [

                  const Icon(
                    Icons.person_outline,
                    size: 30,
                  ),

                  const SizedBox(height: 2),

                  Text(
                    "${order.butcherCount}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 22),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [

              if (order.goatCount > 0)
                StatusChip(
                  icon: Icons.pets,
                  title: "Goat",
                  count: order.goatCount,
                  color: Colors.orange,
                  background:
                  const Color(0xffFFF8ED),
                ),

              if (order.sheepCount > 0)
                StatusChip(
                  icon: Icons.pets,
                  title: "Sheep",
                  count: order.sheepCount,
                  color: Colors.red,
                  background:
                  const Color(0xffFFF3F3),
                ),

              if (order.camelCount > 0)
                StatusChip(
                  icon: Icons.pets,
                  title: "Camel",
                  count: order.camelCount,
                  color: Colors.brown,
                  background:
                  const Color(0xffF8F2EC),
                ),

              StatusChip(
                icon: Icons.check_circle_outline,
                title: "Completed",
                count: order.completedCount,
                color: Colors.green,
                background:
                const Color(0xffEAF8EF),
              ),
            ],
          ),
        ],
      ),
    );
  }
}