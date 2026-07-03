import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../Core/constants/app_text_style.dart';
import '../../../models/animal_verification_model.dart';

class AnimalImageCard extends StatefulWidget {

  final AnimalVerificationModel animal;
  final String image;
  final bool isVerified;

  const AnimalImageCard({
    super.key,
    required this.animal,
    required this.image,
    required this.isVerified,
  });

  @override
  State<AnimalImageCard> createState() =>
      _AnimalImageCardState();
}

class _AnimalImageCardState
    extends State<AnimalImageCard> {

  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [

          BoxShadow(

            color: Colors.black.withOpacity(.05),

            blurRadius: 12,

            offset: const Offset(0,4),

          ),

        ],

      ),

      child: Column(

        children: [

          Padding(

            padding: const EdgeInsets.all(16),

            child: Stack(

              children: [

                ClipRRect(

                  borderRadius: BorderRadius.circular(12),

                  child: Image.asset(

                    widget.image,

                    height: 260,

                    width: double.infinity,

                    fit: BoxFit.cover,

                  ),

                ),

                Positioned(

                  bottom: 10,

                  right: 10,

                  child: Container(

                    padding: const EdgeInsets.all(4),

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius: BorderRadius.circular(8),

                    ),

                    child: QrImageView(

                      data: widget.animal.qrCode,

                      size: 90,

                    ),

                  ),

                ),

              ],

            ),

          ),

          SizedBox(height: 20),

          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 18),

            child: Column(

              children: [

                _row("Animal ID", widget.animal.animalId),

                const SizedBox(height: 12),

                _row("Type", widget.animal.type),

                const SizedBox(height: 12),

                _row("Weight", widget.animal.weight),

                const SizedBox(height: 12),

                _row("Order ID", widget.animal.orderId),

              ],

            ),

          ),

          const SizedBox(height: 30),

          Container(

            margin: const EdgeInsets.symmetric(horizontal: 18),

            padding: const EdgeInsets.symmetric(vertical: 12),

            decoration: BoxDecoration(

              color: const Color(0xffE9F8EE),

              borderRadius: BorderRadius.circular(12),

            ),

            child: const Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Icon(
                  Icons.check_circle,
                  color: Color(0xff0B8A47),
                ),

                SizedBox(width: 8),

                Text(
                  "Verified & Matched",
                  style: AppTextStyles.verifiedText,
                ),

              ],

            ),

          ),

          const SizedBox(height: 20),

        ],

      ),

    );
  }

  Widget _row(String title, String value) {

    return Row(

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

            textAlign: TextAlign.end,

            style: AppTextStyles.detailValue,

          ),

        ),

      ],

    );

  }

}