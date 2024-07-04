import 'package:coffee_shop/src/features/menu/data/category_data.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CategoryGridView extends StatelessWidget {
  final CategoryData category;

  const CategoryGridView({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.9,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: category.products.map((product) {
        return ProductCard(product: product);
      }).toList(),
    );
  }
}
