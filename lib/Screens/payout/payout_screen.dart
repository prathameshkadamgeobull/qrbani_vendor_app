import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/Screens/payout/widgets/available_balance_card.dart';
import 'package:qrbani_vender_app/Screens/payout/widgets/payout_details_card.dart';
import 'package:qrbani_vender_app/Screens/payout/widgets/payout_history_button.dart';

import '../../blocs/features/payout/payout_bloc.dart';
import '../../blocs/features/payout/payout_event.dart';
import '../../blocs/features/payout/payout_state.dart';
import '../dashboard/dashboard_screen.dart';
import '../dashboard/widgets/custom_bottom_nav.dart';
import '../request_payout/request_payout_page.dart';
import '../transaction_history/transaction_history_page.dart';

class PayoutScreen extends StatefulWidget {
  const PayoutScreen({super.key});

  @override
  State<PayoutScreen> createState() => _PayoutScreenState();
}

class _PayoutScreenState extends State<PayoutScreen> {

  @override
  void initState() {
    super.initState();

    final bloc = context.read<PayoutBloc>();

    if (bloc.state.payout == null) {
      bloc.add(LoadPayout());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),

      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   title: const Text(
      //     "Payouts / Settlement",
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ),

      // 👇 HERE is where your BlocBuilder goes
      body: BlocBuilder<PayoutBloc, PayoutState>(
        builder: (context, state) {
          final payout = state.payout;

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: Text(state.error!));
          }

          return Scaffold(
            backgroundColor: const Color(0xffF8F8F8),

              appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Navigator.pushReplacementNamed(context, '/dashboard');

                    // OR if you use a DashboardScreen widget:
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DashboardScreen(),
                      ),
                    );
                  },
                ),
                title: const Text(
                  "Payouts / Settlement",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

            body: BlocBuilder<PayoutBloc, PayoutState>(
              builder: (context, state) {
                final payout = state.payout;

                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state.error != null) {
                  return Center(
                    child: Text(state.error!),
                  );
                }

                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                AvailableBalanceCard(
                                  balance: "SAR ${(payout?.availableBalance ?? "0")
                                      .replaceAll("SAR", "")
                                      .trim()}",
                                  onRequestPayout: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const RequestPayoutPage(),
                                      ),
                                    );
                                  },
                                ),



                                const SizedBox(height: 16),

                                PayoutDetailCard(
                                  nextPayout: payout?.nextPayout ?? "",
                                  payoutMethod: payout?.payoutMethod ?? "",
                                  bankName: payout?.bankName ?? "",
                                  accountNumber: payout?.accountNumber ?? "",
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        PayoutHistoryButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const TransactionHistoryPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            bottomNavigationBar: const CustomBottomNavigation(),
          );

        },
      ),
    );
  }
}