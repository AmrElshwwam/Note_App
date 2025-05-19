import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class ButtonAddCategory extends StatelessWidget {
  const ButtonAddCategory({
    super.key,
    this.onPressed,
    required this.nameButton,
  });

  final String nameButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      minWidth: double.infinity,
      height: 60,
      onPressed: onPressed,
      color: AppColors.orange,
      child: Text(
        nameButton,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
      ),
    );
  }
}
