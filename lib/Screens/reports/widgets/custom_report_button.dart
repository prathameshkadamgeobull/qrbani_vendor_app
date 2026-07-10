import 'package:flutter/material.dart';

class CustomReportButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomReportButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          "Generate Custom Report",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),

    );
  }
}