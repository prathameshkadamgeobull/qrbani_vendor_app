import 'package:equatable/equatable.dart';

abstract class AddInventoryEvent extends Equatable {
  const AddInventoryEvent();

  @override
  List<Object?> get props => [];
}

/// Load Screen
class LoadAddInventory extends AddInventoryEvent {
  const LoadAddInventory();
}

/// Animal Type Changed
class AnimalTypeChanged extends AddInventoryEvent {
  final String animalType;

  const AnimalTypeChanged(this.animalType);

  @override
  List<Object?> get props => [animalType];
}

/// Save Inventory
class SaveInventory extends AddInventoryEvent {
  final String animalType;
  final String breed;
  final String age;
  final String quantity;
  final String totalWeight;
  final String price;
  final String notes;

  const SaveInventory({
    required this.animalType,
    required this.breed,
    required this.age,
    required this.quantity,
    required this.totalWeight,
    required this.price,
    required this.notes,
  });

  @override
  List<Object?> get props => [
    animalType,
    quantity,
    totalWeight,
    price,
    notes,
  ];
}
class BreedChanged extends AddInventoryEvent {
  final String breed;

  const BreedChanged(this.breed);
}