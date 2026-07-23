// import 'package:flutter/material.dart';
// import 'package:qrbani_vender_app/Screens/contact_support/widgets/contact_bottom_sheet.dart';
//
//
//
// class ContactSupportPage extends StatelessWidget {
//
//   const ContactSupportPage({
//     super.key,
//   });
//
//
//   void openContactSheet(BuildContext context){
//
//
//     showModalBottomSheet(
//
//       context: context,
//
//       shape: const RoundedRectangleBorder(
//
//         borderRadius: BorderRadius.vertical(
//
//           top: Radius.circular(25),
//
//         ),
//
//       ),
//
//
//       builder: (_) {
//
//         return const ContactBottomSheet();
//
//       },
//
//     );
//
//
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//
//       appBar: AppBar(
//
//         title: const Text(
//           "Contact Support",
//         ),
//
//       ),
//
//
//       body: Center(
//
//
//         child: ElevatedButton.icon(
//
//
//           icon: const Icon(
//             Icons.phone,
//           ),
//
//
//           label: const Text(
//             "Call Support",
//           ),
//
//
//           onPressed: (){
//
//
//             openContactSheet(context);
//
//
//           },
//
//
//         ),
//
//       ),
//
//
//     );
//
//   }
//
// }