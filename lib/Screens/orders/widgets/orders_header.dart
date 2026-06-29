import 'package:flutter/material.dart';

import '../../upcoming_orders/upcoming_orders_screen.dart';

class OrdersHeader extends StatefulWidget {
  final String hijriDate;
  final String selectedStatus;
  final ValueChanged<String> onStatusChanged;
  final VoidCallback onBack;
  final VoidCallback onNotification;

  const OrdersHeader({
    Key? key,
    required this.hijriDate,
    required this.selectedStatus,
    required this.onStatusChanged,
    required this.onBack,
    required this.onNotification,
  }) : super(key: key);

  @override
  State<OrdersHeader> createState() => _OrdersHeaderState();
}

class _OrdersHeaderState extends State<OrdersHeader> {
  final List<String> tabs = [
    "All",
    "Pending",
    "In Progress",
    "Completed",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 8),

            /// Title
            const Row(
              children: [
                SizedBox(width: 40),
                Expanded(
                  child: Center(
                    child: Text(
                      "Orders (Today)",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 40),
              ],
            ),

            const SizedBox(height: 12),

            /// Back + Date + Notification
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  InkWell(
                    onTap: widget.onBack,
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Text(
                    widget.hijriDate,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),

                  const Spacer(),

                  // InkWell(
                  //   onTap: widget.onNotification,
                  //   borderRadius: BorderRadius.circular(20),
                  //   child: Stack(
                  //     clipBehavior: Clip.none,
                  //     children: [
                  //       const Icon(
                  //         Icons.notifications_none_outlined,
                  //         size: 24,
                  //         color: Colors.black87,
                  //       ),
                  //
                  //       Positioned(
                  //         top: 2,
                  //         right: 1,
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

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const UpcomingOrdersScreen(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Icon(
                          Icons.notifications_none_outlined,
                          size: 24,
                          color: Colors.black87,
                        ),
                        Positioned(
                          top: 2,
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
            ),

            const SizedBox(height: 18),

            SizedBox(
              height: 34,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: tabs.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final bool isSelected =
                      widget.selectedStatus == tabs[index];

                  return GestureDetector(
                    onTap: () {
                      widget.onStatusChanged(tabs[index]);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xffF5F5F5)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: const Color(0xffE5E5E5),
                        ),
                      ),
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: isSelected
                              ? Colors.black
                              : const Color(0xff666666),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}