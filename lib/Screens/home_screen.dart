import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/Screens/reports/reports_screen.dart';

import '../blocs/features/bottom_nav/bottom_nav_bloc.dart';
import '../blocs/features/bottom_nav/bottom_nav_event.dart';
import '../blocs/features/bottom_nav/bottom_nav_state.dart';
import 'dashboard/dashboard_screen.dart';
import 'dashboard/widgets/custom_bottom_nav.dart';
import 'inventory/inventory_screen.dart';
import 'orders/orders_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final pages = [
    const DashboardScreen(),
    const OrdersScreen(),
    const InventoryScreen(),
    const ReportsScreen(),
   // const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            final bloc = context.read<BottomNavBloc>();

            if (bloc.state.currentIndex != 0) {
              bloc.add(ChangeTabEvent(0));
            } else {
              Navigator.of(context).maybePop();
            }
          },
          child: Scaffold(
            body: IndexedStack(
              index: state.currentIndex,
              children: pages,
            ),
            bottomNavigationBar: const CustomBottomNavigation(),
          ),
        );
      },
    );
  }
}