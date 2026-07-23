import 'package:dio/dio.dart';

import '../../core/api/api_constants.dart';

import '../services/api_service.dart';



class InventoryRepository {


  final ApiService apiService;


  InventoryRepository(this.apiService);



  Future<bool> addInventory({

    required String animalType,
    required String breed,
    required String age,
    required String quantity,
    required String totalWeight,
    required String price,
    required String notes,


  }) async{


    final response =
    await apiService.post(

        ApiConstants.baseUrl+ApiConstants.addInventory,

        {

          "animal_type": animalType,

          "breed": breed,

          "age": age,

          "quantity": quantity,

          "total_weight": totalWeight,

          "price": price,

          "notes": notes,

        }

    );



    if(response.statusCode == 200){

      return response.data["success"] ?? false;

    }


    return false;


  }



}