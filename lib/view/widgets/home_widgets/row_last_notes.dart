import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/app_theme.dart';
import 'package:my_notes/core/constant/strings_routes.dart';

class RowLastNotes extends StatelessWidget {
  const RowLastNotes({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppThemes.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Last Notes".tr,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(AppRoutes.showAll);
            },
            child: Text(
              "Show All".tr,
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.orange,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
