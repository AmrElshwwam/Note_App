import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/app_theme.dart';

class TextFieldTitle extends StatelessWidget {
  final void Function(String)? onChange;
  final String hintText;
  final TextEditingController? controller;
  const TextFieldTitle({
    super.key,
    this.onChange,
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppThemes.isDarkMode(context);

    // String nTitle;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText, //"Type the node title...",

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.orange, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}
