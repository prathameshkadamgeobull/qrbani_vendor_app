// import 'package:flutter/material.dart';
//
// class StatCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final Color color;
//
//   const StatCard({
//     super.key,
//     required this.title,
//     required this.value,
//     required this.color,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // return Container(
//     //   width: 110,
//     //   height: 95,
//     //   decoration: BoxDecoration(
//     //     color: color,
//     //     borderRadius: BorderRadius.circular(18),
//     //   ),
//     //   padding: const EdgeInsets.symmetric(
//     //     horizontal: 12,
//     //     vertical: 10,
//     //   ),
//     //   child: Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: [
//     //
//     //       Text(
//     //         title,
//     //         style: const TextStyle(
//     //           color: Colors.white,
//     //           fontSize: 13,
//     //           fontWeight: FontWeight.w500,
//     //         ),
//     //       ),
//     //
//     //       const Spacer(),
//     //
//     //       Text(
//     //         value,
//     //         style: const TextStyle(
//     //           color: Colors.white,
//     //           fontSize: 22,
//     //           fontWeight: FontWeight.bold,
//     //         ),
//     //       ),
//     //     ],
//     //   ),
//     // );
//     return Container(
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(18),
//       ),
//       padding: const EdgeInsets.symmetric(
//         horizontal: 14,
//         vertical: 12,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 13,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const SizedBox(height: 14),
//           Text(
//             value,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:ui';

import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 95,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}