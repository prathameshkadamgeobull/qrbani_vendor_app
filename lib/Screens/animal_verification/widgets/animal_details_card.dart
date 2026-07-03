import 'package:flutter/material.dart';

import '../../../Core/constants/app_text_style.dart';
import '../../../models/animal_verification_model.dart';

class AnimalDetailsCard extends StatefulWidget {
  final AnimalVerificationModel animal;

  const AnimalDetailsCard({
    super.key,
    required this.animal,
  });

  @override
  State<AnimalDetailsCard> createState() =>
      _AnimalDetailsCardState();
}

class _AnimalDetailsCardState
    extends State<AnimalDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [

          _detailRow(
            "Order ID",
            widget.animal.orderId,
          ),

          const Divider(),

          _detailRow(
            "Animal ID",
            widget.animal.animalId,
          ),

          const Divider(),

          _detailRow(
            "Animal Type",
            widget.animal.type,
          ),

          const Divider(),

          _detailRow(
            "Weight",
            widget.animal.weight,
          ),

          const Divider(),

          _detailRow(
            "QR Code",
            widget.animal.qrCode,
          ),
        ],
      ),
    );
  }

  Widget _detailRow(
      String title,
      String value,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        children: [

          Expanded(
            child: Text(
              title,
              style: AppTextStyles.detailTitle,
            ),
          ),

          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: AppTextStyles.detailValue,
            ),
          ),
        ],
      ),
    );
  }
}