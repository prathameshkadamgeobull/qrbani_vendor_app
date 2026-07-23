import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/Screens/request_payout/widgets/SelectBankBottomSheet.dart';
import 'package:qrbani_vender_app/Screens/request_payout/widgets/amount_field.dart';
import 'package:qrbani_vender_app/Screens/request_payout/widgets/balance_card.dart';
import 'package:qrbani_vender_app/Screens/request_payout/widgets/bank_Details.dart';
import 'package:qrbani_vender_app/Screens/request_payout/widgets/important_card.dart';
import 'package:qrbani_vender_app/Screens/request_payout/widgets/payout_Method.dart';
import 'package:qrbani_vender_app/Screens/request_payout/widgets/quick_amount_button.dart';

import '../../blocs/features/request_payout/request_payout_bloc.dart';
import '../../blocs/features/request_payout/request_payout_state.dart';
import '../../models/BankModel.dart';
import '../dashboard/widgets/custom_bottom_nav.dart';
import '../review_payout/review_payout_page.dart';



class RequestPayoutPage extends StatefulWidget {
  const RequestPayoutPage({super.key});

  @override
  State<RequestPayoutPage> createState() => _RequestPayoutPageState();
}

class _RequestPayoutPageState extends State<RequestPayoutPage> {
  final TextEditingController amountController = TextEditingController();

  BankModel selectedBank = const BankModel(
    bankName: "Al Rajhi Bank",
    accountNumber: "**** **** **** 5678",
    accountHolder: "Mohammed Khan",
  );


  Future<void> _selectBank() async {
    final BankModel? bank = await showModalBottomSheet<BankModel>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
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
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RequestPayoutBloc(),
      child: BlocBuilder<RequestPayoutBloc, PayoutState>(
        builder: (context, state)
    {
      return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Request Payout",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BalanceCard(state: state),

                    const SizedBox(height: 24),

                    const Text(
                      "Payout Amount",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    AmountField(
                      controller: amountController,
                    ),

                    const SizedBox(height: 12),

                    QuickAmounts(
                      controller: amountController,
                    ),

                    const SizedBox(height: 12),

                    PayoutMethodCard(
                      onTap: _selectBank,
                    ),

                    const SizedBox(height: 15),

                    BankDetailsCard(
                      bankName: selectedBank.bankName,
                      accountNumber: selectedBank.accountNumber,
                      accountHolder: selectedBank.accountHolder,
                      onChange: _selectBank,
                    ),

                    const SizedBox(height: 15),

                    const ImportantCard(),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: SafeArea(
                top: false,
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: state.isValid
                        ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<RequestPayoutBloc>(),
                            child: ReviewPayoutPage(
                              amount: double.tryParse(state.amount) ?? 0,
                            ),                          ),
                        ),
                      );
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0A5A36),
                      disabledBackgroundColor: Colors.grey.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Review Payout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ),
              ),
            ),
          ],
        ),


        bottomNavigationBar: const CustomBottomNavigation(),
      );

    },
      ),
    );
  }
}