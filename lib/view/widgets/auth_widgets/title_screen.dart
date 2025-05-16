import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key, required this.titleScreen});

  final String titleScreen;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        titleScreen,
        // "Sign In",
        style: TextStyle(
          color: AppColors.orange,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
