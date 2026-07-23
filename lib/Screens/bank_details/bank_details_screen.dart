import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/constants/app_text_style.dart';
import '../../blocs/features/bank_details/bank_details_bloc.dart';
import '../../blocs/features/bank_details/bank_details_event.dart';
import '../../blocs/features/bank_details/bank_details_state.dart';

import '../dashboard/widgets/custom_bottom_nav.dart';

import 'addbankdetails/add_bank_details_screen.dart';
import 'widgets/action_card.dart';
import 'widgets/bank_header_card.dart';
import 'widgets/bank_information_card.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({super.key});

  @override
  State<BankDetailsScreen> createState() =>
      _BankDetailsScreenState();
}

class _BankDetailsScreenState
    extends State<BankDetailsScreen> {


  @override
  void initState() {
    super.initState();

    context.read<BankDetailsBloc>().add(
      LoadBankDetails(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        centerTitle: true,

        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors.black87,
          ),
        ),

        title: Text(
          "Bank Details",
          style: AppTextStyles.screenTitle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),

      bottomNavigationBar: const CustomBottomNavigation(
        selectedIndex: 4,
      ),

      body: BlocBuilder<
          BankDetailsBloc,
          BankDetailsState>(
        builder: (context, state) {

          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          /// No Bank Details
          if (!state.hasBankDetails || state.bankDetails == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Icon(
                      Icons.account_balance_outlined,
                      size: 80,
                      color: Color(0xff0B8A47),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "No Bank Details Found",
                      style: AppTextStyles.cardTitle,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Add your bank account to receive payouts.",
                      style: AppTextStyles.body,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff0B8A47),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: context.read<BankDetailsBloc>(),
                                child: const AddBankDetailsScreen(),
                              ),
                            ),
                          );
                        },
                        child: const Text("Add Bank Details"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          final bank = state.bankDetails!;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 16,
            ),
            child: Column(
              children: [

                /// Header
                BankHeaderCard(
                  bank: bank,
                ),

                const SizedBox(height: 18),

                /// Bank Information
                BankInformationCard(
                  bank: bank,
                ),

                const SizedBox(height: 18),

                /// Edit / Delete
                ActionCard(
                  bank: bank,
                ),

                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}