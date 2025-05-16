import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class AppbarShowAll extends StatelessWidget {
  const AppbarShowAll({super.key});

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

          //--
          SizedBox(width: 10),

          //
          Text(
            "Notes",
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
