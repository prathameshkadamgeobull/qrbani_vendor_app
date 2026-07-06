import 'package:flutter/material.dart';

class LiveVideoHeader extends StatelessWidget {
  final int seconds;

  const LiveVideoHeader({
    super.key,
    required this.seconds,
  });

  String formatTime(int seconds) {
    final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');

    return "$hours:$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      left: 16,
      right: 16,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              "LIVE",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 10),

          Text(
            formatTime(seconds),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Spacer(),

          const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}