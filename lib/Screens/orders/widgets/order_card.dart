// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class OrderCard extends StatefulWidget {
//   final String orderNo;
//   final String animal;
//   final String pickupTime;
//   final String customerName;
//   final String location;
//   final double amount;
//   final String status;
//
//   const OrderCard({
//     super.key,
//     required this.orderNo,
//     required this.animal,
//     required this.pickupTime,
//     required this.customerName,
//     required this.location,
//     required this.amount,
//     required this.status,
//   });
//
//   @override
//   State<OrderCard> createState() => _OrderCardState();
// }
//
// class _OrderCardState extends State<OrderCard> {
//   bool isExpanded = false;
//
//   Color get statusColor {
//     switch (widget.status) {
//       case "Pending":
//         return const Color(0xffE29A2D);
//
//       case "In Progress":
//         return const Color(0xff0B8A47);
//
//       case "Completed":
//         return const Color(0xff0B8A47);
//
//       default:
//         return Colors.grey;
//     }
//   }
//
//   Color get statusBg {
//     switch (widget.status) {
//       case "Pending":
//         return const Color(0xffFFF4DE);
//
//       case "In Progress":
//         return const Color(0xffE8F7EE);
//
//       case "Completed":
//         return const Color(0xffE8F7EE);
//
//       default:
//         return Colors.grey.shade200;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final formatter = NumberFormat("#,##0");
//
//     return GestureDetector(
//         onTap: () {
//       setState(() {
//         isExpanded = !isExpanded;
//       });
//     },
//     child: AnimatedContainer(
//     duration: const Duration(milliseconds: 300),
//     margin: const EdgeInsets.symmetric(
//     horizontal: 14,
//     vertical: 7,
//     ),
//     padding: const EdgeInsets.all(14),
//     decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(14),
//     boxShadow: [
//     BoxShadow(
//     color: Colors.grey.withOpacity(.08),
//     blurRadius: 10,
//     offset: const Offset(0, 3),
//     ),
//     ],
//     ),
//     child: Column(
//     children: [
//
//     /// HEADER
//     Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//
//     Expanded(
//     child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//
//     Text(
//     widget.orderNo,
//     style: const TextStyle(
//     fontSize: 15,
//     fontWeight: FontWeight.bold,
//     ),
//     ),
//
//     const SizedBox(height: 10),
//
//     Row(
//     children: [
//     const Icon(
//     Icons.pets,
//     size: 15,
//     color: Colors.black54,
//     ),
//     const SizedBox(width: 6),
//     Text(
//     widget.animal,
//     style: const TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.w600,
//     ),
//     ),
//     ],
//     ),
//
//     const SizedBox(height: 6),
//
//     Row(
//     children: [
//     const Icon(
//     Icons.access_time,
//     size: 14,
//     color: Colors.grey,
//     ),
//     const SizedBox(width: 6),
//     Text(
//     widget.pickupTime,
//     style: const TextStyle(
//     fontSize: 12,
//     ),
//     ),
//     ],
//     ),
//
//     const SizedBox(height: 6),
//
//     Row(
//     children: [
//     const Icon(
//     Icons.person_outline,
//     size: 14,
//     color: Colors.grey,
//     ),
//     const SizedBox(width: 6),
//     Text(
//     widget.customerName,
//     style: const TextStyle(
//     fontSize: 12,
//     ),
//     ),
//     ],
//     ),
//
//     const SizedBox(height: 6),
//
//     Row(
//     crossAxisAlignment:
//     CrossAxisAlignment.start,
//     children: [
//     const Icon(
//     Icons.location_on_outlined,
//     size: 14,
//     color: Colors.grey,
//     ),
//     const SizedBox(width: 6),
//
//     Expanded(
//     child: Text(
//     widget.location,
//     style: const TextStyle(
//     fontSize: 11,
//     color: Colors.grey,
//     ),
//     ),
//     ),
//     ],
//     ),
//     ],
//     ),
//     ),
//
//     const SizedBox(width: 10),
//
//     SizedBox(
//     width: 100,
//     child: Column(
//     crossAxisAlignment:
//     CrossAxisAlignment.end,
//     children: [
//
//     Container(
//     width: 95,
//     height: 30,
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//     color: statusBg,
//     borderRadius:
//     BorderRadius.circular(15),
//     ),
//     child: Text(
//     widget.status,
//     style: TextStyle(
//     color: statusColor,
//     fontSize: 12,
//     fontWeight: FontWeight.w600,
//     ),
//     ),
//     ),
//
//     const SizedBox(height: 70),
//
//     Text(
//     "SAR ${formatter.format(widget.amount)}",
//     style: const TextStyle(
//     fontWeight: FontWeight.bold,
//     fontSize: 16,
//     ),
//     ),
//     ],
//     ),
//     ),
//     ],
//     ),
//
//     AnimatedCrossFade(
//     duration: const Duration(milliseconds: 300),
//     crossFadeState: isExpanded
//     ? CrossFadeState.showSecond
//         : CrossFadeState.showFirst,
//
//     firstChild: const SizedBox.shrink(),
//
//     secondChild: Column(
//     children: [
//     const SizedBox(height: 20),
//
//     const Divider(),
//
//     const SizedBox(height: 18),
//
//     /// CUSTOMER DETAILS
//     const Align(
//     alignment: Alignment.centerLeft,
//     child: Text(
//     "Customer Details",
//     style: TextStyle(
//     fontSize: 15,
//     fontWeight: FontWeight.bold,
//     ),
//     ),
//     ),
//
//     const SizedBox(height: 16),
//
//     detailRow(
//     "Customer Name",
//     widget.customerName,
//     ),
//
//     const SizedBox(height: 12),
//
//     detailRow(
//     "Phone Number",
//     "+966 500123456",
//     ),
//
//     const SizedBox(height: 12),
//
//     detailRow(
//     "Country",
//     widget.location,
//     ),
//
//     const SizedBox(height: 20),
//
//     const Divider(),
//
//     const SizedBox(height: 18),
//
//     /// ORDER DETAILS
//     const Align(
//     alignment: Alignment.centerLeft,
//     child: Text(
//     "Order Details",
//     style: TextStyle(
//     fontSize: 15,
//     fontWeight: FontWeight.bold,
//     ),
//     ),
//     ),
//
//     const SizedBox(height: 16),
//
//     detailRow(
//     "Order No",
//     widget.orderNo,
//     ),
//
//     const SizedBox(height: 12),
//
//     detailRow(
//     "Animal",
//     widget.animal,
//     ),
//
//     const SizedBox(height: 12),
//
//     detailRow(
//     "Pickup Time",
//     widget.pickupTime,
//     ),
//
//     const SizedBox(height: 12),
//
//     detailRow(
//     "Order Status",
//     widget.status,
//     ),
//
//     const SizedBox(height: 12),
//
//     detailRow(
//     "Amount",
//     "SAR ${formatter.format(widget.amount)}",
//     ),
//
//     const SizedBox(height: 20),
//
//     const Divider(),
//
//     const SizedBox(height: 18),
//
//     /// PAYMENT
//     const Align(
//     alignment: Alignment.centerLeft,
//     child: Text(
//     "Payment",
//     style: TextStyle(
//     fontSize: 15,
//     fontWeight: FontWeight.bold,
//     ),
//     ),
//     ),
//
//     const SizedBox(height: 16),
//
//     Row(
//     children: [
//     const Expanded(
//     flex: 2,
//     child: Text(
//     "Payment Status",
//     style: TextStyle(
//     color: Colors.grey,
//     fontSize: 13,
//     ),
//     ),
//     ),
//
//     Container(
//     padding: const EdgeInsets.symmetric(
//     horizontal: 12,
//     vertical: 5,
//     ),
//     decoration: BoxDecoration(
//     color: const Color(0xffE8F7EE),
//     borderRadius: BorderRadius.circular(20),
//     ),
//     child: const Text(
//     "Paid",
//     style: TextStyle(
//     color: Color(0xff0B8A47),
//     fontWeight: FontWeight.w600,
//     ),
//     ),
//     ),
//     ],
//     ),
//
//     const SizedBox(height: 24),
//       if (widget.status == "Completed")
//         SizedBox(
//           width: double.infinity,
//           height: 48,
//           child: ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xff0B8A47),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//               ),
//             ),
//             child: const Text(
//               "Completed",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 15,
//               ),
//             ),
//           ),
//         )
//       else
//         Row(
//           children: [
//
//             /// Cancel Button
//             Expanded(
//               flex: 2,
//               child: SizedBox(
//                 height: 48,
//                 child: OutlinedButton(
//                   onPressed: () {},
//                   style: OutlinedButton.styleFrom(
//                     side: const BorderSide(
//                       color: Colors.red,
//                     ),
//                     foregroundColor: Colors.red,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                   ),
//                   child: const Text(
//                     "Cancel",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//
//             /// Main Action Button
//             Expanded(
//               flex: 4,
//               child: SizedBox(
//                 height: 48,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xff0B8A47),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                   ),
//                   child: Text(
//                     widget.status == "Pending"
//                         ? "Start Processing"
//                         : "Complete Order",
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//
//       const SizedBox(height: 10),
//
//     ],
//     ),
//     ),
//     ],
//     ),
//     ),
//     );
//   }
//   Widget detailRow(String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           Expanded(
//             flex: 2,
//             child: Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 13,
//                 color: Color(0xff8A8A8A),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//
//           Expanded(
//             flex: 3,
//             child: Text(
//               value,
//               textAlign: TextAlign.right,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Core/constants/app_text_style.dart';
import '../../animal_verification/animal_verification_screen.dart';

