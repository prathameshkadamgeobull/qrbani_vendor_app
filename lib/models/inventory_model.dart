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


  factory InventoryModel.fromJson(
      Map<String, dynamic> json,
      ) {

    return InventoryModel(
      animalName: json['animalName'] ?? "",
      image: _getAnimalImage(json['animalName']),
      available: json['available'] ?? 0,
      reserved: json['reserved'] ?? 0,
    );
  }


  static String _getAnimalImage(String? animalName){

    switch(animalName?.toLowerCase()){

      case "goat":
        return "assets/images/goat.jpg";

      case "sheep":
        return "assets/images/sheep.jpg";

      case "camel":
        return "assets/images/camelnew.jpg";

      default:
        return "assets/images/default_animal.png";
    }
  }


  @override
  List<Object?> get props => [
    animalName,
    image,
    available,
    reserved,
  ];
}