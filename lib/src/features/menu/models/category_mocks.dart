import 'package:coffee_shop/src/features/menu/data/category_data.dart';
import 'package:coffee_shop/src/features/menu/models/product_mocks.dart';

CategoryData category = CategoryData(
  name: 'Кофейные напитки на основе эспрессо',
  products: [product, product4, product6, product7, product9],);

CategoryData category1 = CategoryData(
  name: 'Кофейные напитки с молоком', 
  products: [product1, product2, product3, product8, product10],);

CategoryData category2 = CategoryData(
  name: 'Экзотика',
  products: [product5, product12, product13, product14],);

CategoryData category3 = CategoryData(
  name: 'It is DUNK', 
  products: [product11, product11, product11, product11],);

var categories1 = [category, category1, category2, category3];