import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/payout/payout_event.dart';

import '../../blocs/features/payout/payout_bloc.dart';
import '../../blocs/features/review_payout/review_payout_bloc.dart';
import '../../blocs/features/review_payout/review_payout_event.dart';
import '../../blocs/features/review_payout/review_payout_state.dart';

import '../../models/BankModel.dart';
import '../payout/payout_screen.dart';
import '../request_payout/widgets/SelectBankBottomSheet.dart';
import 'widgets/review_banner.dart';
import 'widgets/payout_summary_card.dart';
import 'widgets/payout_method_card.dart';
import 'widgets/bank_details_card.dart';
import 'widgets/processing_time_card.dart';
import 'widgets/confirm_button.dart';

class ReviewPayoutPage extends StatefulWidget {
  final double amount;

  const ReviewPayoutPage({super.key,

    required this.amount,
  });


  @override
  State<ReviewPayoutPage> createState() => _ReviewPayoutPageState();
}

class _ReviewPayoutPageState extends State<ReviewPayoutPage> {
  BankModel? selectedBank;


  Future<void> _changeBank() async {
    final bank = await showModalBottomSheet<BankModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (_) => const SelectBankBottomSheet(),
    );

    if (bank != null) {
      setState(() {
        selectedBank = bank;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final payoutState = context.read<PayoutBloc>().state;

    return BlocProvider(
      create: (_) => ReviewPayoutBloc()
        ..add(
          LoadReviewPayout(
            widget.amount,
          ),
        ),

      child: BlocBuilder<
          ReviewPayoutBloc,
          ReviewPayoutState>(
        builder: (context, state) {

          if (state.isLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          final payout = state.payout!;

          return Scaffold(
            backgroundColor: const Color(0xffF5F5F5),

            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              title: const Text(
                "Review Payout",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [

                    ReviewBanner(),

                    const SizedBox(height: 14),

                    PayoutSummaryCard(
                      payout: payout,
                    ),

                    const SizedBox(height: 12),

                    ReviewPayoutMethodCard(
                      payout: payout,
                      onChange: _changeBank,
                    ),

                    const SizedBox(height: 14),

                    ReviewBankDetailsCard(
                      payout: payout,
                      selectedBank: selectedBank,
                    ),

                    const SizedBox(height: 14),

                    const ProcessingTimeCard(),

                    const SizedBox(height: 80),

                  ],
                ),
              ),
            ),

            bottomNavigationBar: ConfirmButton(
              onPressed: () async {

                context.read<ReviewPayoutBloc>().add(
                  ConfirmPayout(),
                );

                await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    content: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Color(0xffEAF7F0),
                          child: Icon(
                            Icons.check_circle,
                            color: Color(0xff0A5A36),
                            size: 45,
                          ),
                        ),

                        SizedBox(height: 20),

                        Text(
                          "Payout Requested",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          "Your payout request has been submitted successfully.",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    actions: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff0A5A36),
                          ),
                          onPressed: () {
                            context.read<PayoutBloc>().add(
                              DeductBalance(widget.amount),
                            );

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: context.read<PayoutBloc>(),
                                  child: const PayoutScreen(),
                                ),
                              ),
                                  (route) => false,
                            );
                          },
                          child: const Text(
                            "Done",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}