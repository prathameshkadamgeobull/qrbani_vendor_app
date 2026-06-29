// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../blocs/features/bottom_nav/bottom_nav_bloc.dart';
// import '../../../blocs/features/bottom_nav/bottom_nav_event.dart';
// import '../../../blocs/features/bottom_nav/bottom_nav_state.dart';
// import '../../orders/orders_screen.dart';
// import '../dashboard_screen.dart';
//
// class CustomBottomNavigation extends StatelessWidget {
//   const CustomBottomNavigation({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BottomNavBloc, BottomNavState>(
//       builder: (context, state) {
//         return Container(
//           height: 96,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             border: Border(
//               top: BorderSide(
//                 color: Color(0xffECECEC),
//                 width: 1,
//               ),
//             ),
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(26),
//               topRight: Radius.circular(26),
//             ),
//           ),
//           child: SafeArea(
//             top: false,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//
//                 _navItem(
//                   context,
//                   index: 0,
//                   currentIndex: state.currentIndex,
//                   icon: Icons.home_rounded,
//                   title: "Dashboard",
//                 ),
//
//                 _navItem(
//                   context,
//                   index: 1,
//                   currentIndex: state.currentIndex,
//                   icon: Icons.assignment_outlined,
//                   title: "Orders",
//                 ),
//
//                 _navItem(
//                   context,
//                   index: 2,
//                   currentIndex: state.currentIndex,
//                   icon: Icons.inventory_2_outlined,
//                   title: "Inventory",
//                 ),
//
//                 _navItem(
//                   context,
//                   index: 3,
//                   currentIndex: state.currentIndex,
//                   icon: Icons.bar_chart_outlined,
//                   title: "Reports",
//                 ),
//
//                 _navItem(
//                   context,
//                   index: 4,
//                   currentIndex: state.currentIndex,
//                   icon: Icons.menu,
//                   title: "More",
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _navItem(
//       BuildContext context, {
//         required int index,
//         required int currentIndex,
//         required IconData icon,
//         required String title,
//       }) {
//     final bool selected = index == currentIndex;
//
//     return InkWell(
//       onTap: () {
//         context.read<BottomNavBloc>().add(
//           ChangeTabEvent(index),
//         );
//
//         switch (index) {
//           case 0:
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => const DashboardScreen(),
//               ),
//             );
//             break;
//
//           case 1:
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => const OrdersScreen(),
//               ),
//             );
//             break;
//         }
//       },
//
//       //     case 2:
//       //       Navigator.pushReplacement(
//       //         context,
//       //         MaterialPageRoute(
//       //           builder: (_) => const InventoryScreen(),
//       //         ),
//       //       );
//       //       break;
//       //
//       //     case 3:
//       //       Navigator.pushReplacement(
//       //         context,
//       //         MaterialPageRoute(
//       //           builder: (_) => const ReportsScreen(),
//       //         ),
//       //       );
//       //       break;
//       //
//       //     case 4:
//       //       Navigator.pushReplacement(
//       //         context,
//       //         MaterialPageRoute(
//       //           builder: (_) => const MoreScreen(),
//       //         ),
//       //       );
//       //       break;
//       //   }
//       // },
//       borderRadius: BorderRadius.circular(12),
//       child: SizedBox(
//         width: 65,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//
//             Icon(
//               icon,
//               size: 26,
//               color: selected
//                   ? const Color(0xff0B8A47)
//                   : const Color(0xff5B616E),
//             ),
//
//             const SizedBox(height: 4),
//
//             Text(
//               title,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight:
//                 selected ? FontWeight.w600 : FontWeight.w500,
//                 color: selected
//                     ? const Color(0xff0B8A47)
//                     : const Color(0xff5B616E),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/constants/app_text_style.dart';
import '../../../blocs/features/bottom_nav/bottom_nav_bloc.dart';
import '../../../blocs/features/bottom_nav/bottom_nav_event.dart';
import '../../../blocs/features/bottom_nav/bottom_nav_state.dart';
import '../../orders/orders_screen.dart';
import '../dashboard_screen.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Container(
          height:94,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Color(0xffECECEC),
              ),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26),
              topRight: Radius.circular(26),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _navItem(
                  context,
                  index: 0,
                  currentIndex: state.currentIndex,
                  icon: Icons.home_rounded,
                  title: "Dashboard",
                ),

                _navItem(
                  context,
                  index: 1,
                  currentIndex: state.currentIndex,
                  icon: Icons.assignment_outlined,
                  title: "Orders",
                ),

                _navItem(
                  context,
                  index: 2,
                  currentIndex: state.currentIndex,
                  icon: Icons.inventory_2_outlined,
                  title: "Inventory",
                ),

                _navItem(
                  context,
                  index: 3,
                  currentIndex: state.currentIndex,
                  icon: Icons.bar_chart_outlined,
                  title: "Reports",
                ),

                _navItem(
                  context,
                  index: 4,
                  currentIndex: state.currentIndex,
                  icon: Icons.menu,
                  title: "More",
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _navItem(
      BuildContext context, {
        required int index,
        required int currentIndex,
        required IconData icon,
        required String title,
      }) {
    final bool selected = index == currentIndex;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        context.read<BottomNavBloc>().add(ChangeTabEvent(index));

        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const DashboardScreen(),
              ),
            );
            break;

          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const OrdersScreen(),
              ),
            );
            break;

          case 2:
            break;

          case 3:
            break;

          case 4:
            break;
        }
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 26,
              color: selected
                  ? const Color(0xff0B8A47)
                  : const Color(0xff5B616E),
            ),

            const SizedBox(height: 6),

            Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.navLabel.copyWith(
                color: selected
                    ? const Color(0xff0B8A47)
                    : const Color(0xff5B616E),
                fontWeight:
                selected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}