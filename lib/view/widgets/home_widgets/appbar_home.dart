import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: AppColors.white,
                border: Border.all(color: AppColors.white, width: 2),
              ),
              child: Icon(Icons.menu, size: 30, color: AppColors.white),
            ),
          ),
          //--

          //--
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "4".tr, //"Hello !",
                style:
                //Theme.of(context).textTheme.bodySmall,
                const TextStyle(color: AppColors.white, fontSize: 18),
              ),
              const Text(
                "Amr Medhat",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ],
          ),

          //--
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: AppColors.white,
              border: Border.all(color: AppColors.white, width: 2),
            ),
            child: Icon(Icons.person, size: 30, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
