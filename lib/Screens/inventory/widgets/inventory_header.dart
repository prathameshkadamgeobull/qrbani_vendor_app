import 'package:flutter/material.dart';
import '../../../Core/constants/app_text_style.dart';

class InventoryHeader extends StatelessWidget {
  final VoidCallback onBack;

  const InventoryHeader({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Row(
        children: [

          GestureDetector(
            onTap: onBack,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
              ),
            ),
          ),

          const Expanded(
            child: Center(
              child: Text(
                "Inventory",
                style: AppTextStyles.orderTitle,
              ),
            ),
          ),

          const SizedBox(width: 40),
        ],
      ),
    );
  }
}