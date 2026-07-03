import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_inventory_event.dart';
import 'add_inventory_state.dart';

class AddInventoryBloc
    extends Bloc<AddInventoryEvent, AddInventoryState> {
  AddInventoryBloc() : super(const AddInventoryState()) {
    on<LoadAddInventory>(_loadScreen);
    on<AnimalTypeChanged>(_changeAnimal);
    on<SaveInventory>(_saveInventory);
  }

  Future<void> _loadScreen(
      LoadAddInventory event,
      Emitter<AddInventoryState> emit,
      ) async {
    emit(
      state.copyWith(
        isLoading: false,
      ),
    );
  }

  void _changeAnimal(
      AnimalTypeChanged event,
      Emitter<AddInventoryState> emit,
      ) {
    emit(
      state.copyWith(
        selectedAnimal: event.animalType,
      ),
    );
  }

  Future<void> _saveInventory(
      SaveInventory event,
      Emitter<AddInventoryState> emit,
      ) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    /// API Call Here
    await Future.delayed(
      const Duration(seconds: 1),
    );

    emit(
      state.copyWith(
        isLoading: false,
        isSaved: true,
      ),
    );

    
  }
}