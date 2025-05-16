import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/app_theme.dart';

class TextFieldDescription extends StatelessWidget {
  final TextEditingController? controller;
  const TextFieldDescription({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppThemes.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        // height: 300,
        child: TextField(
          controller: controller,
          expands: true,
          maxLines: null,
          decoration: InputDecoration(
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
        ),
      ),
    );
  }
}
