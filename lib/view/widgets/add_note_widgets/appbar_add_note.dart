import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/app_theme.dart';

class AppbarAddNote extends StatelessWidget {
  const AppbarAddNote({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppThemes.isDarkMode(context);
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.orange,
              ),
              child: Icon(
                Icons.keyboard_arrow_left,
                size: 30,
                color: AppColors.white,
              ),
            ),
          ),

          //--
          SizedBox(width: 10),

          //--
          Text(
            "Create Note",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
          ),

          //
        ],
      ),
    );
  }
}
