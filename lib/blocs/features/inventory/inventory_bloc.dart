import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/repository/InventoryRepository.dart';
import '../../../models/inventory_model.dart';
import 'inventory_event.dart';
import 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {

  final InventoryRepository repository;

  InventoryBloc(this.repository
      ):super(const InventoryState())
  {


    on<LoadInventory>(_loadInventory);
    on<AddInventory>(_addInventory);
  }

  Future<void> _loadInventory(
      LoadInventory event,
      Emitter<InventoryState> emit,
      ) async {


    emit(
        state.copyWith(
            isLoading:true
        ));


    try{

      final inventories =
      await repository.getInventory();


      emit(
          state.copyWith(
            isLoading:false,
            inventories:inventories,
          )
      );


    }catch(e){

      emit(
          state.copyWith(
            isLoading:false,
          )
      );

    }

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