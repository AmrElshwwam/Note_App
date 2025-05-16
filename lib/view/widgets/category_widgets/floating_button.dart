import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class FloatingButton extends StatelessWidget {
  final void Function()? onPressed;
  const FloatingButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      backgroundColor: AppColors.orange,
      child: const Icon(Icons.add, color: AppColors.white, size: 30),
    );
  }
}
