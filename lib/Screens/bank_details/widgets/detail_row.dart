import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color? valueColor;

  const DetailRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 18,
                color: const Color(0xff444444),
              ),

              const SizedBox(width: 16),

              SizedBox(
                width: 140,
                child: Text(
                  title,
                  style: AppTextStyles.body.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff555555),
                  ),
                ),
              ),

              Expanded(
                child: Text(
                  value,
                  textAlign: TextAlign.end,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: valueColor ?? const Color(0xff222222),
                  ),
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 58),
          child: Divider(
            color: Colors.grey.shade200,
            height: 1,
          ),
        ),
      ],
    );
  }
}