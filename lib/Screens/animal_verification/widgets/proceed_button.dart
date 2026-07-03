import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';

class ProceedButton extends StatefulWidget {
  final VoidCallback onPressed;

  const ProceedButton({
    super.key,
    required this.onPressed,
  });

  @override
  State<ProceedButton> createState() => _ProceedButtonState();
}

class _ProceedButtonState extends State<ProceedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: widget.onPressed,
        icon: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 20,
        ),
        label: Text(
          "Proceed to Sacrifice",
          style: AppTextStyles.buttonText,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff0B8A47),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
    );
  }
}