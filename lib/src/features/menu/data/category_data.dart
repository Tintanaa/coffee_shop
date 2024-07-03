import 'package:coffee_shop/src/features/menu/data/product_data.dart';

class CategoryData {
  final String name;
  final List<ProductData> products;

  const CategoryData({required this.name, required this.products});

  factory CategoryData.fromJSON(Map<String, dynamic> json) {
    final productList = json['products'] as List<dynamic>;
    final products = productList.map(
      (product) => ProductData.fromJSON(product as Map<String, dynamic>),
      ).toList();

    return CategoryData(
      name: json['name'] as String,
      products: products,
    );
  }
}