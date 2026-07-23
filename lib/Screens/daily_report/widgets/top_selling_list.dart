import 'package:flutter/material.dart';

import 'top_selling_tile.dart';

class TopSellingList extends StatelessWidget {
  const TopSellingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                "Top Selling Items",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // TextButton(
            //   onPressed: () {},
            //   child: const Text(
            //     "View All",
            //     style: TextStyle(
            //       color: Color(0xff0A6A3F),
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ],
        ),

        const SizedBox(height: 10),

        const TopSellingTile(
          icon: Icons.pets,
          name: "Goat",
          quantity: "45 Orders",
          amount: "SAR 9,450",
        ),

        const TopSellingTile(
          icon: Icons.cruelty_free,
          name: "Sheep",
          quantity: "30 Orders",
          amount: "SAR 6,300",
        ),

        const TopSellingTile(
          icon: Icons.agriculture,
          name: "Camel",
          quantity: "18 Orders",
          amount: "SAR 4,050",
        ),
      ],
    );
  }
}