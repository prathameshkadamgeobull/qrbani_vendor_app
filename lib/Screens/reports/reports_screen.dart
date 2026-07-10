import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/features/bottom_nav/bottom_nav_bloc.dart';
import '../../blocs/features/bottom_nav/bottom_nav_event.dart';
import '../../blocs/features/reports/reports_bloc.dart';
import '../../blocs/features/reports/reports_event.dart';
import '../../blocs/features/reports/reports_state.dart';
import '../dashboard/dashboard_screen.dart';
import '../dashboard/widgets/custom_bottom_nav.dart';
import 'widgets/custom_report_button.dart';
import 'widgets/report_item.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {

  @override
  void initState() {
    super.initState();
    context.read<ReportsBloc>().add(LoadReports());
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
    child:
      Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // Makes back arrow and title black
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const DashboardScreen(),
              ),
            );
          },
        ),
        title: const Text("Reports"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<ReportsBloc, ReportsState>(
          builder: (context, state) {

            if (state is ReportsLoaded) {
              return Column(
                children: [

                  Expanded(
                    child: ListView.builder(
                      itemCount: state.reports.length,
                      itemBuilder: (_, index) {

                        final report = state.reports[index];

                        return ReportItem(
                          title: report.title,
                          icon: report.icon,
                          onTap: () {
                            context.read<ReportsBloc>().add(
                              ReportClicked(report.title),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomReportButton(
                    onPressed: () {},
                  ),

                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
      ),
    );
  }

}