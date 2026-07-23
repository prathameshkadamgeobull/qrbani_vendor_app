import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/Screens/inventory_report/inventory_report_screen.dart';
import 'package:qrbani_vender_app/Screens/order_report/order_report_screen.dart';
import 'package:qrbani_vender_app/Screens/payout_report/payout_report_screen.dart';
import 'package:qrbani_vender_app/Screens/tax_report/tax_report_screen.dart';

import '../../blocs/features/bottom_nav/bottom_nav_bloc.dart';
import '../../blocs/features/bottom_nav/bottom_nav_event.dart';
import '../../blocs/features/reports/reports_bloc.dart';
import '../../blocs/features/reports/reports_event.dart';
import '../../blocs/features/reports/reports_state.dart';
import '../daily_report/daily_report_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../dashboard/widgets/custom_bottom_nav.dart';
import '../revenue_report/revenue_screen.dart';
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<BottomNavBloc>().add(
              ChangeTabEvent(0),
            );

            Navigator.pop(context);
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

                            if (report.title == "Daily Report") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ReportPage(),
                                ),
                              );
                            }
                            if (report.title == "Orders Report") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OrderReportScreen(),
                                ),
                              );
                            }
                            if (report.title == "Inventory Report") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StockReportPage(),
                                ),
                              );
                            }
                            if (report.title == "Revenue Report") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RevenueReportScreen(),
                                ),
                              );
                            }


                            if (report.title == "Payout Report") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PayoutReportScreen(),
                                ),
                              );
                            }
                            if (report.title == "Tax Report") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TaxReportScreen(),
                                ),
                              );
                            }

                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  // CustomReportButton(
                  //   onPressed: () {},
                  // ),

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