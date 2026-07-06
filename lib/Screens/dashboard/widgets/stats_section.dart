// import 'package:flutter/material.dart';
//
// class StatsSection extends StatelessWidget {
//   final int totalOrders;
//   final int completedOrders;
//   final int todayOrders;
//   final int inProgressOrders;
//   final int pendingOrders;
//
//   const StatsSection({
//     super.key,
//     required this.totalOrders,
//     required this.completedOrders,
//     required this.todayOrders,
//     required this.inProgressOrders,
//     required this.pendingOrders,
//   });
//
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         children: [
//
//           /// First Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//             children: [
//
//               _card(
//                 width: 125,
//                 height: 90,
//                 title: "Total Orders",
//                 value: totalOrders.toString(),
//               ),
//
//               _card(
//                 width: 110,
//                 height: 90,
//                 title: "Completed",
//                 value: completedOrders.toString(),
//               ),
//
//               _card(
//                 width: 75,
//                 height: 90,
//                 title: "Today",
//                 value: todayOrders.toString(),
//                 valueColor: const Color(0xff0C8A48),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 12),
//
//           /// Second Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//
//               _card(
//                 width: 125,
//                 height: 90,
//                 title: "In Progress",
//                 value: inProgressOrders.toString(),
//               ),
//
//               _pendingCard(
//                 width: 188,
//                 height: 90,
//                 value: pendingOrders.toString(),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _card({
//     required double width,
//     required double height,
//     required String title,
//     required String value,
//     Color valueColor = Colors.black,
//   }) {
//     return Container(
//       width: width,
//       height: height,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 14,
//         vertical: 12,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(
//           color: const Color(0xffECECEC),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(.12),
//             blurRadius: 10,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Color(0xff4A4A4A),
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//
//           const Spacer(),
//
//            Text(
//               value,
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: valueColor,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _pendingCard({
//     required double width,
//     required double height,
//     required String value,
//   }) {
//     return Container(
//       width: width,
//       height: height,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 12,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(
//           color: const Color(0xffECECEC),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(.12),
//             blurRadius: 10,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           const Text(
//             "Pending",
//             style: TextStyle(
//               fontSize: 14,
//               color: Color(0xff4A4A4A),
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//
//           const Spacer(),
//
//           Row(
//             children: [
//
//               Text(
//                 value,
//                 style: const TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//
//               const Spacer(),
//
//               const Icon(
//                 Icons.access_time,
//                 size: 22,
//                 color: Colors.orange,
//               ),
//
//               // Container(
//               //   height: 30,
//               //   width: 30,
//               //    decoration: BoxDecoration(
//               //   //   shape: BoxShape.circle,
//               //   //   border: Border.all(
//               //   //     color: Colors.orange,
//               //   //     width: 2,
//               //   //   ),
//               //   ),
//               //   child: const Icon(
//               //     Icons.access_time,
//               //     size: 18,
//               //     color: Colors.orange,
//               //   ),
//               // ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:qrbani_vender_app/Screens/ai_capacity_planner_status/widgets/ai_capacity_planner_screen.dart';

import '../../../Core/constants/app_text_style.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
// <<<<<<< HEAD
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AICapacityPlannerPage(),
              ),
            );
          },
                child: _buildCard(
                  title: "Total Orders",
                  value: totalOrders.toString(),
                  icon: Icons.shopping_bag_outlined,
                  iconColor: Colors.blue,
                ),
                // child: _buildCard(
                //   title: "Total Orders",
                //   value: totalOrders.toString(),
                // ),
              ),
              ),

              const SizedBox(width: 12),

              Expanded(
                flex: 3,
                // child: _buildCard(
                //   title: "Completed",
                //   value: completedOrders.toString(),
                // ),

                child: _buildCard(
                  title: "Completed",
                  value: completedOrders.toString(),
                  icon: Icons.check_circle_outline,
                  iconColor: Colors.green,
                ),
              ),

              const SizedBox(width: 12),

              // Expanded(
              //   flex: 2,
              //   child: _buildCard(
              //     title: "Today",
              //     value: todayOrders.toString(),
              //     valueColor: const Color(0xff0C8A48),
              //   ),
              // ),

              Expanded(
                flex: 2,
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const OrdersScreen(),
                      ),
                    );
                  },
                  // child: _buildCard(
                  //   title: "Today",
                  //   value: todayOrders.toString(),
                  //   valueColor: const Color(0xff0C8A48),
                  // ),
                  child: _buildCard(
                    title: "Today",
                    value: todayOrders.toString(),
                    valueColor: const Color(0xff0C8A48),
                    icon: Icons.today_outlined,
                    iconColor: Colors.orange,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                flex: 4,
                // child: _buildCard(
                //   title: "In Progress",
                //   value: inProgressOrders.toString(),
                // ),

               child:  _buildCard(
                  title: "In Progress",
                  value: inProgressOrders.toString(),
                  icon: Icons.local_shipping_outlined,
                  iconColor: Colors.deepPurple,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                flex: 6,
                child: _buildPendingCard(
                  value: pendingOrders.toString(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildCard({
  //   required String title,
  //   required String value,
  //   Color valueColor = Colors.black,
  // }) {
  //   return Container(
  //     height: 92,
  //     padding: const EdgeInsets.symmetric(
  //       horizontal: 12,
  //       vertical: 15  ,
  //     ),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(18),
  //       border: Border.all(
  //         color: const Color(0xffECECEC),
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(.08),
  //           blurRadius: 12,
  //           offset: const Offset(0, 3),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           title,
  //           style: AppTextStyles.statTitle,
  //         ),
  //
  //         const Spacer(),
  //
  //         Text(
  //           value,
  //           style: AppTextStyles.statValue.copyWith(
  //             color: valueColor,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
    Color valueColor = Colors.black,
  }) {
    return Container(
      height: 138,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xffECECEC)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.08),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 22,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.statTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 8),

          Text(
            value,
            textAlign: TextAlign.center,
            style: AppTextStyles.statValue.copyWith(
              color: valueColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingCard({
    required String value,
  }) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xffECECEC)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.08),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.pending_actions_outlined,
              color: Colors.orange,
              size: 22,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Pending",
            textAlign: TextAlign.center,
            style: AppTextStyles.statTitle,
          ),

          const SizedBox(height: 8),

          Text(
            value,
            textAlign: TextAlign.center,
            style: AppTextStyles.statValue,
          ),
        ],
      ),
    );
  }
  }
