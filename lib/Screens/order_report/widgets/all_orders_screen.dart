import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrbani_vender_app/Core/constants/app_colors.dart';
import 'package:qrbani_vender_app/Screens/order_report/widgets/recent_order_tile.dart';

import '../../../models/recent_order_model.dart';

class AllOrdersScreen extends StatelessWidget {

  final List<RecentOrderModel> orders;


  const AllOrdersScreen({
    super.key,
    required this.orders,
  });


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          "All Orders",
        ),
      ),


      body: orders.isEmpty

          ? const Center(
        child: Text(
          "No Orders Found",
        ),
      )


          : ListView.builder(

        itemCount: orders.length,


        itemBuilder: (context,index){

          return RecentOrderTile(
            order: orders[index],
          );

        },

      ),

    );

  }
}