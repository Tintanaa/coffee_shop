import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PriceButton extends StatelessWidget 
{
  final double price;
  final String currency;
  const PriceButton({super.key, required this.price, required this.currency});

  @override
  Widget build(BuildContext context) 
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        width: double.infinity,
        height: 24.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Center(
            child: Text(
              '${price.toStringAsFixed(price.truncateToDouble() == price ? 0 : 2)} $currency',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ),
    );
  }
}