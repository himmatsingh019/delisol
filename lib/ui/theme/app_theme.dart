import 'package:delisol/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColor,
      );
}
