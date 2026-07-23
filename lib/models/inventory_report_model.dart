class StockReportModel {

  final int totalProducts;
  final int inStock;
  final int lowStock;
  final int outOfStock;
  final double totalStockValue;

  final List<LowStockProduct> lowStockProducts;


  const StockReportModel({

    required this.totalProducts,
    required this.inStock,
    required this.lowStock,
    required this.outOfStock,
    required this.totalStockValue,
    required this.lowStockProducts,

  });


  factory StockReportModel.fromJson(Map<String,dynamic> json){

    return StockReportModel(

      totalProducts: json['totalProducts'] ?? 0,

      inStock: json['inStock'] ?? 0,

      lowStock: json['lowStock'] ?? 0,

      outOfStock: json['outOfStock'] ?? 0,

      totalStockValue:
      (json['totalStockValue'] ?? 0).toDouble(),


    lowStockProducts:
    (json['lowStockProducts'] as List? ?? [])
        .map(
    (e) => LowStockProduct.fromJson(e),
    )
    .toList(),
    );

  }
}

class LowStockProduct {

  final String productName;
  final String category;
  final int stock;


  const LowStockProduct({

    required this.productName,
    required this.category,
    required this.stock,

  });


  factory LowStockProduct.fromJson(
      Map<String,dynamic> json){

    return LowStockProduct(

      productName: json['productName'] ?? "",

      category: json['category'] ?? "",

      stock: json['stock'] ?? 0,

    );

  }

}