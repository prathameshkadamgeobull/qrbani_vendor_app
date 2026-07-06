// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:qrbani_vender_app/Screens/dashboard/widgets/custom_bottom_nav.dart';
// import 'package:qrbani_vender_app/Screens/dashboard/widgets/revenue_card.dart';
//
// import '../../blocs/features/dashboard/dashboard_bloc.dart';
// import '../../blocs/features/dashboard/dasboard_state.dart';
//
// import '../../blocs/features/dashboard/dashboard_event.dart';
// import 'widgets/dashboard_header.dart';
// import 'widgets/summary_card.dart';
// import 'widgets/stats_section.dart';
//
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//
//     context.read<DashboardBloc>().add(
//       LoadDashboard(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF5F5F5),
//
//       body: BlocBuilder<DashboardBloc, DashboardState>(
//         builder: (context, state) {
//
//           return SingleChildScrollView(
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//
//                 Column(
//                   children: [
//
//                     DashboardHeader(
//                       vendorName: state.vendorName,
//                     ),
//
//                     const SizedBox(height: 60),
//
//                     StatsSection(
//                       totalOrders: state.totalOrders,
//                       completedOrders: state.completedOrders,
//                       todayOrders: state.todayOrders,
//                       inProgressOrders: state.inProgressOrders,
//                       pendingOrders: state.pendingOrders,
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     RevenueCard(
//                       todayRevenue: state.todayRevenue,
//                       monthGrowth: state.monthGrowth,
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     // Next widgets will come here...
//
//                     const SizedBox(height: 90),
//                   ],
//                 ),
//
//                 Positioned(
//                   top: 150,
//                   left: 20,
//                   right: 20,
//                   child: SummaryCard(
//                     hijriDate: state.hijriDate,
//                     lastUpdated: state.lastUpdated,
//                     currentDate: state.currentDate,
//                     onRefresh: () {
//                       context.read<DashboardBloc>().add(
//                         RefreshDashboardEvent(),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//
//       bottomNavigationBar: const CustomBottomNavigation(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/Screens/dashboard/widgets/ai_forecast_card.dart';
import 'package:qrbani_vender_app/Screens/dashboard/widgets/performance_score_card.dart';

import '../../blocs/features/ai_forecast/ai_forecast_bloc.dart';
import '../../blocs/features/ai_forecast/ai_forecast_event.dart';
import '../../blocs/features/bottom_nav/bottom_nav_bloc.dart';
import '../../blocs/features/bottom_nav/bottom_nav_event.dart';
import '../../blocs/features/dashboard/dashboard_bloc.dart';
import '../../blocs/features/dashboard/dashboard_event.dart';
import '../../blocs/features/dashboard/dasboard_state.dart';

import '../../blocs/features/performance_score/performance_score_bloc.dart';
import '../../blocs/features/performance_score/performance_score_event.dart';
import '../../blocs/features/revenue/revenue_bloc.dart';
import '../../blocs/features/revenue/revenue_event.dart';
import '../ai_forecast/ai_forecast_screen.dart';
import '../drawer/widgets/custom_drawer.dart';
import '../performance_score/widgets/performance_score_screen.dart';
import '../revenue/revenue_screen.dart';
import 'widgets/custom_bottom_nav.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/revenue_card.dart';
import 'widgets/stats_section.dart';
import 'widgets/summary_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();

    // Select Dashboard tab
    context.read<BottomNavBloc>().add(
      ChangeTabEvent(0),
    );

    // Load Dashboard data
    context.read<DashboardBloc>().add(
      LoadDashboard(),
    );
  }
  Future<void> _refreshDashboard() async {
    context.read<DashboardBloc>().add(
      RefreshDashboardEvent(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: const Color(0xffF5F5F5),

      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: _refreshDashboard,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      DashboardHeader(
                        vendorName: state.vendorName,
                      ),

                      const SizedBox(height: 65),

                      StatsSection(
                        totalOrders: state.totalOrders,
                        completedOrders: state.completedOrders,
                        todayOrders: state.todayOrders,
                        inProgressOrders: state.inProgressOrders,
                        pendingOrders: state.pendingOrders,
                      ),

                      const SizedBox(height: 20),

                      RevenueCard(
                        todayRevenue: state.todayRevenue,
                        monthGrowth: state.monthGrowth,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                create: (_) => RevenueBloc()
                                  ..add(const LoadRevenue()),
                                child: const RevenueScreen(),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),



                      AiForecastCard(
                        demand: state.aiDemandTitle,
                        period: state.aiDemandPeriod,
                        recommendation: state.aiRecommendation,
                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                create: (_) => AiForecastBloc()..add(LoadAiForecast()),
                                child: const AiForecastScreen(),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      PerformanceScoreCard(
                        rating: 4.7,
                        status: "Excellent",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                create: (_) =>
                                PerformanceScoreBloc()..add(LoadPerformanceScore()),
                                child: const PerformanceScorePage(),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      // const SizedBox(height: 20),

                    ],
                  ),

                  Positioned(
                    left: 20,
                    right: 20,
                    top: 150,
                    child: SummaryCard(
                      hijriDate: state.hijriDate,
                      lastUpdated: state.lastUpdated,
                      currentDate: state.currentDate,
                      onRefresh: () {
                        context.read<DashboardBloc>().add(
                          RefreshDashboardEvent(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}