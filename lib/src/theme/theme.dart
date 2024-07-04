import 'package:flutter/material.dart';
import 'package:coffee_shop/src/theme/app_colors.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: AppColors.whitemetallic,
  cardTheme: const CardTheme(),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Roboto', 
      fontSize: 28, 
      fontWeight: FontWeight.w600, 
      letterSpacing: 0, 
      color: AppColors.black,),

    titleMedium: TextStyle(
      fontFamily: 'Roboto', 
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15, 
      color: AppColors.black,),

    bodyMedium: TextStyle(
      fontFamily: 'Roboto', 
      fontSize: 12, 
      fontWeight: FontWeight.w400, 
      letterSpacing: 0.25, 
      color: AppColors.black,),

    bodySmall: TextStyle(
      fontFamily: 'Roboto', 
      fontSize: 10, 
      fontWeight: FontWeight.w400, 
      letterSpacing: 0.4, 
      color: AppColors.white,),
  ),
);
