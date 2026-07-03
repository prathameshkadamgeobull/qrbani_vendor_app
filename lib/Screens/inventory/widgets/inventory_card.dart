import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';
import '../../../models/inventory_model.dart';

class InventoryCard extends StatelessWidget {
  final InventoryModel inventory;

  const InventoryCard({
    super.key,
    required this.inventory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffE8E8E8),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          /// Animal Image
          ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: SizedBox(
              width: 60,
              height: 60,
              child: inventory.animalName.toLowerCase().contains("camel")
                  ? Transform.rotate(
                angle: -math.pi / 20,
                child: Image.asset(
                  inventory.image,
                  fit: BoxFit.cover,
                ),
              )
                  : Image.asset(
                inventory.image,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  inventory.animalName,
                  style: AppTextStyles.bodySemiBold.copyWith(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Text(
                      "Available",
                      style: AppTextStyles.caption,
                    ),

                    const SizedBox(width: 6),

                    Text(
                      "${inventory.available}",
                      style: AppTextStyles.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 24),

              Row(
                children: [
                  Text(
                    "Reserved",
                    style: AppTextStyles.caption,
                  ),

                  const SizedBox(width: 6),

                  Text(
                    "${inventory.reserved}",
                    style: AppTextStyles.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}