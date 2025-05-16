import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_notes/controller/theme_controller.dart';
import 'package:my_notes/data/models/item_settings_model.dart';
import 'package:my_notes/data/services/services.dart';
import 'package:my_notes/view/widgets/settings_widgets/switch_settings_widget.dart';

abstract class SettingsController extends GetxController {
  ThemeController? themeController;
  //--
  List<ItemSettingsModel> drawerItems = [
    ItemSettingsModel(
      title: "Language",
      subTitle: "Choose Language For Your Favorite",
      icon: Icon(Icons.language, size: 25),
    ),
    ItemSettingsModel(
      title: "Themes",
      subTitle: "Turn On Dark Theme",
      icon: SwitchSettingsWidget(),
    ),
    ItemSettingsModel(
      title: "Download",
      subTitle: "You Can Download On Our Website",
      icon: Icon(Icons.download, size: 25),
    ),
    ItemSettingsModel(
      title: "Upload",
      subTitle: "You Can Upload To Our Website",
      icon: Icon(Icons.upload, size: 25),
    ),
  ];

  // مخزن وفانكشن تعمل علي اظهار قائمة اختيار اللغات
  bool isLanguageDropdownVisible = false;
  void toggleLanguageDropdown();

  // مخزن وفانكش تعمل علي تشغيل السويتش و تغير الثيم للبرنامج
  bool? statusSwitch;
  void changeStatusSwitch(bool status);

  //
  int? selectedLanguage;
  String? codeLanguage;
  void selectLanguageItem(int index);
}

//............................

class SettingsControllerImp extends SettingsController {
  @override
  void onInit() {
    MyServices myServices = Get.find();
    GetStorage storage = GetStorage();
    statusSwitch = storage.read("isDarkMode") ?? false;
    String? getLanguage = myServices.sharedPreferences.getString("language");
    if (getLanguage == "ar") {
      selectedLanguage = 1;
    } else if (getLanguage == "en") {
      selectedLanguage = 2;
    } else {
      selectedLanguage = 2;
    }

    super.onInit();
  }

  //--

  @override
  void toggleLanguageDropdown() {
    isLanguageDropdownVisible = !isLanguageDropdownVisible;
    update();
  }

  //--

  @override
  void changeStatusSwitch(bool status) {
    statusSwitch = status;
    Get.find<ThemeController>().toggleTheme();
    // themeController!.toggleTheme();
    update();
  }

  //
  //

  @override
  void selectLanguageItem(int index) {
    selectedLanguage = index;
    if (index == 1) {
      codeLanguage = "ar";
    } else if (index == 2) {
      codeLanguage = "en";
    }
    update();
  }
}
