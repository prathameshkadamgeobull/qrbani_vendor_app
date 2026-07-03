import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';

class UpcomingOrdersHeader extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onNotification;

  const UpcomingOrdersHeader({
    super.key,
    required this.onBack,
    required this.onNotification,
  });

  @override
  State<UpcomingOrdersHeader> createState() =>
      _UpcomingOrdersHeaderState();
}

class _UpcomingOrdersHeaderState
    extends State<UpcomingOrdersHeader> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
        child: Column(
          children: [

            /// Title
            Row(
              children: [

                InkWell(
                  onTap: widget.onBack,
                  borderRadius: BorderRadius.circular(20),
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),

                const Expanded(
                  child: Center(
                    child: Text(
                      "Upcoming Orders",
                      style: AppTextStyles.upcomingTitle,
                    ),
                  ),
                ),

                InkWell(
                  onTap: widget.onNotification,
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [

                      const Icon(
                        Icons.notifications_none_rounded,
                        size: 24,
                        color: Colors.black87,
                      ),

                      Positioned(
                        top: 1,
                        right: 1,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}