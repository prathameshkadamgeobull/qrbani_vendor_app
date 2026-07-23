import 'package:flutter/material.dart';

import '../../../utils/phone_launcher.dart';


class ContactBottomSheet extends StatelessWidget {

  const ContactBottomSheet({
    super.key,
  });


  static const String supportNumber = "+917058572021";


  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.all(20),

      child: Column(

        mainAxisSize: MainAxisSize.min,

        children: [


          Container(

            height: 5,
            width: 45,

            decoration: BoxDecoration(

              color: Colors.grey.shade400,

              borderRadius:
              BorderRadius.circular(10),

            ),

          ),


          const SizedBox(height: 20),


          const Text(

            "Contact Support",

            style: TextStyle(

              fontSize: 20,

              fontWeight: FontWeight.bold,

            ),

          ),


          const SizedBox(height: 20),


          ListTile(

            leading: const CircleAvatar(

              backgroundColor: Colors.green,

              child: Icon(

                Icons.phone,

                color: Colors.white,

              ),

            ),


            title: const Text(
              "Call Support",
            ),


            subtitle: const Text(
              supportNumber,
            ),


            trailing: ElevatedButton(

              onPressed: () {

                PhoneLauncher.makeCall(
                  supportNumber,
                );

              },


              child: const Text(
                "Call",
              ),

            ),

          ),


          const SizedBox(height: 20),

        ],

      ),

    );

  }

}