import 'package:flutter/material.dart';

import '../../../Core/constants/app_colors.dart';
import '../../../Core/constants/app_text_style.dart';

class WorkflowCard extends StatelessWidget {
  const WorkflowCard({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      {
        "title": "Receive Order",
        "icon": Icons.shopping_bag_outlined,
      },
      {
        "title": "Verify Animal",
        "icon": Icons.qr_code_scanner,
      },
      {
        "title": "Start Processing",
        "icon": Icons.sync,
      },
      {
        "title": "Complete Order",
        "icon": Icons.task_alt,
      },
      {
        "title": "Receive Payout",
        "icon": Icons.account_balance_wallet_outlined,
      },
    ];

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              const Icon(
                Icons.route,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                "Daily Workflow",
                style: AppTextStyles.cardTitle,
              ),
            ],
          ),

          const SizedBox(height: 20),

          ...List.generate(
            steps.length,
                (index) {
              final item = steps[index];

              return Column(
                children: [

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          item["icon"] as IconData,
                          color: AppColors.primary,
                          size: 22,
                        ),
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            item["title"] as String,
                            style: AppTextStyles.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),

                  if (index != steps.length - 1)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 4,
                        bottom: 4,
                      ),
                      child: Container(
                        height: 26,
                        width: 2,
                        color: AppColors.primary.withOpacity(.3),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}