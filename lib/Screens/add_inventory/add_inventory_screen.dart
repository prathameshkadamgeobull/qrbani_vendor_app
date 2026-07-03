import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/constants/app_text_style.dart';
import '../../blocs/features/add_inventory/add_inventory_bloc.dart';
import '../../blocs/features/add_inventory/add_inventory_event.dart';
import '../../blocs/features/add_inventory/add_inventory_state.dart';

import '../../blocs/features/inventory/inventory_bloc.dart';
import '../../blocs/features/inventory/inventory_event.dart';
import 'widgets/custom_dropdown.dart';
import 'widgets/custom_textfield.dart';
import 'widgets/save_inventory_button.dart';

class AddInventoryScreen extends StatefulWidget {
  const AddInventoryScreen({super.key});

  @override
  State<AddInventoryScreen> createState() => _AddInventoryScreenState();
}

class _AddInventoryScreenState extends State<AddInventoryScreen> {

  final quantityController = TextEditingController();
  final minWeightController = TextEditingController();
  final maxWeightController = TextEditingController();
  final priceController = TextEditingController();
  final notesController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<AddInventoryBloc>().add(
      const LoadAddInventory(),
    );
  }

  @override
  void dispose() {
    quantityController.dispose();
    minWeightController.dispose();
    maxWeightController.dispose();
    priceController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddInventoryBloc, AddInventoryState>(
      listener: (context, state) {

        if (state.isSaved) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Inventory Saved Successfully"),
            ),
          );

          Navigator.pop(context);
        }
      },

      child: Scaffold(
        backgroundColor: const Color(0xffF7F7F7),

        body: SafeArea(
          child: BlocBuilder<AddInventoryBloc, AddInventoryState>(
            builder: (context, state) {

              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// Header
                    Row(
                      children: [

                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                          ),
                        ),

                        const SizedBox(width: 15),

                        const Text(
                          "Add Inventory",
                          style: AppTextStyles.orderTitle,
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    /// Animal Type
                    CustomDropdown(
                      label: "Animal Type",
                      value: state.selectedAnimal,
                      items: state.animalTypes,
                      onChanged: (value) {
                        context.read<AddInventoryBloc>().add(
                          AnimalTypeChanged(value!),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    /// Quantity
                    CustomTextField(
                      label: "Total Quantity",
                      hint: "Enter quantity",
                      controller: quantityController,
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 20),

                    /// Weight Range
                    Text(
                      "Weight Range (KG)",
                      style: AppTextStyles.bodyMedium,
                    ),

                   const SizedBox(height: 8),

                    Row(
                      children: [

                        Expanded(
                          child: CustomTextField(
                            label: "",
                            hint: "Min",
                            controller: minWeightController,
                            keyboardType: TextInputType.number,
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: CustomTextField(
                            label: "",
                            hint: "Max",
                            controller: maxWeightController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// Price
                    CustomTextField(
                      label: "Price Per Unit (SAR)",
                      hint: "Enter price",
                      controller: priceController,
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 20),

                    /// Notes
                    CustomTextField(
                      label: "Notes (Optional)",
                      hint: "Enter notes",
                      controller: notesController,
                      maxLines: 4,
                    ),

                    const SizedBox(height: 35),

                    if (state.isLoading)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                    else
                      SaveInventoryButton(
                        onPressed: () {

                          // Save form
                          context.read<AddInventoryBloc>().add(
                            SaveInventory(
                              animalType: state.selectedAnimal ?? "",
                              quantity: quantityController.text,
                              minWeight: minWeightController.text,
                              maxWeight: maxWeightController.text,
                              price: priceController.text,
                              notes: notesController.text,
                            ),
                          );

                          // Update inventory list
                          context.read<InventoryBloc>().add(
                            AddInventory(
                              animalName: state.selectedAnimal ?? "",
                              quantity: int.tryParse(quantityController.text) ?? 0,
                            ),
                          );
                        },
                      ),

                    const SizedBox(height: 30),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}