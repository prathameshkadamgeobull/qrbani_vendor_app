import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/payout_report_model.dart';


class TotalPayoutCard extends StatelessWidget{


  final PayoutReportModel report;
  final DateTime? paidDate;


  const TotalPayoutCard({
    super.key,
    required this.report,
    this.paidDate,
  });



  @override
  Widget build(BuildContext context){


    return Container(

      padding:
      const EdgeInsets.all(15),


      decoration:BoxDecoration(

          color:
          const Color(0xff006B3C),

          borderRadius:
          BorderRadius.circular(12)

      ),


      child:Row(

          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,


          children:[


            Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children:[


                  const Text(
                    "Total Payout",
                    style:TextStyle(
                        color:Colors.white
                    ),
                  ),


                  Text(
                    "SAR ${report.totalPayout}",
                    style:const TextStyle(
                        color:Colors.white,
                        fontSize:22,
                        fontWeight:FontWeight.bold
                    ),
                  ),


                  Text(
                    "Paid on ${paidDate != null ? DateFormat('dd MMM yyyy').format(paidDate!) : report.paidDate}",
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ]

            ),



            Container(

                padding:
                const EdgeInsets.all(12),

                decoration:
                const BoxDecoration(
                    color:Colors.white24,
                    shape:BoxShape.circle
                ),

                child:
                const Icon(
                    Icons.account_balance_wallet,
                    color:Colors.white
                )

            )

          ]

      ),


    );


  }


}