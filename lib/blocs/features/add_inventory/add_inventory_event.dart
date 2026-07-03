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
  final String quantity;
  final String minWeight;
  final String maxWeight;
  final String price;
  final String notes;

  const SaveInventory({
    required this.animalType,
    required this.quantity,
    required this.minWeight,
    required this.maxWeight,
    required this.price,
    required this.notes,
  });

  @override
  List<Object?> get props => [
    animalType,
    quantity,
    minWeight,
    maxWeight,
    price,
    notes,
  ];
}