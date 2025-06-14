import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/drawer_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/view/widgets/drawer_widgets/appbar_drawer_screens.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerControllerImp drawerController = Get.find<DrawerControllerImp>();
    return Scaffold(
      body: Column(
        children: [
          AppbarDrawerScreens(
            onPressedBack: () {
              // Get.toNamed(AppRoutes.masterScreen);
              drawerController.selectedItemDrawer(0);
            },
          ),

          //--
          Expanded(
            child: const Center(
              child: Text(
                "No archived notes",
                style: TextStyle(fontSize: 18, color: AppColors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
