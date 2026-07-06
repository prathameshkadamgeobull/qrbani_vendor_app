import 'package:flutter/material.dart';

class LegendWidget extends StatelessWidget {
  const LegendWidget({super.key});

  Widget _legendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(width: 8),

        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          _legendItem(
            Colors.green,
            "Low",
          ),

          _legendItem(
            Colors.orange,
            "Medium",
          ),

          _legendItem(
            Colors.red,
            "High",
          ),
        ],
      ),
    );
  }
}