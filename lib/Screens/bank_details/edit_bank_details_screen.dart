import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/constants/app_text_style.dart';

import '../../blocs/features/bank_details/bank_details_bloc.dart';
import '../../blocs/features/bank_details/bank_details_event.dart';

import '../../models/bank_details_model.dart';

import 'widgets/custom_textfield.dart';

class EditBankDetailsScreen extends StatefulWidget {
  final BankDetailsModel bank;

  const EditBankDetailsScreen({
    super.key,
    required this.bank,
  });

  @override
  State<EditBankDetailsScreen> createState() =>
      _EditBankDetailsScreenState();
}

class _EditBankDetailsScreenState
    extends State<EditBankDetailsScreen> {

  final _formKey = GlobalKey<FormState>();

  late TextEditingController bankNameController;
  late TextEditingController holderController;
  late TextEditingController accountController;
  late TextEditingController typeController;
  late TextEditingController branchController;
  late TextEditingController ibanController;
  late TextEditingController swiftController;

  @override
  void initState() {
    super.initState();

    bankNameController =
        TextEditingController(
          text: widget.bank.bankName,
        );

    holderController =
        TextEditingController(
          text: widget.bank.accountHolderName,
        );

    accountController =
        TextEditingController(
          text: widget.bank.accountNumber,
        );

    typeController =
        TextEditingController(
          text: widget.bank.accountCategory,
        );

    branchController =
        TextEditingController(
          text: widget.bank.branchName,
        );

    ibanController =
        TextEditingController(
          text: widget.bank.iban,
        );

    swiftController =
        TextEditingController(
          text: widget.bank.swiftCode,
        );
  }

  @override
  void dispose() {
    bankNameController.dispose();
    holderController.dispose();
    accountController.dispose();
    typeController.dispose();
    branchController.dispose();
    ibanController.dispose();
    swiftController.dispose();

    super.dispose();
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
            color: Colors.black87,
          ),
        ),

        title: Text(
          "Edit Bank Details",
          style: AppTextStyles.screenTitle.copyWith(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            20,
            20,
            20,
            20 + MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            children: [

              CustomTextField(
                label: "Bank Name",
                controller: bankNameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter bank name";
                  }
                  return null;
                },
              ),

              CustomTextField(
                label: "Account Holder Name",
                controller: holderController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter account holder name";
                  }
                  return null;
                },
              ),

              CustomTextField(
                label: "Account Number",
                controller: accountController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter account number";
                  }

                  final account = value.trim();

                  // Only letters and numbers
                  if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(account)) {
                    return "Only letters and numbers are allowed";
                  }

                  // Length validation
                  if (account.length < 8 || account.length > 34) {
                    return "Account number must be 8-34 characters";
                  }

                  return null;
                },
              ),

              CustomTextField(
                label: "Account Type",
                controller: typeController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter account type";
                  }
                  return null;
                },
              ),

              CustomTextField(
                label: "Branch Name",
                controller: branchController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter branch name";
                  }
                  return null;
                },
              ),

              CustomTextField(
                label: "IBAN",
                controller: ibanController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter IBAN";
                  }
                  return null;
                },
              ),

              CustomTextField(
                label: "SWIFT Code",
                controller: swiftController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter SWIFT code";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),

              SafeArea(
                top: false,
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      final updatedBank = widget.bank.copyWith(
                        bankName: bankNameController.text.trim(),
                        accountHolderName: holderController.text.trim(),
                        accountNumber: accountController.text.trim(),
                        accountCategory: typeController.text.trim(),
                        branchName: branchController.text.trim(),
                        iban: ibanController.text.trim(),
                        swiftCode: swiftController.text.trim(),
                      );

                      context.read<BankDetailsBloc>().add(
                        UpdateBankDetails(updatedBank),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Bank details updated successfully"),
                          backgroundColor: Color(0xff0B8A47),
                        ),
                      );

                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0B8A47),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "Save Changes",
                      style: AppTextStyles.button.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}