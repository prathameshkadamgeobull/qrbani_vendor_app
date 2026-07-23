import 'package:flutter/material.dart';

import '../../../models/BankModel.dart';

class SelectBankBottomSheet extends StatelessWidget {
  const SelectBankBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final banks = <BankModel>[
      const BankModel(
        bankName: "Al Rajhi Bank",
        accountNumber: "**** **** **** 5678",
        accountHolder: "Mohammed Khan",
      ),
      const BankModel(
        bankName: "Riyad Bank",
        accountNumber: "**** **** **** 1122",
        accountHolder: "Mohammed Khan",
      ),
      const BankModel(
        bankName: "Saudi National Bank",
        accountNumber: "**** **** **** 3344",
        accountHolder: "Mohammed Khan",
      ),
      const BankModel(
        bankName: "Alinma Bank",
        accountNumber: "**** **** **** 8899",
        accountHolder: "Mohammed Khan",
      ),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,

                borderRadius: BorderRadius.circular(20),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Select Bank",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ...banks.map(
                  (bank) => Card(
                elevation: 0,
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xffE9F7F0),
                    child: Icon(
                      Icons.account_balance,
                      color: Color(0xff0A5A36),
                    ),
                  ),
                  title: Text(bank!.bankName),
                  subtitle: Text(bank!.accountNumber),
                  onTap: () {
                    Navigator.pop(context, bank);
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}