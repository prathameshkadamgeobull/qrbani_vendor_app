import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/inventory_model.dart';
import 'inventory_event.dart';
import 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  InventoryBloc() : super(const InventoryState()) {
    on<LoadInventory>(_loadInventory);
    on<AddInventory>(_addInventory);
  }

  Future<void> _loadInventory(
      LoadInventory event,
      Emitter<InventoryState> emit,
      ) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    final inventories = [
      const InventoryModel(
        animalName: "Goat",
        image: "assets/images/goat.jpg",
        available: 230,
        reserved: 45,
      ),
      const InventoryModel(
        animalName: "Sheep",
        image: "assets/images/sheep.jpg",
        available: 120,
        reserved: 20,
      ),
      const InventoryModel(
        animalName: "Camel",
        image: "assets/images/camelnew.jpg",
        available: 80,
        reserved: 15,
      ),
    ];

    emit(
      state.copyWith(
        isLoading: false,
        inventories: inventories,
      ),
    );
  }

  void _addInventory(
      AddInventory event,
      Emitter<InventoryState> emit,
      ) {
    final List<InventoryModel> updatedInventory =
    state.inventories.map((item) {

      if (item.animalName == event.animalName) {
        return InventoryModel(
          animalName: item.animalName,
          image: item.image,
          available: item.available + event.quantity,
          reserved: item.reserved,
        );
      }

      return item;

    }).toList();

    emit(
      state.copyWith(
        inventories: updatedInventory,
      ),
    );
  }
}