import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/drawer_controller.dart';
import 'package:my_notes/controller/profile_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/data/data_models/drawer_items.dart';
import 'package:my_notes/view/widgets/search_screen_widgets/icon_button_widget.dart';

class AppbarDrawerScreens extends StatelessWidget {
  final void Function()? onPressedBack;
  const AppbarDrawerScreens({super.key, required this.onPressedBack});

  @override
  Widget build(BuildContext context) {
    DrawerControllerImp drawerController = Get.find<DrawerControllerImp>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: AppColors.orange,
      height: 60,
      child: Row(
        children: [
          IconButtonWidget(
            iconButton: Icons.keyboard_arrow_left,
            onPressed: () {
              drawerController.selectedItemDrawer(0);
              Get.delete<ProfileControllerImp>();
            },
          ),

          //--
          SizedBox(width: 20),

          //
          Text(
            drawerItems[drawerController.selectedIndexItemsDrawer].title.tr,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
              fontFamily: "Merienda",
            ),
          ),

          //
        ],
      ),
    );
  }
}
