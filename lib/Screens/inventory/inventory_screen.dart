import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/constants/app_text_style.dart';
import '../../blocs/features/add_inventory/add_inventory_bloc.dart';
import '../../blocs/features/bottom_nav/bottom_nav_bloc.dart';
import '../../blocs/features/bottom_nav/bottom_nav_event.dart';
import '../../blocs/features/inventory/inventory_bloc.dart';
import '../../blocs/features/inventory/inventory_event.dart';
import '../../blocs/features/inventory/inventory_state.dart';

import '../add_inventory/add_inventory_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../dashboard/widgets/custom_bottom_nav.dart';
import 'widgets/inventory_card.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  void initState() {
    super.initState();

    context.read<BottomNavBloc>().add(
      ChangeTabEvent(2),
    );

    context.read<InventoryBloc>().add(
      LoadInventory(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),

      bottomNavigationBar: const CustomBottomNavigation(),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_) => AddInventoryBloc(),
                    child: const AddInventoryScreen(),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: const Text(
              "Add Inventory",
              style: AppTextStyles.buttonText,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0B8A47),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: BlocBuilder<InventoryBloc, InventoryState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              children: [

                /// Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
                  child: Row(
                    children: [

                      InkWell(
                        onTap: () {
                          context.read<BottomNavBloc>().add(
                            ChangeTabEvent(0),
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const DashboardScreen(),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 18,
                          ),
                        ),
                      ),

                      const Expanded(
                        child: Center(
                          child: Text(
                            "Inventory",
                            style: AppTextStyles.orderTitle,
                          ),
                        ),
                      ),

                      const SizedBox(width: 40),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: state.inventories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: InventoryCard(
                          inventory: state.inventories[index],
                        ),
                      );
                    },
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