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
        borderRadius: BorderRadius.circular(16.0),
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 10.0,
      color: AppColors.white,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 200.0,
            width: double.infinity,
            child: Image.network(
              product.imageurl,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                ImageSources.placeholder,
                fit: BoxFit.contain,
              ),
              fit: BoxFit.contain,
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.blue.withOpacity(0.7),
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    product.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColors.white),
                  ),
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
