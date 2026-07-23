import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';
import '../../../models/business_information_model.dart';
import 'detail_row.dart';

class AddressCard extends StatelessWidget {
  final BusinessInformationModel business;

  const AddressCard({
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
                  Icons.location_on_outlined,
                  color: Color(0xff0A6A3F),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Business Address",
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
            title: "Address Line 1",
            value: business.addressLine1,
            icon: Icons.home_outlined,
          ),



          DetailRow(
            title: "Address Line 2",
            value: business.addressLine2,
            icon: Icons.apartment_outlined,
          ),



          DetailRow(
            title: "City",
            value: business.city,
            icon: Icons.location_city_outlined,
          ),



          DetailRow(
            title: "State / Region",
            value: business.state,
            icon: Icons.map_outlined,
          ),



          DetailRow(
            title: "Country",
            value: business.country,
            icon: Icons.public_outlined,
          ),



          DetailRow(
            title: "Postal Code",
            value: business.postalCode,
            icon: Icons.local_post_office_outlined,
          ),
        ],
      ),
    );
  }
}