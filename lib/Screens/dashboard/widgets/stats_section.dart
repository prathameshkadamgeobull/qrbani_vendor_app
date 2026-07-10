import 'package:flutter/material.dart';
import 'package:qrbani_vender_app/Screens/dashboard/widgets/stat_card.dart';

import '../../orders/orders_screen.dart';

class StatsSection extends StatelessWidget {
  final int totalOrders;
  final int completedOrders;
  final int todayOrders;
  final int inProgressOrders;
  final int pendingOrders;

  const StatsSection({
    super.key,
    required this.totalOrders,
    required this.completedOrders,
    required this.todayOrders,
    required this.inProgressOrders,
    required this.pendingOrders,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "    Order Statistics",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          /// Row 1
          Row(
            children: [
              Expanded(
                child: StatCard(
                  title: "Total Orders",
                  value: totalOrders.toString(),
                  icon: Icons.shopping_bag_outlined,
                  iconColor: Colors.blue,
                  backgroundColor: const Color(0xffF5F9FF),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: StatCard(
                  title: "Completed",
                  value: completedOrders.toString(),
                  icon: Icons.check_circle_outline,
                  iconColor: Colors.green,
                  backgroundColor: const Color(0xffF3FBF5),
                ),
              ),
            ],
          ),

          const SizedBox(height: 13),

          /// Row 2
          Row(
            children: [
              Expanded(
                child: StatCard(
                  title: "Today",
                  value: todayOrders.toString(),
                  icon: Icons.today_outlined,
                  iconColor: Colors.orange,
                  backgroundColor: const Color(0xffFFF8EF),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const OrdersScreen(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: StatCard(
                  title: "In Progress",
                  value: inProgressOrders.toString(),
                  icon: Icons.local_shipping_outlined,
                  iconColor: Colors.deepPurple,
                  backgroundColor: const Color(0xffF5F5FF),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// Pending Card
          SizedBox(
            width: double.infinity,
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                color: const Color(0xffFFF8EE),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.03),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  /// LEFT CONTENT
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pending",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff667085),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          pendingOrders.toString(),
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff101828),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// ICON
                  Positioned(
                    right: 20,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(.12),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.pending_actions_outlined,
                          color: Colors.orange,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ], // <-- children of Column
      ), // <-- Column
    ); // <-- Padding
  }
}

