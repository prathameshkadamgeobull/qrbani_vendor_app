  // import 'package:flutter/material.dart';
  //
  // import '../../../Core/constants/app_text_style.dart';
  // import '../../upcoming_orders/upcoming_orders_screen.dart';
  //
  // class OrdersHeader extends StatefulWidget {
  //   final String hijriDate;
  //   final String selectedStatus;
  //   final ValueChanged<String> onStatusChanged;
  //   final VoidCallback onBack;
  //   final int goatCount;
  //   final int sheepCount;
  //   final int camelCount;
  //   final VoidCallback onUpcoming;
  //   final VoidCallback onNotification;
  //
  //   const OrdersHeader({
  //     super.key,
  //     required this.hijriDate,
  //     required this.selectedStatus,
  //     required this.onStatusChanged,
  //     required this.onBack,
  //     required this.goatCount,
  //     required this.sheepCount,
  //     required this.camelCount,
  //     required this.onUpcoming,
  //     required this.onNotification,
  //   });
  //
  //   @override
  //   State<OrdersHeader> createState() => _OrdersHeaderState();
  // }
  //
  // class _OrdersHeaderState extends State<OrdersHeader> {
  //   final List<String> tabs = [
  //     "All",
  //     "Pending",
  //     "In Progress",
  //     "Completed",
  //   ];
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     return SafeArea(
  //       bottom: false,
  //       child: Container(
  //         color: Colors.white,
  //         child: Column(
  //           children: [
  //             const SizedBox(height: 8),
  //
  //             /// Title
  //             const Row(
  //               children: [
  //                 SizedBox(width: 40),
  //
  //                 Expanded(
  //                   child: Center(
  //                     child: Text(
  //                       "Orders (Today)",
  //                       style: AppTextStyles.orderTitle,
  //                     ),
  //                   ),
  //                 ),
  //
  //                 SizedBox(width: 40),
  //               ],
  //             ),
  //
  //             const SizedBox(height: 12),
  //
  //             /// Back + Date + Notification
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 14),
  //               child: Row(
  //                 children: [
  //                   InkWell(
  //                     onTap: widget.onBack,
  //                     child: const Icon(
  //                       Icons.arrow_back_ios_new_rounded,
  //                       size: 18,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //
  //                   const SizedBox(width: 10),
  //
  //                   Text(
  //                     widget.hijriDate,
  //                     style: AppTextStyles.orderDate,
  //                   ),
  //
  //                   const Spacer(),
  //
  //                   InkWell(
  //                     borderRadius: BorderRadius.circular(20),
  //                     onTap: () {
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (_) => const UpcomingOrdersScreen(),
  //                         ),
  //                       );
  //                     },
  //                     child: Stack(
  //                       clipBehavior: Clip.none,
  //                       children: [
  //                         const Icon(
  //                           Icons.notifications_none_outlined,
  //                           size: 24,
  //                           color: Colors.black87,
  //                         ),
  //
  //                         Positioned(
  //                           top: 2,
  //                           right: 1,
  //                           child: Container(
  //                             width: 8,
  //                             height: 8,
  //                             decoration: const BoxDecoration(
  //                               color: Colors.orange,
  //                               shape: BoxShape.circle,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //
  //             const SizedBox(height: 18),
  //
  //             SizedBox(
  //               height: 36,
  //               child: ListView.separated(
  //                 scrollDirection: Axis.horizontal,
  //                 padding: const EdgeInsets.symmetric(horizontal: 12),
  //                 itemCount: tabs.length,
  //                 separatorBuilder: (_, __) => const SizedBox(width: 8),
  //                 itemBuilder: (context, index) {
  //                   final bool isSelected =
  //                       widget.selectedStatus == tabs[index];
  //
  //                   return GestureDetector(
  //                     onTap: () {
  //                       widget.onStatusChanged(tabs[index]);
  //                     },
  //                     child: AnimatedContainer(
  //                       duration: const Duration(milliseconds: 200),
  //                       alignment: Alignment.center,
  //                       padding: const EdgeInsets.symmetric(horizontal: 16),
  //                       decoration: BoxDecoration(
  //                         color: isSelected
  //                             ? const Color(0xffF5F5F5)
  //                             : Colors.white,
  //                         borderRadius: BorderRadius.circular(18),
  //                         border: Border.all(
  //                           color: const Color(0xffE5E5E5),
  //                         ),
  //                       ),
  //                       child: Text(
  //                         tabs[index],
  //                         style: isSelected
  //                             ? AppTextStyles.orderTabSelected
  //                             : AppTextStyles.orderTab.copyWith(
  //                           color: const Color(0xff666666),
  //                         ),
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //
  //             const SizedBox(height: 8),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  // }

  import 'package:flutter/material.dart';

  import '../../../Core/constants/app_text_style.dart';

  class OrdersHeader extends StatefulWidget {
    final String hijriDate;
    final String selectedStatus;
    final ValueChanged<String> onStatusChanged;
    final VoidCallback onBack;
    final VoidCallback onNotification;
    final VoidCallback onUpcoming;

    final int goatCount;
    final int sheepCount;
    final int camelCount;

    const OrdersHeader({
      super.key,
      required this.hijriDate,
      required this.selectedStatus,
      required this.onStatusChanged,
      required this.onBack,
      required this.onNotification,
      required this.onUpcoming,
      required this.goatCount,
      required this.sheepCount,
      required this.camelCount,
    });

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
          child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [

              const SizedBox(height: 10),

              /// Title
              const Center(
                child: Text(
                  "Orders (Today)",
                  style: AppTextStyles.orderTitle,
                ),
              ),

              const SizedBox(height: 15),

              /// Back + Date + Notification
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [

                    InkWell(
                      onTap: widget.onBack,
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Text(
                      widget.hijriDate,
                      style: AppTextStyles.orderDate,
                    ),

                    const Spacer(),

                    InkWell(
                      onTap: widget.onNotification,
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [

                          const Icon(
                            Icons.filter_list,
                            size: 24,
                          ),

                          Positioned(
                            top: 2,
                            right: 2,
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

              /// Animal Count + Upcoming Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [

                    Expanded(
                      child: _animalCard(
                        "Goat",
                        widget.goatCount,
                        Icons.pets,
                        Colors.orange,
                      ),
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: _animalCard(
                        "Sheep",
                        widget.sheepCount,
                        Icons.cruelty_free,
                        Colors.green,
                      ),
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: _animalCard(
                        "Camel",
                        widget.camelCount,
                        Icons.agriculture,
                        Colors.brown,
                      ),
                    ),

                    const SizedBox(width: 10),

                    ElevatedButton.icon(
                      onPressed: widget.onUpcoming,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0B8A47),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      icon: const Icon(
                        Icons.schedule,
                        size: 18,
                      ),
                      label: const Text(
                        "Upcoming",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              /// Status Tabs
              SizedBox(
                height: 34,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: tabs.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: 8),
                  itemBuilder: (context, index) {

                    final selected =
                        widget.selectedStatus == tabs[index];

                    return GestureDetector(
                      onTap: () {
                        widget.onStatusChanged(tabs[index]);
                      },
                      child: AnimatedContainer(
                        duration:
                        const Duration(milliseconds: 250),
                        padding:
                        const EdgeInsets.symmetric(horizontal: 18),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(0xff0B8A47)
                              : Colors.white,
                          borderRadius:
                          BorderRadius.circular(20),
                          border: Border.all(
                            color: selected
                                ? const Color(0xff0B8A47)
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            color: selected
                                ? Colors.white
                                : Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
        ),
      );
    }
    Widget _animalCard(
        String title,
        int count,
        IconData icon,
        Color color,
        ) {
      return Container(
        constraints: const BoxConstraints(
          minHeight: 60,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(.08),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
              size: 13,
            ),

            const SizedBox(height: 1),

            Text(
              "$count",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),

            Text(
              title,
              style: TextStyle(
                fontSize: 9,
                height: 1,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }
  }