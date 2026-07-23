import 'package:equatable/equatable.dart';

class AddInventoryState extends Equatable {
  static const Object _noChange = Object();

  final bool isLoading;
  final bool isSaved;
  final String? selectedAnimal;
  final List<String> animalTypes;
  final List<String> breeds;
  final String? selectedBreed;

  const AddInventoryState({
    this.isLoading = false,
    this.isSaved = false,
    this.selectedAnimal,
    this.selectedBreed,
    this.breeds = const [],
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
    List<String>? breeds,
    Object? selectedBreed = _noChange,
  }) {
    return AddInventoryState(
      isLoading: isLoading ?? this.isLoading,
      isSaved: isSaved ?? this.isSaved,
      selectedAnimal: selectedAnimal ?? this.selectedAnimal,
      animalTypes: animalTypes ?? this.animalTypes,
      breeds: breeds ?? this.breeds,
      selectedBreed: identical(selectedBreed, _noChange)
          ? this.selectedBreed
          : selectedBreed as String?,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isSaved,
    selectedAnimal,
    animalTypes,
    breeds,
    selectedBreed,
  ];
}