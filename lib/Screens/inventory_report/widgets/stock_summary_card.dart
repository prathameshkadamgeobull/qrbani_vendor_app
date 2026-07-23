import 'package:flutter/material.dart';

import '../../../models/inventory_report_model.dart';

class StockSummaryCard extends StatelessWidget {
  final StockReportModel report;

  const StockSummaryCard({
    super.key,
    required this.report,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [
            Expanded(
              child: _card(
                "Total Products",
                report.totalProducts.toString(),
                Icons.inventory_2_outlined,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _card(
                "In Stock",
                report.inStock.toString(),
                Icons.check_circle_outline,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        Row(
          children: [
            Expanded(
              child: _card(
                "Low Stock",
                report.lowStock.toString(),
                Icons.warning_amber_outlined,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _card(
                "Out of Stock",
                report.outOfStock.toString(),
                Icons.remove_shopping_cart_outlined,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        _stockValue(),
      ],
    );
  }


  Widget _card(
      String title,
      String value,
      IconData icon,
      ) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            color: Color(0x12000000),
            offset: Offset(0, 1),
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff2E5C42),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: Color(0xffE8F5EE),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  icon,
                  size: 17,
                  color: Color(0xff2E5C42),
                ),
              ),
            ],
          ),


          const Spacer(),


          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }


  Widget _stockValue() {
    return Container(
      height: 76,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            color: Color(0x12000000),
            offset: Offset(0, 1),
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Text(
                "Total Stock Value",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff2E5C42),
                  fontWeight: FontWeight.w600,
                ),
              ),

              Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: Color(0xffE8F5EE),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.currency_exchange,
                  size: 17,
                  color: Color(0xff2E5C42),
                ),
              ),
            ],
          ),

          const Spacer(),

          Text(
            "SAR ${report.totalStockValue.toStringAsFixed(0)}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}