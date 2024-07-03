import 'package:coffee_shop/src/features/menu/data/product_data.dart';
import 'package:coffee_shop/src/features/menu/view/widgets/price_count_button.dart';
import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:coffee_shop/src/theme/image_sources.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductData product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      color: AppColors.white,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 100.0,
            child: Image.network(
              product.imageurl,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                ImageSources.placeholder,
                fit: BoxFit.cover,
              ),
              fit: BoxFit.cover,
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.black.withOpacity(0.6),
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 4.0),
                PriceCartButton(
                  price: product.price,
                  currency: product.currency,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
