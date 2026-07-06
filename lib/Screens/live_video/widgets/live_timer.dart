import 'dart:async';

import 'package:flutter/material.dart';

class LiveTimer extends StatefulWidget {
  const LiveTimer({super.key});

  @override
  State<LiveTimer> createState() => _LiveTimerState();
}

class _LiveTimerState extends State<LiveTimer> {
  late Timer _timer;

  int _seconds = 0;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (mounted) {
          setState(() {
            _seconds++;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final hours =
    (_seconds ~/ 3600).toString().padLeft(2, '0');

    final minutes =
    ((_seconds % 3600) ~/ 60).toString().padLeft(2, '0');

    final seconds =
    (_seconds % 60).toString().padLeft(2, '0');

    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(width: 6),

        const Text(
          "LIVE",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),

        const SizedBox(width: 10),

        Text(
          _formattedTime,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}