class OrderCard extends StatefulWidget {
  final String orderNo;
  final String animal;
  final String pickupTime;
  final String customerName;
  final String location;
  final double amount;
  final String status;

  const OrderCard({
    super.key,
    required this.orderNo,
    required this.animal,
    required this.pickupTime,
    required this.customerName,
    required this.location,
    required this.amount,
    required this.status,
  });

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool isExpanded = false;

  Color get statusColor {
    switch (widget.status) {
      case "Pending":
        return const Color(0xffE29A2D);

      case "In Progress":
      case "Completed":
        return const Color(0xff0B8A47);

      default:
        return Colors.grey;
    }
  }

  Color get statusBg {
    switch (widget.status) {
      case "Pending":
        return const Color(0xffFFF4DE);

      case "In Progress":
      case "Completed":
        return const Color(0xffE8F7EE);

      default:
        return Colors.grey.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,##0");

    return GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 7,
    ),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(14),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(.08),
    blurRadius: 10,
    offset: const Offset(0, 3),
    ),
    ],
    ),
    child: Column(
    children: [

    /// Header
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    Expanded(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    Text(
    widget.orderNo,
    style: AppTextStyles.orderNo,
    ),

    const SizedBox(height: 10),

    Row(
    children: [
    const Icon(
    Icons.pets,
    size: 15,
    color: Colors.black54,
    ),

    const SizedBox(width: 6),

    Text(
    widget.animal,
    style: AppTextStyles.bodyLarge.copyWith(
    fontWeight: FontWeight.w600,
    ),
    ),
    ],
    ),

    const SizedBox(height: 6),

    Row(
    children: [
    const Icon(
    Icons.access_time,
    size: 14,
    color: Colors.grey,
    ),

    const SizedBox(width: 6),

    Text(
    widget.pickupTime,
    style: AppTextStyles.orderSubtitle,
    ),
    ],
    ),

    const SizedBox(height: 6),

    Row(
    children: [
    const Icon(
    Icons.person_outline,
    size: 14,
    color: Colors.grey,
    ),

    const SizedBox(width: 6),

    Text(
    widget.customerName,
    style: AppTextStyles.orderCustomer,
    ),
    ],
    ),

    const SizedBox(height: 6),

    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    const Icon(
    Icons.location_on_outlined,
    size: 14,
    color: Colors.grey,
    ),

    const SizedBox(width: 6),

    Expanded(
    child: Text(
    widget.location,
    style: AppTextStyles.caption,
    ),
    ),
    ],
    ),
    ],
    ),
    ),

    const SizedBox(width: 10),

    SizedBox(
    width: 100,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [

    Container(
    width: 95,
    height: 30,
    alignment: Alignment.center,
    decoration: BoxDecoration(
    color: statusBg,
    borderRadius: BorderRadius.circular(15),
    ),
    child: Text(
    widget.status,
    style: AppTextStyles.orderStatus.copyWith(
    color: statusColor,
    ),
    ),
    ),

    const SizedBox(height: 70),

    Text(
    "SAR ${formatter.format(widget.amount)}",
    style: AppTextStyles.orderAmount,
    ),
    ],
    ),
    ),
    ],
    ),

    /// Fixed animation
    ClipRect(
    child: AnimatedSize(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInOut,
    child: isExpanded
    ? Column(
    children: [
    const SizedBox(height: 20),

    const Divider(),

    const SizedBox(height: 18),

    /// Customer Details
    const Align(
    alignment: Alignment.centerLeft,
    child: Text(
    "Customer Details",
    style: AppTextStyles.orderSectionTitle,
    ),
    ),

    const SizedBox(height: 16),

    _detailRow(
    "Customer Name",
    widget.customerName,
    ),

    _detailRow(
    "Phone Number",
    "+966 500123456",
    ),

    _detailRow(
    "Country",
    widget.location,
    ),

    const SizedBox(height: 20),

    const Divider(),

    const SizedBox(height: 18),

    /// Order Details
    const Align(
    alignment: Alignment.centerLeft,
    child: Text(
    "Order Details",
    style: AppTextStyles.orderSectionTitle,
    ),
    ),

    const SizedBox(height: 16),

    _detailRow(
    "Order No",
    widget.orderNo,
    ),

    _detailRow(
    "Animal",
    widget.animal,
    ),

    _detailRow(
    "Pickup Time",
    widget.pickupTime,
    ),

    _detailRow(
    "Order Status",
    widget.status,
    ),

    _detailRow(
    "Amount",
    "SAR ${formatter.format(widget.amount)}",
    ),

    const SizedBox(height: 20),

    const Divider(),

    const SizedBox(height: 18),

    /// Payment
    const Align(
    alignment: Alignment.centerLeft,
    child: Text(
    "Payment",
    style: AppTextStyles.orderSectionTitle,
    ),
    ),

    const SizedBox(height: 16),

    Row(
    children: [

    Expanded(
    child: Text(
    "Payment Status",
    style: AppTextStyles.detailTitle,
    ),
    ),

    Container(
    padding: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 5,
    ),
    decoration: BoxDecoration(
    color: const Color(0xffE8F7EE),
    borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
    "Paid",
    style: AppTextStyles.orderStatus.copyWith(
    color: const Color(0xff0B8A47),
    ),
    ),
    ),
    ],
    ),

    const SizedBox(height: 24),
      if (widget.status == "Completed")
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0B8A47),
              foregroundColor: Colors.white,
              disabledBackgroundColor: const Color(0xff0B8A47),
              disabledForegroundColor: Colors.white,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              "Completed",
              style: AppTextStyles.buttonText,
            ),
          ),
        )
      else
        Row(
          children: [

            /// Cancel Button
            Expanded(
              child: SizedBox(
                height: 48,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.red,
                    ),
                    foregroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "Cancel",
                    style: AppTextStyles.cancelButton,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            /// Start Processing / Complete Order
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AnimalVerificationScreen(
                          orderNo: widget.orderNo,
                          animalType: widget.animal,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0B8A47),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    widget.status == "Pending"
                        ? "Start Processing"
                        : "Complete Order",
                    style: AppTextStyles.buttonText,
                  ),
                ),
              ),
            ),
          ],
        ),

      const SizedBox(height: 10),
    ],
    )
        : const SizedBox.shrink(),
    ),
    ),
    ],
    ),
        ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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