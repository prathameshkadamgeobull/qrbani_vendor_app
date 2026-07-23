import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';
import '../../../models/bank_details_model.dart';
import 'detail_row.dart';

class BankInformationCard extends StatelessWidget {
  final BankDetailsModel bank;

  const BankInformationCard({
    super.key,
    required this.bank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Header
          Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              12,
            ),
            child: Row(
              children: [

                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xffEAF7EF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.account_balance_outlined,
                    color: Color(0xff0B8A47),
                    size: 22,
                  ),
                ),

                const SizedBox(width: 12),

                Text(
                  "Bank Information",
                  style: AppTextStyles.cardTitle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff222222),
                  ),
                ),
              ],
            ),
          ),

          DetailRow(
            icon: Icons.account_balance_outlined,
            title: "Bank Name",
            value: bank.bankName,
          ),

          DetailRow(
            icon: Icons.person_outline,
            title: "Account Holder",
            value: bank.accountHolderName,
          ),

          DetailRow(
            icon: Icons.credit_card_outlined,
            title: "Account Number",
            value: bank.accountNumber,
          ),

          DetailRow(
            icon: Icons.category_outlined,
            title: "Account Type",
            value: bank.accountCategory,
          ),

          DetailRow(
            icon: Icons.location_city_outlined,
            title: "Branch",
            value: bank.branchName,
          ),

          DetailRow(
            icon: Icons.account_tree_outlined,
            title: "IBAN",
            value: bank.iban,
          ),

          DetailRow(
            icon: Icons.verified_user_outlined,
            title: "SWIFT Code",
            value: bank.swiftCode,
          ),

          DetailRow(
            icon: Icons.calendar_today_outlined,
            title: "Added On",
            value: bank.addedOn,
          ),
        ],
      ),
    );
  }
}