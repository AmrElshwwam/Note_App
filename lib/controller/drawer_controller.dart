import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/data/models/item_drawer_model.dart';
import 'package:my_notes/view/screens/archive_screen.dart';
import 'package:my_notes/view/screens/home_screen.dart';
import 'package:my_notes/view/screens/profile_screen.dart';
import 'package:my_notes/view/screens/settings_screen.dart';
import 'package:my_notes/view/screens/trash_screen.dart';

abstract class DrawerController extends GetxController {
  //--
  List<ItemDrawerModel> drawerItems = [
    ItemDrawerModel(title: "Home", iconCategory: Icons.home),
    ItemDrawerModel(title: "Profile", iconCategory: Icons.person),
    ItemDrawerModel(
      title: "archives",
      iconCategory: Icons.file_download_outlined,
    ),
    ItemDrawerModel(title: "Trash", iconCategory: Icons.delete),
    ItemDrawerModel(title: "Settings", iconCategory: Icons.settings),
  ];

  //--

  int selectedIndexItemsDrawer = 0;

  void selectedItemDrawer(int index);

  List<Widget> drawerScreens = [
    // const HomeScreen(),
    const HomeScreen(),
    const ProfileScreen(),
    const ArchiveScreen(),
    const TrashScreen(),
    const SettingsScreen(),
  ];
}

//--------------

class DrawerControllerImp extends DrawerController {
  @override
  void selectedItemDrawer(int index) {
    selectedIndexItemsDrawer = index;
    update();
  }
}
