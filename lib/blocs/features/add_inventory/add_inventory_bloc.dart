import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/repository/add_inventory_repository.dart';
import 'add_inventory_event.dart';
import 'add_inventory_state.dart';

class AddInventoryBloc
    extends Bloc<AddInventoryEvent, AddInventoryState> {


  final InventoryRepository repository;

  AddInventoryBloc(
      this.repository
      ) :

          super(const AddInventoryState()) {
    on<LoadAddInventory>(_loadScreen);
    on<AnimalTypeChanged>(_changeAnimal);
    on<BreedChanged>(_breedChanged);
    on<SaveInventory>(_saveInventory);
  }

  final Map<String, List<String>> animalBreeds = {
    "Sheep": [
      "Awassi",
      "Najdi",
      "Harri",
      "Sawakni",
    ],
    "Goat": [
      "Boer",
      "Saanen",
      "Damascus",
      "Black Goat",
    ],
    "Cow": [
      "Holstein",
      "Jersey",
      "Angus",
    ],
    "Camel": [
      "Majaheem",
      "Maghateer",
      "Sofor",
    ],
  };

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
        breeds: animalBreeds[event.animalType] ?? [],
        selectedBreed: null,
      ),
    );
  }
  void _breedChanged(
      BreedChanged event,
      Emitter<AddInventoryState> emit,
      ) {
    emit(
      state.copyWith(
        selectedBreed: event.breed,
      ),
    );
  }

  Future<void> _saveInventory(
      SaveInventory event,
      Emitter<AddInventoryState> emit,
      ) async {


    emit(
        state.copyWith(
            isLoading:true
        )
    );


    try{


      final result =
      await repository.addInventory(

        animalType:event.animalType,

        breed:event.breed,

        age:event.age,

        quantity:event.quantity,

        totalWeight:event.totalWeight,

        price:event.price,

        notes:event.notes,

      );



      if(result){


        emit(
            state.copyWith(

              isLoading:false,

              isSaved:true,

            )
        );


      }else{


        emit(
            state.copyWith(
              isLoading:false,
            )
        );


      }


    }

    catch(e){


      emit(
          state.copyWith(
            isLoading:false,
          )
      );


    }



  }
}