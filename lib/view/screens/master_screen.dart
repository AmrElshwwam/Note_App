import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/drawer_controller.dart';

class MasterScreen extends StatelessWidget {
  const MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,

        body: GetBuilder<DrawerControllerImp>(
          builder: (drawerController) {
            return drawerController.drawerScreens[drawerController
                .selectedIndexItemsDrawer];
          },
        ),
      ),
    );
  }
}
