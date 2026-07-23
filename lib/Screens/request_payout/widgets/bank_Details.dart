import 'package:flutter/material.dart';

class BankDetailsCard extends StatelessWidget {
  final String bankName;
  final String accountNumber;
  final String accountHolder;
  final VoidCallback? onChange;

  const BankDetailsCard({
    super.key,
    required this.bankName,
    required this.accountNumber,
    required this.accountHolder,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xffE9F7F0),
                child: Icon(
                  Icons.account_balance,
                  color: Color(0xff0A5A36),
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Text(
                  bankName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // TextButton(
              //   onPressed: onChange,
              //   child: const Text(
              //     "Change",
              //     style: TextStyle(
              //       color: Color(0xff0A5A36),
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
             // ),
            ],
          ),

          const Divider(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Account Number",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                accountNumber,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Account Holder",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                accountHolder,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}