  // import 'package:flutter/material.dart';
  //
  // class SummaryCard extends StatelessWidget {
  //   final String hijriDate;
  //   final String lastUpdated;
  //   final String currentDate;
  //   final VoidCallback? onRefresh;
  //
  //   const SummaryCard({
  //     Key? key,
  //     required this.hijriDate,
  //     required this.lastUpdated,
  //     required this.currentDate,
  //     this.onRefresh,
  //   }) : super(key: key);
  //
  //   @override
  //   Widget build(BuildContext context) {
  //
  //     return Material(
  //       elevation: 8,
  //       shadowColor: Colors.black12,
  //       borderRadius: BorderRadius.circular(24),
  //       child: Container(
  //         width: double.infinity,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(24),
  //         ),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //
  //             /// Top Section
  //             Padding(
  //               padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
  //               child: SizedBox(
  //                 width: double.infinity,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //
  //                     const Text(
  //                       "Today's Summary",
  //                       textAlign: TextAlign.left,
  //                       style: TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.black,
  //                       ),
  //                     ),
  //
  //                     const SizedBox(height: 4),
  //
  //                     Text(
  //                       hijriDate,
  //                       textAlign: TextAlign.left,
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w500,
  //                         color: Colors.grey,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //
  //             // Divider(
  //             //   height: 1,
  //             //   color: Colors.grey.shade300,
  //             // ),
  //
  //             Padding(
  //               padding: const EdgeInsets.symmetric(
  //                 horizontal: 15,
  //                 vertical: 13,
  //               ),
  //               child: Row(
  //                 children: [
  //
  //                   Expanded(
  //                     child: Text(
  //                       "Last updated: $lastUpdated",
  //                       style: const TextStyle(
  //                         fontSize: 13,
  //                         fontWeight: FontWeight.w500,
  //                         color: Color(0xff555555),
  //                       ),
  //                     ),
  //                   ),
  //
  //                   Container(
  //                     padding: const EdgeInsets.symmetric(
  //                       horizontal: 6,
  //                       vertical: 10,
  //                     ),
  //                     decoration: BoxDecoration(
  //                       color: const Color(0xffF4F4F4),
  //                       borderRadius: BorderRadius.circular(30),
  //                     ),
  //                     child: Row(
  //                       children: [
  //
  //                         const Icon(
  //                           Icons.access_time,
  //                           size: 18,
  //                           color: Colors.black54,
  //                         ),
  //
  //                         const SizedBox(width: 8),
  //
  //                         Text(
  //                           currentDate,
  //                           style: const TextStyle(
  //                             fontSize: 13,
  //                             fontWeight: FontWeight.w500,
  //                           ),
  //                         ),
  //
  //                         // const SizedBox(width: 12),
  //                         //
  //                         // GestureDetector(
  //                         //   onTap: onRefresh,
  //                         //   child: const Icon(
  //                         //     Icons.refresh,
  //                         //     size: 20,
  //                         //     color: Colors.black54,
  //                         //   ),
  //                         // ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  // }

  import 'package:flutter/material.dart';

  import '../../../Core/constants/app_text_style.dart';

  class SummaryCard extends StatelessWidget {
    final String hijriDate;
    final String lastUpdated;
    final String currentDate;
    final VoidCallback? onRefresh;

    const SummaryCard({
      Key? key,
      required this.hijriDate,
      required this.lastUpdated,
      required this.currentDate,
      this.onRefresh,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Material(
        elevation: 8,
        shadowColor: Colors.black12,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Header
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  24,
                  24,
                  24,
                  20,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Today's Summary",
                        style: AppTextStyles.summaryTitle,
                      ),

                      const SizedBox(height: 6),

                      Text(
                        hijriDate,
                        style: AppTextStyles.hijriDate,
                      ),
                    ],
                  ),
                ),
              ),

              const Divider(
                height: 1,
                thickness: .8,
                color: Color(0xffEEEEEE),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Last updated: $lastUpdated",
                        style: AppTextStyles.bodySmall,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 18,
                            color: Colors.black54,
                          ),

                          const SizedBox(width: 6),

                          Text(
                            currentDate,
                            style: AppTextStyles.bodySmall,
                          ),

                          if (onRefresh != null) ...[
                            const SizedBox(width: 8),

                            GestureDetector(
                              onTap: onRefresh,
                              child: const Icon(
                                Icons.refresh,
                                size: 18,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }