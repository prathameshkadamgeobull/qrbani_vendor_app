// import 'package:flutter/material.dart';
//
// class OrderCard extends StatelessWidget {
//   final String orderId;
//   final String animal;
//   final String time;
//   final String customer;
//   final String price;
//   final String status;
//
//   const OrderCard({
//     super.key,
//     required this.orderId,
//     required this.animal,
//     required this.time,
//     required this.customer,
//     required this.price,
//     required this.status,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final bool pending = status == "Pending";
//
//     return Container(
//       margin: const EdgeInsets.symmetric(
//         horizontal: 14,
//         vertical: 7,
//       ),
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(.08),
//             blurRadius: 10,
//             offset: const Offset(0, 3),
//           )
//         ],
//       ),
//       child: Column(
//         children: [
//
//           /// Order Number + Status
//           Row(
//             children: [
//
//               Expanded(
//                 child: Text(
//                   orderId,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 4,
//                 ),
//                 decoration: BoxDecoration(
//                   color: pending
//                       ? const Color(0xffFFF4EC)
//                       : const Color(0xffEAF8EF),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                   status,
//                   style: TextStyle(
//                     fontSize: 10,
//                     fontWeight: FontWeight.w600,
//                     color: pending
//                         ? const Color(0xffE28A1A)
//                         : const Color(0xff0B8A47),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 10),
//
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     Text(
//                       animal,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//
//                     const SizedBox(height: 4),
//
//                     Text(
//                       time,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey,
//                       ),
//                     ),
//
//                     const SizedBox(height: 4),
//
//                     Text(
//                       customer,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               Text(
//                 price,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String animal;
  final String time;
  final String customer;
  final String price;
  final String status;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.animal,
    required this.time,
    required this.customer,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final bool pending = status == "Pending";

    final Color statusBackground = pending
        ? const Color(0xffFFF4EC)
        : const Color(0xffEAF8EF);

    final Color statusColor = pending
        ? const Color(0xffE28A1A)
        : const Color(0xff0B8A47);

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 7,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.08),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [

          /// Order ID + Status
          Row(
            children: [

              Expanded(
                child: Text(
                  orderId,
                  style: AppTextStyles.orderNo,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: AppTextStyles.orderStatus.copyWith(
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// Order Details
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      animal,
                      style: AppTextStyles.orderAnimal,
                    ),

                    const SizedBox(height: 4),

                    Text(
                      time,
                      style: AppTextStyles.orderSubtitle,
                    ),

                    const SizedBox(height: 4),

                    Text(
                      customer,
                      style: AppTextStyles.orderCustomer,
                    ),
                  ],
                ),
              ),

              Text(
                price,
                style: AppTextStyles.orderAmount,
              ),
            ],
          ),
        ],
      ),
    );
  }
}