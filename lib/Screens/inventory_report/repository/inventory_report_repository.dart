import '../../../models/inventory_report_model.dart';

class StockReportRepository {

  Future<StockReportModel> getStockReport({
    required DateTime date,
  }) async {


    await Future.delayed(
      const Duration(seconds:1),
    );


    int day = date.day;


    int totalProducts = 500 + (day * 2);


    int inStock = totalProducts - 100;


    int lowStock = 50 + day;


    int outOfStock =
        totalProducts - inStock - lowStock;


    double stockValue =
        totalProducts * 150;



    List<LowStockProduct> products = [

      LowStockProduct(
        productName: "Goat",
        category: "Livestock",
        stock: 5 + day,
      ),


      LowStockProduct(
        productName: "Sheep",
        category: "Livestock",
        stock: 3 + day,
      ),


      LowStockProduct(
        productName: "Camel",
        category: "Livestock",
        stock: 7 + day,
      ),

    ];



    return StockReportModel(

      totalProducts: totalProducts,

      inStock: inStock,

      lowStock: lowStock,

      outOfStock: outOfStock,

      totalStockValue: stockValue,


      lowStockProducts: [

        LowStockProduct(
          productName: "Goat",
          category: "Livestock",
          stock: 12,
        ),


        LowStockProduct(
          productName: "Sheep",
          category: "Livestock",
          stock: 8,
        ),


        LowStockProduct(
          productName: "Camel",
          category: "Livestock",
          stock: 10,
        ),

      ],

    );


  }

}