// import 'package:flutter/material.dart';
//
// class DashboardHeader extends StatelessWidget {
//   final String vendorName;
//
//   const DashboardHeader({
//     super.key,
//     required this.vendorName,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Container(
//         width: double.infinity,
//         height: 280,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xff0A5A36),
//               Color(0xff084D31),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(35),
//             bottomRight: Radius.circular(35),
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.only(
//               left: 30,
//               right: 25,
//               top: 35,
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 /// LEFT SIDE
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                       const Text(
//                         "Assalamu Alaikum,",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 17,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//
//                       const SizedBox(height: 8),
//
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//
//                           Flexible(
//                             child: Text(
//                               vendorName,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//
//                           const SizedBox(width: 6),
//
//                           const Icon(
//                             Icons.keyboard_arrow_down_rounded,
//                             color: Colors.white,
//                             size: 28,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 /// RIGHT SIDE
//                 Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//
//                     Container(
//                       height: 50,
//                       width: 50,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.notifications_none,
//                         color: Color(0xff0B5E3C),
//                         size: 26,
//                       ),
//                     ),
//
//                     Positioned(
//                       top: 5,
//                       right: 5,
//                       child: Container(
//                         height: 10,
//                         width: 10,
//                         decoration: const BoxDecoration(
//                           color: Color(0xffF6A800),
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//   }
// }


import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';


class DashboardHeader extends StatelessWidget {
  final String vendorName;

  const DashboardHeader({
    super.key,
    required this.vendorName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff0A5A36),
            Color(0xff084D31),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 25,
            top: 35,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Left Side
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Assalamu Alaikum,",
                      style: AppTextStyles.greeting,
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            vendorName,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.vendorName,
                          ),
                        ),

                        const SizedBox(width: 6),

                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// Notification
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.notifications_none,
                      color: Color(0xff0B5E3C),
                      size: 26,
                    ),
                  ),

                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Color(0xffF6A800),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}