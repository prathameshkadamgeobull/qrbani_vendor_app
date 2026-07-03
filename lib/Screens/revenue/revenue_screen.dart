import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/features/revenue/revenue_bloc.dart';
import '../../blocs/features/revenue/revenue_event.dart';
import '../../blocs/features/revenue/revenue_state.dart';

import 'widgets/revenue_chart.dart';
import 'widgets/revenue_header.dart';

class RevenueScreen extends StatefulWidget {
  const RevenueScreen({super.key});

  @override
  State<RevenueScreen> createState() => _RevenueScreenState();
}

class _RevenueScreenState extends State<RevenueScreen> {
  @override
  void initState() {
    super.initState();

    context.read<RevenueBloc>().add(
      const LoadRevenue(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: BlocBuilder<RevenueBloc, RevenueState>(
          builder: (context, state) {
            if (state.isLoading || state.revenue == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final revenue = state.revenue!;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RevenueHeader(
                    onBack: () {
                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(height: 18),

                  /// TODAY
                  const Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff7D7D7D),
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    "SAR ${revenue.todayRevenue.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Divider(
                    thickness: 1,
                    color: Color(0xffE8E8E8),
                  ),

                  const SizedBox(height: 12),

                  /// MONTH
                  const Text(
                    "This Week",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff7D7D7D),
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    "SAR ${revenue.monthRevenue.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Divider(
                    thickness: 1,
                    color: Color(0xffE8E8E8),
                  ),

                  const SizedBox(height: 12),

                  /// TOTAL
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "This Month",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff7D7D7D),
                              ),
                            ),

                            const SizedBox(height: 3),

                            Text(
                              "SAR ${revenue.totalRevenue.toStringAsFixed(0)}",
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                              "+${revenue.growthPercentage.toStringAsFixed(1)}%",
                              style: const TextStyle(
                                color: Color(0xff16A34A),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            const TextSpan(
                              text: " vs last month",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// GRAPH
                  Container(
                    //padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xffECECEC),
                      ),
                    ),
                    child: SizedBox(
                      height: 340,
                      child: RevenueChart(
                        revenue: revenue,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}