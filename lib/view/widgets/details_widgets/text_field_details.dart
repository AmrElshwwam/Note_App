import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/app_theme.dart';

class TextFieldDetails extends StatelessWidget {
  const TextFieldDetails({
    super.key,
    required this.myController,
    required this.fontSize,
    required this.fontWeight,
  });

  final TextEditingController? myController;
  final double fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppThemes.isDarkMode(context);

    return TextField(
      cursorColor: isDarkMode ? AppColors.white : AppColors.black,
      controller: myController,

      maxLines: null,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: isDarkMode ? AppColors.white : AppColors.black,
      ),
      decoration: const InputDecoration(
        isDense: true,
        // contentPadding: EdgeInsets.symmetric(vertical: 0),
        border: InputBorder.none,
      ),
    );
  }
}
