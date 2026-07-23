import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/features/request_payout/request_payout_bloc.dart';
import '../../../blocs/features/request_payout/request_payout_event.dart';
import '../thousands_separator_input_formatter.dart';

class AmountField extends StatelessWidget {
  final TextEditingController controller;

  const AmountField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      cursorColor: const Color(0xff0A5A36),

      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        ThousandsSeparatorInputFormatter(),
      ],

      onChanged: (value) {
        context.read<RequestPayoutBloc>().add(
          AmountChanged(
            value.replaceAll(',', ''),
          ),
        );
      },

      decoration: InputDecoration(
        prefixText: "SAR  ",
        prefixStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        hintText: "Enter amount",
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xff0A5A36),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}