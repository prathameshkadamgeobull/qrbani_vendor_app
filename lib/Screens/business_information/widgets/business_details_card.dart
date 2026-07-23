import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';
import '../../../models/business_information_model.dart';
import 'detail_row.dart';

class BusinessDetailsCard extends StatelessWidget {
  final BusinessInformationModel business;

  const BusinessDetailsCard({
    super.key,
    required this.business,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.08),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Heading
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffEAF6EF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.business,
                  color: Color(0xff0A6A3F),
                ),
              ),

              const SizedBox(width: 12),

              Text(
                "Business Details",
                style: AppTextStyles.cardTitle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Divider(
            color: Colors.grey.shade200,
            thickness: 1,
          ),

          DetailRow(
            icon: Icons.person_outline,
            title: "Business Name",
            value: business.businessName,
          ),

          DetailRow(
            icon: Icons.badge_outlined,
            title: "Business Type",
            value: business.businessType,
          ),

          DetailRow(
            icon: Icons.person_outline,
            title: "Owner Name",
            value: business.ownerName,
          ),

          DetailRow(
            icon: Icons.phone_outlined,
            title: "Phone Number",
            value: business.phone,
            valueColor: const Color(0xff0B7A47),
          ),

          DetailRow(
            icon: Icons.mail_outline,
            title: "Email Address",
            value: business.email,
            valueColor: const Color(0xff0B7A47),
          ),
        ],
      ),
    );
  }
}