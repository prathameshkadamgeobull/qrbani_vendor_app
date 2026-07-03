import 'package:equatable/equatable.dart';

abstract class InventoryEvent extends Equatable {
  const InventoryEvent();

  @override
  List<Object?> get props => [];
}

/// Load Inventory
class LoadInventory extends InventoryEvent {
  const LoadInventory();
}

/// Add Inventory
/// Add Inventory
class AddInventory extends InventoryEvent {
  final String animalName;
  final int quantity;

  const AddInventory({
    required this.animalName,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
    animalName,
    quantity,
  ];
}