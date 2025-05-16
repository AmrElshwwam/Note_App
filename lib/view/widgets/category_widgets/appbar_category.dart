import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class AppbarCategory extends StatelessWidget {
  final String titleAppBar;
  const AppbarCategory({super.key, required this.titleAppBar});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: AppColors.orange,
      height: 60,
      child: Row(
        children: [
          IconButton(
            iconSize: 30,
            style: const ButtonStyle(
              side: WidgetStatePropertyAll(
                BorderSide(color: AppColors.white, width: 2),
              ),
            ),
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: AppColors.white,
              // size: 30,
            ),
          ),

          SizedBox(width: 10),

          //
          Text(
            titleAppBar,
            style: const TextStyle(
              fontSize: 22,
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),

          //
        ],
      ),
    );
  }
}
