import 'package:equatable/equatable.dart';

import '../../../models/inventory_model.dart';

class InventoryState extends Equatable {
  final bool isLoading;
  final List<InventoryModel> inventories;

  const InventoryState({
    this.isLoading = false,
    this.inventories = const [],
  });

  InventoryState copyWith({
    bool? isLoading,
    List<InventoryModel>? inventories,
  }) {
    return InventoryState(
      isLoading: isLoading ?? this.isLoading,
      inventories: inventories ?? this.inventories,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    inventories,
  ];
}