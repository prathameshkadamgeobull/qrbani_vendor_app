import 'package:flutter/material.dart';

class MarkAllButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MarkAllButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: const Icon(
            Icons.done_all,
            color: Colors.white,
          ),
          label: const Text(
            "Mark all as read",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}