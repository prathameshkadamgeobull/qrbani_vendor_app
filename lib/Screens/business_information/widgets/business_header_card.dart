import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';
import '../../../models/business_information_model.dart';

class BusinessHeaderCard extends StatelessWidget {
  final BusinessInformationModel business;

  const BusinessHeaderCard({
    super.key,
    required this.business,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xff0B6A40),
            Color(0xff064D2E),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          /// Business Logo
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              color: Color(0xffFFF4D6),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.storefront_outlined,
              size: 36,
              color: Color(0xff0B6A40),
            ),
          ),

          const SizedBox(width: 18),

          /// Business Info
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  business.businessName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.cardTitle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Vendor ID: ${business.vendorId}",
                  style: AppTextStyles.body.copyWith(
                    color: Colors.white.withOpacity(.95),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          /// Edit Button
          // InkWell(
          //   borderRadius: BorderRadius.circular(30),
          //   onTap: () {},
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(
          //       horizontal: 18,
          //       vertical: 12,
          //     ),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(30),
          //       border: Border.all(
          //         color: Colors.white.withOpacity(.35),
          //       ),
          //       color: Colors.white.withOpacity(.08),
          //     ),
          //     child: Row(
          //       children: [
          //         const Icon(
          //           Icons.edit_outlined,
          //           color: Colors.white,
          //           size: 20,
          //         ),
          //         const SizedBox(width: 8),
          //         Text(
          //           "Edit",
          //           style: AppTextStyles.body.copyWith(
          //             color: Colors.white,
          //             fontWeight: FontWeight.w600,
          //             fontSize: 16,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}