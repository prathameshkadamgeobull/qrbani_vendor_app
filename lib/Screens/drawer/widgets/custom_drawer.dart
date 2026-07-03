import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    padding: EdgeInsets.zero,
                    itemCount: menus.length,
                    itemBuilder: (context, index) {
                      return DrawerTile(
                        title: menus[index].title,
                        isSelected: selected == index,
                        onTap: () {
                          context
                              .read<DrawerBloc>()
                              .add(ChangeDrawerItem(index));

                          Navigator.pop(context);

                          Navigator.pushNamed(
                            context,
                            menus[index].route,
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