import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';
import '../../../models/upcoming_order_model.dart';
import 'status_chip.dart';

class UpcomingOrderCard extends StatefulWidget {
  final UpcomingOrderModel order;

  const UpcomingOrderCard({
    super.key,
    required this.order,
  });

  @override
  State<UpcomingOrderCard> createState() => _UpcomingOrderCardState();
}

class _UpcomingOrderCardState extends State<UpcomingOrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 8,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
        vertical: 19,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      widget.order.hijriDate,
                      style: AppTextStyles.upcomingDate,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "Total Orders : ${widget.order.totalOrders}",
                      style: AppTextStyles.upcomingTotal,
                    ),
                  ],
                ),
              ),

              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 28,
                    color: Color(0xff666666),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// Animal Count Cards
          Row(
            children: [

              Expanded(
                child: AnimalChip(
                  title: "Goat",
                  count: widget.order.goatCount,
                  color: Colors.orange,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: AnimalChip(
                  title: "Sheep",
                  count: widget.order.sheepCount,
                  color: Colors.green,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: AnimalChip(
                  title: "Camel",
                  count: widget.order.camelCount,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}