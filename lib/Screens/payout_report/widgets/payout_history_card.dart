import 'package:flutter/material.dart';

import '../../../models/payout_report_model.dart';


class PayoutHistoryCard extends StatefulWidget {

  final PayoutReportModel report;

  const PayoutHistoryCard({
    super.key,
    required this.report,
  });


  @override
  State<PayoutHistoryCard> createState() =>
      _PayoutHistoryCardState();
}



class _PayoutHistoryCardState extends State<PayoutHistoryCard> {

  bool showAll = false;


  @override
  Widget build(BuildContext context) {

    final history = showAll
        ? widget.report.history
        : widget.report.history.take(3).toList();


    return Card(

      elevation: 0,

      color: Colors.white,

      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(14),
      ),


      child: Padding(

        padding: const EdgeInsets.all(16),


        child: Column(

          children: [


            Row(

              children: [


                const Expanded(

                  child: Text(
                    "Payout History",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ),


                TextButton(

                  onPressed: () {

                    setState(() {

                      showAll = !showAll;

                    });

                  },


                  child: Text(

                    showAll
                        ? "Show Less"
                        : "View All",


                    style: const TextStyle(

                      color: Colors.green,

                      fontWeight: FontWeight.w600,

                    ),

                  ),

                ),


              ],

            ),



            const SizedBox(height: 10),



            ListView.separated(

              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),


              itemCount: history.length,


              separatorBuilder: (_, __) =>
                  Divider(
                    color: Colors.grey.shade300,
                  ),



              itemBuilder: (context,index){


                final item = history[index];


                return Row(

                  children: [


                    Expanded(

                      child: Text(
                        item.date,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                    ),



                    Text(

                      "SAR ${item.amount.toStringAsFixed(0)}",

                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),

                    ),



                    const SizedBox(width:12),



                    Container(

                      padding: const EdgeInsets.symmetric(
                        horizontal:12,
                        vertical:5,
                      ),


                      decoration: BoxDecoration(

                        color: Colors.green.shade50,

                        borderRadius:
                        BorderRadius.circular(20),

                      ),


                      child: Text(

                        item.status,

                        style: TextStyle(

                          color: Colors.green.shade700,

                          fontWeight: FontWeight.w600,

                          fontSize:12,

                        ),

                      ),

                    ),


                  ],

                );

              },

            ),


          ],

        ),

      ),

    );

  }

}