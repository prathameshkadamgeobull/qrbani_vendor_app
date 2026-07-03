import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/Screens/payout/widgets/available_balance_card.dart';
import 'package:qrbani_vender_app/Screens/payout/widgets/payout_details_card.dart';
import 'package:qrbani_vender_app/Screens/payout/widgets/payout_history_button.dart';

import '../../blocs/features/payout/payout_bloc.dart';
import '../../blocs/features/payout/payout_event.dart';
import '../../blocs/features/payout/payout_state.dart';
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
    context.read<PayoutBloc>().add(LoadPayout());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Payouts / Settlement",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

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

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                AvailableBalanceCard(
                  balance: payout?.availableBalance ?? "",
                  onRequestPayout: () {
                    context.read<PayoutBloc>().add(RequestPayout());
                  },
                ),

                const SizedBox(height: 16),

                PayoutDetailCard(
                  nextPayout: payout?.nextPayout ?? "",
                  payoutMethod: payout?.payoutMethod ?? "",
                  bankName: payout?.bankName ?? "",
                  accountNumber: payout?.accountNumber ?? "",
                ),

                const Spacer(),

                PayoutHistoryButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TransactionHistoryPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
              ],
            ),
          );
        },
      ),
    );
  }
}