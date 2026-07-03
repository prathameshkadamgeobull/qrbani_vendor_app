import 'package:equatable/equatable.dart';

class InventoryModel extends Equatable {
  final String animalName;
  final String image;
  final int available;
  final int reserved;

  const InventoryModel({
    required this.animalName,
    required this.image,
    required this.available,
    required this.reserved,
  });

  @override
  List<Object?> get props => [
    animalName,
    image,
    available,
    reserved,
  ];
}