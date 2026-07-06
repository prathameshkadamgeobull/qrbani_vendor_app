import 'package:flutter/material.dart';
import 'package:qrbani_vender_app/Core/constants/app_text_style.dart';

class ProfileHeader extends StatelessWidget {
  final String image;
  final String name;
  final String vendorId;

  const ProfileHeader({
    super.key,
    required this.image,
    required this.name,
    required this.vendorId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xff0B6A3F),
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
            child: ClipOval(
           child: Image.asset(
          "assets/images/profile.png",
          fit: BoxFit.cover,
        ),
      ),
        ),

        const SizedBox(height: 16),

        Text(
          name,
          style: AppTextStyles.bold18,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 6),

        Text(
          vendorId,
          style: AppTextStyles.grey14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}