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
            vertical: 15,
            horizontal: 2,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: Colors.black87,
              ),

              const SizedBox(width: 15),

              SizedBox(
                width: 125,
                child: Text(
                  title,
                  style: AppTextStyles.body.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
                    fontWeight: FontWeight.w500,
                    color: valueColor ?? const Color(0xff222222),
                  ),
                ),
              ),
            ],
          )
        ),

        Padding(
          padding: const EdgeInsets.only(left: 42),
          child: Divider(
            height: 1,
            thickness: 1,
            color: const Color(0xffEFEFEF),
          ),
        ),
      ],
    );
  }
}