import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/inventory_report_model.dart';
import 'low_stock_item.dart';

class LowStockList extends StatelessWidget {

  final StockReportModel report;


  const LowStockList({
    super.key,
    required this.report,
  });


  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment:
      CrossAxisAlignment.start,


      children: [

        const Text(
          "Low Stock Products",
          style: TextStyle(
            fontSize:18,
            fontWeight:FontWeight.bold,
          ),
        ),


        const SizedBox(height:10),



        ...report.lowStockProducts.map(

              (item)=>LowStockItem(

            productName:item.productName,

            category:item.category,

            stock:item.stock,

            icon:Icons.pets,

            iconColor:Colors.orange,

          ),

        ),

      ],
    );

  }

}