import 'package:coffee_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onSelected;

  const CategoryChip({
    Key? key,
    required this.text,
    required this.onSelected,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      backgroundColor: isSelected ? AppColors.blue : AppColors.white,
      side: BorderSide.none,
      label: Text(
        text,
        style: TextStyle(
          color: isSelected ? AppColors.white : AppColors.black,
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      onPressed: onSelected,
    );
  }
}
