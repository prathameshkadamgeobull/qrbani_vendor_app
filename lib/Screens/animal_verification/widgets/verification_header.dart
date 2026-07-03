import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';

class VerificationHeader extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onNotification;

  const VerificationHeader({
    super.key,
    required this.onBack,
    required this.onNotification,
  });

  @override
  State<VerificationHeader> createState() =>
      _VerificationHeaderState();
}

class _VerificationHeaderState
    extends State<VerificationHeader> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14,
        ),
        child: Row(
          children: [
            /// Back Button
            InkWell(
              onTap: widget.onBack,
              borderRadius: BorderRadius.circular(20),
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(width: 12),

            /// Title
            const Expanded(
              child: Text(
                "Animal Verification",
                textAlign: TextAlign.center,
                style: AppTextStyles.orderTitle,
              ),
            ),

            /// Notification Button
            // InkWell(
            //   onTap: widget.onNotification,
            //   borderRadius: BorderRadius.circular(20),
            //   child: Stack(
            //     clipBehavior: Clip.none,
            //     children: [
            //       const Padding(
            //         padding: EdgeInsets.all(4),
            //         child: Icon(
            //           Icons.notifications_none_outlined,
            //           size: 26,
            //           color: Colors.black87,
            //         ),
            //       ),
            //
            //       Positioned(
            //         right: 4,
            //         top: 4,
            //         child: Container(
            //           width: 8,
            //           height: 8,
            //           decoration: const BoxDecoration(
            //             color: Colors.orange,
            //             shape: BoxShape.circle,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}