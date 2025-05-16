import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class AppThemes {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // ثيم Light
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Merienda",
    scaffoldBackgroundColor: AppColors.white,
    // يمكنك تخصيص المزيد هنا حسب رغبتك
  );

  // ثيم Dark
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Merienda",
    scaffoldBackgroundColor: AppColors.black,
    // textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
  );
}
