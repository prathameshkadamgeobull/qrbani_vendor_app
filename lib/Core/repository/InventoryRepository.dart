import '../services/api_service.dart';
import '../../models/inventory_model.dart';


class InventoryRepository {

  final ApiService apiService;


  InventoryRepository(
      this.apiService,
      );


  Future<List<InventoryModel>> getInventory() async {


    try {

      final response = await apiService.get(
        "/api/v1/inventory",
      );


      if(response.statusCode == 200){

        final List data = response.data['data'];


        return data
            .map(
              (item)=>InventoryModel.fromJson(item),
        )
            .toList();

      }


      throw Exception(
          "Unable to fetch inventory"
      );


    } catch(e){

      throw Exception(
          e.toString()
      );

    }

  }



  Future<bool> addInventory({

    required String animalName,
    required int quantity,

  }) async {


    try {


      final response =
      await apiService.post(
        "/api/v1/inventory",
        {
          "animalName":animalName,
          "quantity":quantity,
        },
      );


      return response.data['success'] ?? false;


    } catch(e){

      throw Exception(
          e.toString()
      );

    }

  }

}