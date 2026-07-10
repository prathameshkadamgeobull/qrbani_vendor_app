import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

import 'widgets/ai_forecast_card.dart';
import 'widgets/custom_bottom_nav.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/performance_score_card.dart';
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

    context.read<BottomNavBloc>().add(
      ChangeTabEvent(0),
    );

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
      backgroundColor: const Color(0xffF6F7FB),

      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: _refreshDashboard,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [

                  /// HEADER
                  DashboardHeader(
                    vendorName: state.vendorName,
                  ),

                  /// OVERLAPPING CONTENT
                  Transform.translate(
                    offset: const Offset(0, -110),
                    child: Column(
                      children: [

                        /// REVENUE CARD
                        RevenueCard(
                          todayRevenue: state.todayRevenue,
                          monthGrowth: state.monthGrowth,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                  create: (_) => RevenueBloc()
                                    ..add(
                                      const LoadRevenue(),
                                    ),
                                  child: const RevenueScreen(),
                                ),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 16),

                        /// SUMMARY CARD
                        SummaryCard(
                          hijriDate: state.hijriDate,
                          lastUpdated: state.lastUpdated,
                          currentDate: state.currentDate,
                          onRefresh: () {
                            context.read<DashboardBloc>().add(
                              RefreshDashboardEvent(),
                            );
                          },
                        ),

                        const SizedBox(height: 28),

                        /// STATS
                        StatsSection(
                          totalOrders: state.totalOrders,
                          completedOrders: state.completedOrders,
                          todayOrders: state.todayOrders,
                          inProgressOrders: state.inProgressOrders,
                          pendingOrders: state.pendingOrders,
                        ),

                        const SizedBox(height: 15),

                        /// AI FORECAST
                        AiForecastCard(
                          demand: state.aiDemandTitle,
                          period: state.aiDemandPeriod,
                          recommendation: state.aiRecommendation,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                  create: (_) => AiForecastBloc()
                                    ..add(
                                      LoadAiForecast(),
                                    ),
                                  child: const AiForecastScreen(),
                                ),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 15),

                        /// PERFORMANCE
                        PerformanceScoreCard(
                          rating: 4.7,
                          status: "Excellent",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                  create: (_) => PerformanceScoreBloc()
                                    ..add(
                                      LoadPerformanceScore(),
                                    ),
                                  child: const PerformanceScorePage(),
                                ),
                              ),
                            );
                          },
                        ),
                       // SizedBox(height: 10),
                      ],
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