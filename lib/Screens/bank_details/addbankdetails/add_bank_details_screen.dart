import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/Screens/bank_details/addbankdetails/widgets/add_bank_header.dart';
import 'package:qrbani_vender_app/Screens/bank_details/addbankdetails/widgets/bank_form_card.dart';
import 'package:qrbani_vender_app/Screens/bank_details/addbankdetails/widgets/save_button.dart';
import 'package:qrbani_vender_app/Screens/bank_details/addbankdetails/widgets/security_info_card.dart';

import '../../../blocs/features/bank_details/bank_details_bloc.dart';
import '../../../blocs/features/bank_details/bank_details_event.dart';
import '../../../Core/constants/app_text_style.dart';

import '../../../models/bank_details_model.dart';

import '../bank_details_screen.dart';



class AddBankDetailsScreen extends StatefulWidget {
  const AddBankDetailsScreen({super.key});

  @override
  State<AddBankDetailsScreen> createState() =>
      _AddBankDetailsScreenState();
}

class _AddBankDetailsScreenState
    extends State<AddBankDetailsScreen> {

  final _formKey = GlobalKey<FormState>();

  final bankNameController = TextEditingController();
  final holderController = TextEditingController();
  final accountController = TextEditingController();
  final branchController = TextEditingController();
  final ibanController = TextEditingController();
  final swiftController = TextEditingController();

  String? accountType;

  @override
  void dispose() {
    bankNameController.dispose();
    holderController.dispose();
    accountController.dispose();
    branchController.dispose();
    ibanController.dispose();
    swiftController.dispose();
    super.dispose();
  }

  void _saveBankDetails() {

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final bank = BankDetailsModel(
      businessName: "Qrbani Vendor", // Replace with actual business name if available

      accountType: accountType ?? "",

      verified: false,

      bankName: bankNameController.text.trim(),

      accountHolderName: holderController.text.trim(),

      accountNumber: accountController.text.trim(),

      accountCategory: accountType ?? "",

      branchName: branchController.text.trim(),

      iban: ibanController.text.trim(),

      swiftCode: swiftController.text.trim(),

      addedOn: DateTime.now().toString(),
    );

    context.read<BankDetailsBloc>().add(
      AddBankDetails(bank),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Bank details saved successfully",
        ),
        backgroundColor: Color(0xff0B8A47),
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<BankDetailsBloc>(),
          child: const BankDetailsScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),

        title: Text(
          "Add Bank Details",
          style: AppTextStyles.screenTitle.copyWith(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      bottomNavigationBar: SaveButton(
        title: "Save Bank Details",
        onPressed: _saveBankDetails,
      ),

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              18,
              18,
              18,
              100,
            ),
            child: Column(
              children: [

                /// Header
                const AddBankHeader(),

                const SizedBox(height: 20),

                /// Form
                BankFormCard(
                  bankNameController: bankNameController,
                  holderController: holderController,
                  accountController: accountController,
                  branchController: branchController,
                  ibanController: ibanController,
                  swiftController: swiftController,
                  accountType: accountType,
                  onAccountTypeChanged: (value) {
                    setState(() {
                      accountType = value;
                    });
                  },
                ),

                const SizedBox(height: 20),

                /// Security Card
                const SecurityInfoCard(),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}