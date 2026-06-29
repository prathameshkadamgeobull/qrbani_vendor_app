  // import 'package:flutter/material.dart';
  // import 'package:intl/intl.dart';
  //
  // import '../../../Core/constants/app_colors.dart';
  //
  // class RevenueCard extends StatelessWidget {
  //   final double todayRevenue;
  //   final double monthGrowth;
  //
  //   const RevenueCard({
  //     super.key,
  //     required this.todayRevenue,
  //     required this.monthGrowth,
  //   });
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     final formatter = NumberFormat("#,##0");
  //
  //     return Container(
  //       margin: const EdgeInsets.symmetric(horizontal: 16),
  //       padding: const EdgeInsets.symmetric(
  //         horizontal: 18,
  //         vertical: 16,
  //       ),
  //       height: 110,
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(18),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black.withOpacity(.06),
  //             blurRadius: 10,
  //             offset: const Offset(0, 3),
  //           ),
  //         ],
  //       ),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //
  //           /// LEFT SIDE
  //           Expanded(
  //             flex: 5,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //
  //                 const Text(
  //                   "Today's Revenue",
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w600,
  //                     color: Colors.black87,
  //                   ),
  //                 ),
  //
  //                 const SizedBox(height: 10),
  //
  //                 Text(
  //                   "SAR ${formatter.format(todayRevenue)}",
  //                   maxLines: 1,
  //                   overflow: TextOverflow.ellipsis,
  //                   style: TextStyle(
  //                     fontSize: 22,
  //                     fontWeight: FontWeight.bold,
  //                     color: AppColors.black,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //
  //           const SizedBox(width: 12),
  //
  //           /// RIGHT SIDE
  //           Expanded(
  //             flex: 4,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.end,
  //               children: [
  //
  //                 const Text(
  //                   "This Month (So far)",
  //                   maxLines: 1,
  //                   overflow: TextOverflow.ellipsis,
  //                   textAlign: TextAlign.right,
  //                   style: TextStyle(
  //                     fontSize: 13,
  //                     fontWeight: FontWeight.w500,
  //                     color: Colors.black54,
  //                   ),
  //                 ),
  //
  //                 const SizedBox(height: 10),
  //
  //                 RichText(
  //                   textAlign: TextAlign.right,
  //                   text: TextSpan(
  //                     style: const TextStyle(
  //                       fontFamily: 'Roboto',
  //                     ),
  //                     children: [
  //
  //                       TextSpan(
  //                         text: "+${monthGrowth.toStringAsFixed(1)}%",
  //                         style: const TextStyle(
  //                           color: Color(0xff0B8A47),
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 15,
  //                         ),
  //                       ),
  //
  //                       const TextSpan(
  //                         text: "  vs last month",
  //                         style: TextStyle(
  //                           color: Colors.black54,
  //                           fontSize: 11,
  //                           fontWeight: FontWeight.w500,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }

  import 'package:flutter/material.dart';
  import 'package:intl/intl.dart';

  import '../../../Core/constants/app_text_style.dart';
import '../../../core/constants/app_colors.dart';

  class RevenueCard extends StatelessWidget {
    final double todayRevenue;
    final double monthGrowth;

    const RevenueCard({
      super.key,
      required this.todayRevenue,
      required this.monthGrowth,
    });

    @override
    Widget build(BuildContext context) {
      final formatter = NumberFormat("#,##0");

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xffECECEC),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            /// Left Section
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Today's Revenue",
                    style: AppTextStyles.revenueTitle,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "SAR ${formatter.format(todayRevenue)}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.revenueAmount.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            /// Right Section
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "This Month (So far)",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.bodySmall,
                  ),

                  const SizedBox(height: 10),

                  RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "+${monthGrowth.toStringAsFixed(1)}%",
                          style: AppTextStyles.revenueGrowth,
                        ),
                        TextSpan(
                          text: "  vs last month",
                          style: AppTextStyles.revenueCompare,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }