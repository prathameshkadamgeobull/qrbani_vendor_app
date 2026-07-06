import 'package:flutter/material.dart';

import 'profile_info_tile.dart';

class ProfileInfoCard extends StatelessWidget {
  final String phone;
  final String email;
  final String location;

  const ProfileInfoCard({
    super.key,
    required this.phone,
    required this.email,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xffECECEC),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 20,
        ),
        child: Column(
          children: [
            ProfileInfoTile(
              icon: Icons.phone_outlined,
              title: "Phone",
              value: phone,
            ),

            const Divider(),

            ProfileInfoTile(
              icon: Icons.email_outlined,
              title: "Email",
              value: email,
            ),

            const Divider(),

            ProfileInfoTile(
              icon: Icons.location_on_outlined,
              title: "Location",
              value: location,
              showDivider: false,
            ),
          ],
        ),
      ),
    );
  }
}