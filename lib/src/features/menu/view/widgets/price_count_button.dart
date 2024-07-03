import 'package:coffee_shop/src/features/menu/view/widgets/price_button.dart';
import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PriceCartButton extends StatefulWidget 
{
  final double price;
  final String currency;

  const PriceCartButton({super.key, required this.price, required this.currency});

  @override
  State<PriceCartButton> createState() => _PriceCartButtonState();
}

class _PriceCartButtonState extends State<PriceCartButton> 
{
  int quantity = 0;
  bool showQuantityButtons = false;

  @override
  Widget build(BuildContext context) 
  {
    return InkWell(
      onTap: () 
      {
        setState(() 
        {
          if (!showQuantityButtons) 
          {
            showQuantityButtons = true;
            quantity++;
          }
        });
      },
      child: showQuantityButtons
          ? _buildQuantityButtons(context)
          : PriceButton(
            price: widget.price, 
            currency: widget.currency,),
    );
  }

  Widget _buildQuantityButtons(BuildContext context) 
  {
    const double buttonHeight = 24.0;
    const double buttonWidth = double.infinity;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildQuantityButton(
          context,
          Icons.remove,
          () 
          {
            setState(() {
              if (quantity > 0) 
              {
                quantity--;
                if (quantity == 0) {
                  showQuantityButtons = false;
                }
              }
            });
          },
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: Center(
                child: Text(
                  quantity.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ),
        ),
        _buildQuantityButton(
          context,
          Icons.add,
          () 
          {
            setState(() {
              if (quantity < 10) 
              {
                quantity++;
              }
            });
          },
        ),
      ],
    );
  }

  Widget _buildQuantityButton(
    BuildContext context,
    IconData icon,
    VoidCallback onTap,
  ) {
    const double buttonHeight = 24.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: InkWell(
          onTap: onTap,
          child: Icon(
            icon,
            size: buttonHeight,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}