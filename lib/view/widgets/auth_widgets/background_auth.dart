import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class BackgroundAuth extends StatelessWidget {
  const BackgroundAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
            ),
          ),
        ),

        //--
        Expanded(child: Container()),
      ],
    );
  }
}
