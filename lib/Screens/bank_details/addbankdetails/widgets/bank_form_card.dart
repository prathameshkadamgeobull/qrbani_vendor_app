import 'package:flutter/material.dart';

import '../../../../Core/constants/app_text_style.dart';
import '../../widgets/custom_textfield.dart';
import 'account_type_dropdown.dart';

class BankFormCard extends StatelessWidget {
  final TextEditingController bankNameController;
  final TextEditingController holderController;
  final TextEditingController accountController;
  final TextEditingController branchController;
  final TextEditingController ibanController;
  final TextEditingController swiftController;

  final String? accountType;
  final ValueChanged<String?> onAccountTypeChanged;

  const BankFormCard({
    super.key,
    required this.bankNameController,
    required this.holderController,
    required this.accountController,
    required this.branchController,
    required this.ibanController,
    required this.swiftController,
    required this.accountType,
    required this.onAccountTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.08),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffEAF6EF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.account_balance,
                  color: Color(0xff0B8A47),
                ),
              ),

              const SizedBox(width: 12),

              Text(
                "Bank Information",
                style: AppTextStyles.cardTitle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Divider(color: Colors.grey.shade200),

          const SizedBox(height: 10),

          CustomTextField(
            label: "Bank Name",
            controller: bankNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter bank name";
              }
              return null;
            },
          ),

          const SizedBox(height: 10),

          CustomTextField(
            label: "Account Holder Name",
            controller: holderController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter account holder name";
              }
              return null;
            },
          ),

          const SizedBox(height: 10),

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

          const SizedBox(height: 10),

          AccountTypeDropdown(
            value: accountType,
            onChanged: onAccountTypeChanged,
          ),

          const SizedBox(height: 10),

          CustomTextField(
            label: "Branch Name",
            controller: branchController,
          ),

          const SizedBox(height: 10),

          CustomTextField(
            label: "IBAN",
            controller: ibanController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter IBAN";
              }
              return null;
            },
          ),

          const SizedBox(height: 10),

          CustomTextField(
            label: "SWIFT / BIC Code",
            controller: swiftController,
          ),
        ],
      ),
    );
  }
}