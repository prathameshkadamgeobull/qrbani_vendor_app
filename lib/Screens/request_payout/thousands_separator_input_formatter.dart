import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat('#,##0');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Allow empty value
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Remove existing commas
    final digits = newValue.text.replaceAll(',', '');

    // Only allow numbers
    final number = int.tryParse(digits);
    if (number == null) {
      return oldValue;
    }

    // Format with commas
    final formatted = _formatter.format(number);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(
        offset: formatted.length,
      ),
    );
  }
}