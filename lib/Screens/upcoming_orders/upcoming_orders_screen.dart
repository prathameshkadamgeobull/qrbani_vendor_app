import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/Screens/upcoming_orders/widgets/upcoming_orders_header.dart';

import '../../blocs/features/upcoming_orders/upcoming_orders_bloc.dart';
import '../../blocs/features/upcoming_orders/upcoming_orders_event.dart';
import '../../blocs/features/upcoming_orders/upcoming_orders_state.dart';

import '../dashboard/widgets/custom_bottom_nav.dart';
import 'widgets/upcoming_order_card.dart';

class UpcomingOrdersScreen extends StatefulWidget {
  const UpcomingOrdersScreen({super.key});

  @override
  State<UpcomingOrdersScreen> createState() =>
      _UpcomingOrdersScreenState();
}

class _UpcomingOrdersScreenState
    extends State<UpcomingOrdersScreen> {
  final List<String> tabs = [
    "Tomorrow",
    "Day After",
    "This Week",
  ];

  @override
  void initState() {
    super.initState();

    context.read<UpcomingOrdersBloc>().add(
      LoadUpcomingOrders(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),

      body: SafeArea(
        child: BlocBuilder<
            UpcomingOrdersBloc,
            UpcomingOrdersState>(
          builder: (context, state) {
            return Column(
              children: [

                UpcomingHeader(
                  onBack: () {
                    Navigator.pop(context);
                  },
                  onNotification: () {},
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 42,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) =>
                    const SizedBox(width: 10),
                    itemCount: tabs.length,
                    itemBuilder: (context, index) {
                      final tab = tabs[index];

                      final selected =
                          state.selectedTab == tab;

                      return GestureDetector(
                        onTap: () {
                          context
                              .read<
                              UpcomingOrdersBloc>()
                              .add(
                            ChangeUpcomingTab(tab),
                          );
                        },
                        child: Container(
                          padding:
                          const EdgeInsets.symmetric(
                            horizontal: 18,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selected
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius:
                            BorderRadius.circular(
                              22,
                            ),
                            border: Border.all(
                              color: selected
                                  ? Colors.grey.shade300
                                  : Colors.transparent,
                            ),
                          ),
                          child: Text(
                            tab,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: selected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 18),

                Expanded(
                  child: state.isLoading
                      ? const Center(
                    child:
                    CircularProgressIndicator(),
                  )
                      : ListView.builder(
                    padding:
                    const EdgeInsets.only(
                      bottom: 20,
                    ),
                    itemCount:
                    state.filteredOrders.length,
                    itemBuilder:
                        (context, index) {
                      return UpcomingOrderCard(
                        order: state
                            .filteredOrders[index],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),

      // bottomNavigationBar:
      // const CustomBottomNavigation(),
    );
  }
}