import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class WelcomeMessageScreen extends StatelessWidget {
  const WelcomeMessageScreen({super.key, required this.titleScreen});

  final String titleScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text(
          titleScreen,
          // "Create Account",
          style: TextStyle(
            fontSize: 30,
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
