
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/features/bottom_nav/bottom_nav_bloc.dart';
import '../../blocs/features/bottom_nav/bottom_nav_event.dart';

import '../../blocs/features/orders/orders_bloc.dart';
import '../../blocs/features/orders/orders_event.dart';
import '../../blocs/features/orders/orders_state.dart';

import '../dashboard/widgets/custom_bottom_nav.dart';
import '../upcoming_orders/upcoming_orders_screen.dart';

import 'widgets/order_card.dart';
import 'widgets/orders_header.dart';

class OrdersScreen extends StatefulWidget {
  final String initialStatus;
  const OrdersScreen({
    super.key,
    this.initialStatus = "All",
  });

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late String selectedStatus;
  bool autoAccept = false;

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.initialStatus;
    context.read<OrdersBloc>().add(LoadOrders());
    context.read<BottomNavBloc>().add(ChangeTabEvent(1));
    context.read<OrdersBloc>().add(
      LoadOrders(
        initialStatus: widget.initialStatus,
      ),
    );

    context.read<BottomNavBloc>().add(
      ChangeTabEvent(1),
    );
  }

  @override
  Widget build(BuildContext context) {
     return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
      if (!didPop) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/dashboard",
              (route) => false,
        );

        context.read<BottomNavBloc>().add(
          ChangeTabEvent(0),
        );
      }
    },

    child:   Scaffold(
      backgroundColor: const Color(0xffF6F6F6),

      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          /// Today's Animal Count
          final goatCount = state.allOrders
              .where((e) => e.animal.toLowerCase() == "goat")
              .length;

          final sheepCount = state.allOrders
              .where((e) => e.animal.toLowerCase() == "sheep")
              .length;

          final camelCount = state.allOrders
              .where((e) => e.animal.toLowerCase() == "camel")
              .length;

          return Column(
            children: [
              OrdersHeader(
                hijriDate: state.hijriDate,
                selectedStatus: state.selectedStatus,
               autoAccept: autoAccept,
                 onAutoAcceptChanged: (value) {
                   setState(() {
                     autoAccept = value;
                   });
                 },


                goatCount: goatCount,
                sheepCount: sheepCount,
                camelCount: camelCount,

                onUpcoming: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const UpcomingOrdersScreen(),
                    ),
                  );
                },

                onStatusChanged: (status) {
                  context.read<OrdersBloc>().add(
                    ChangeOrderStatus(status),
                  );
                },

                onBack: () {
                  context.read<BottomNavBloc>().add(
                    ChangeTabEvent(0),
                  );

                  Navigator.pop(context);
                },

                onNotification: () {
                  // TODO: Notification Screen
                },
              ),

              Expanded(
                child: state.isLoading
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : state.filteredOrders.isEmpty
                    ? const Center(
                  child: Text(
                    "No Orders Available",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
                    : ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  itemCount: state.filteredOrders.length,
                  itemBuilder: (context, index) {
                    final order =
                    state.filteredOrders[index];

                    return OrderCard(
                      orderNo: order.orderNo,
                      animal: order.animal,
                      pickupTime: order.pickupTime,
                      customerName: order.customerName,
                      location: order.location,
                      amount: order.amount,
                      status: order.status,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),

      bottomNavigationBar: const CustomBottomNavigation(),
    ),
    );

  }
}