import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../blocs/features/request_payout/request_payout_bloc.dart';
import '../../../blocs/features/request_payout/request_payout_event.dart';

class QuickAmounts extends StatelessWidget {
  final TextEditingController controller;

  const QuickAmounts({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final amounts = [1000, 5000, 10000];

    return Row(
      children: amounts.map((amount) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              height: 45,
              child: OutlinedButton(
                onPressed: () {
                  final formatted = NumberFormat('#,##0').format(amount);

                  controller.text = formatted;

                  context.read<RequestPayoutBloc>().add(
                    SelectQuickAmount(amount.toDouble()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    color: Color(0xffD9D9D9),
                    width: 1.2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 0,
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  "SAR ${_format(amount)}",
                  style: const TextStyle(
                    fontSize: 14, // Reduced from 18
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0A5A36),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  String _format(int value) {
    return value.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (match) => ',',
    );
  }
}