import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key, this.onPressed, required this.iconButton});

  // final SearchControllerImp searchController;
  final void Function()? onPressed;
  final IconData iconButton;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      style: const ButtonStyle(
        side: WidgetStatePropertyAll(
          BorderSide(color: AppColors.white, width: 2),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(iconButton, color: AppColors.white),
    );
  }
}
