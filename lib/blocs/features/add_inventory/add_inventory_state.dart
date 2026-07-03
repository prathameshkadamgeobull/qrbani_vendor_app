import 'package:equatable/equatable.dart';

class AddInventoryState extends Equatable {
  final bool isLoading;
  final bool isSaved;
  final String? selectedAnimal;
  final List<String> animalTypes;

  const AddInventoryState({
    this.isLoading = false,
    this.isSaved = false,
    this.selectedAnimal,
    this.animalTypes = const [
      "Goat",
      "Sheep",
      "Camel",
    ],
  });

  AddInventoryState copyWith({
    bool? isLoading,
    bool? isSaved,
    String? selectedAnimal,
    List<String>? animalTypes,
  }) {
    return AddInventoryState(
      isLoading: isLoading ?? this.isLoading,
      isSaved: isSaved ?? this.isSaved,
      selectedAnimal: selectedAnimal ?? this.selectedAnimal,
      animalTypes: animalTypes ?? this.animalTypes,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isSaved,
    selectedAnimal,
    animalTypes,
  ];
}