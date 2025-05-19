import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class TextFieldAddCategory extends StatelessWidget {
  final void Function(String)? onChange;
  final String hintText;
  const TextFieldAddCategory({
    super.key,
    required this.onChange,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        style: const TextStyle(color: AppColors.black),
        decoration: InputDecoration(
          hintText: hintText, //"Type the node title...",
          hintStyle: TextStyle(color: AppColors.grey),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.black),
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
