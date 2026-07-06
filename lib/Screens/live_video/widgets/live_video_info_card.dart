import 'package:flutter/material.dart';

class LiveVideoInfoCard extends StatefulWidget {
  final String orderId;
  final String customer;

  const LiveVideoInfoCard({
    super.key,
    required this.orderId,
    required this.customer,
  });

  @override
  State<LiveVideoInfoCard> createState() =>
      _LiveVideoInfoCardState();
}

class _LiveVideoInfoCardState
    extends State<LiveVideoInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Drag Handle
          Container(
            width: 55,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 22),

          /// Order ID
          _infoRow(
            Icons.confirmation_number_outlined,
            "Order ID",
            widget.orderId,
          ),

          const SizedBox(height: 18),

          /// Customer
          _infoRow(
            Icons.person_outline,
            "Customer",
            widget.customer,
          ),

          const SizedBox(height: 18),

          /// Animal
          _infoRow(
            Icons.pets_outlined,
            "Animal",
            "Goat",
          ),

          const SizedBox(height: 18),

          /// Status
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: Colors.red,
                size: 12,
              ),

              const SizedBox(width: 10),

              const Text(
                "Status",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "LIVE",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _infoRow(
      IconData icon,
      String title,
      String value,
      ) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.green,
          size: 22,
        ),

        const SizedBox(width: 12),

        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),

        const Spacer(),

        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}