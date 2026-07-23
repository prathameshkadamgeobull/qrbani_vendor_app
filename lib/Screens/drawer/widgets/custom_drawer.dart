import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/bottom_nav/bottom_nav_bloc.dart';
import 'package:qrbani_vender_app/blocs/features/bottom_nav/bottom_nav_event.dart';

import '../../../blocs/features/drawer/drawer_bloc.dart';
import '../../../blocs/features/drawer/drawer_event.dart';
import '../../../blocs/features/drawer/drawer_state.dart';

import '../repository/drawer_repository.dart';
import 'drawer_header.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final DrawerRepository repository = DrawerRepository();

  @override
  Widget build(BuildContext context) {
    final menus = repository.getMenus();
    final String? route = ModalRoute.of(context)?.settings.name;

    return Drawer(
      backgroundColor: const Color(0xFF003C2F),
      child: SafeArea(
        child: BlocBuilder<DrawerBloc, DrawerState>(
          builder: (context, state) {
            int selected = 0;

            if (state is DrawerInitial) {
              selected = state.selectedIndex;
            }

            return Column(
              children: [
                /// Drawer Header
                const DrawerHeaderWidget(),

                /// Drawer Menu
                Expanded(
                  child: ListView.builder(
                    itemCount: menus.length,
                    itemBuilder: (context, index) {
                      final menu = menus[index];

                      return DrawerTile(
                        title: menu.title,
                        isSelected: selected == index,
                        onTap: () {
                          isSelected: menu.route == route;
                          int bottomIndex = 0;

                          switch (menu.route) {
                            case "/dashboard":
                              bottomIndex = 0;
                              break;

                            case "/orders":
                              bottomIndex = 1;
                              break;

                            case "/inventory":
                              bottomIndex = 2;
                              break;

                            case "/reports":
                              bottomIndex = 3;
                              break;

                          // These screens belong to "More"
                            case "/settings":
                            case "/support":
                            case "/notifications":
                            case "/transactions":
                            case "/payouts":
                            case "/timeSlots":
                              bottomIndex = 4;
                              break;
                          }

                          // Update Bottom Navigation
                          context.read<BottomNavBloc>().add(
                            ChangeTabEvent(bottomIndex),
                          );

                          // Update Drawer Selection
                          context.read<DrawerBloc>().add(
                            ChangeDrawerItem(index),
                          );

                          // Navigator.of(context).pop();
                          //
                          // Future.microtask(() {
                          //   Navigator.of(context, rootNavigator: true).pushNamed(menu.route);
                          // });
                          Navigator.pop(context);

                          Navigator.pushNamed(
                            context,
                            menu.route,
                          );
                        },
                      );
                    },
                  ),
                ),

                /// Version
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Version 1.0.0",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}