class InventoryModel {


  final bool success;
  final String message;


  InventoryModel({
    required this.success,
    required this.message,
  });



  factory InventoryModel.fromJson(
      Map<String,dynamic> json){

    return InventoryModel(

      success: json['success'] ?? false,

      message: json['message'] ?? "",

    );

  }


}