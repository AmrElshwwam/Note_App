import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/drawer_controller.dart';
import 'package:my_notes/controller/language_controller.dart';
import 'package:my_notes/controller/settings_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/data/data_models/setting_items.dart';
import 'package:my_notes/view/widgets/drawer_widgets/appbar_drawer_screens.dart';

class SettingsScreen extends GetView<LanguageController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerControllerImp drawerController = Get.find<DrawerControllerImp>();

    SettingsControllerImp settingsController = Get.put(SettingsControllerImp());

    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Column(
        children: [
          //
          //
          AppbarDrawerScreens(
            onPressedBack: () {
              drawerController.selectedItemDrawer(0);
              Get.delete<SettingsControllerImp>();
            },
          ),

          //
          //
          Expanded(
            child: GetBuilder<SettingsControllerImp>(
              builder: (settingController) {
                return ListView.builder(
                  itemCount:
                      settingItems.length +
                      (settingsController.isLanguageDropdownVisible ? 2 : 0),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return ListTile(
                        title: Text(
                          settingItems[index].title.tr,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color:
                                isDarkTheme ? AppColors.white : AppColors.black,
                          ),
                        ),
                        subtitle: Text(
                          settingItems[index].subTitle.tr,
                          style: TextStyle(color: AppColors.grey),
                        ),
                        trailing: settingItems[index].icon,
                        onTap: () {
                          settingController.toggleLanguageDropdown();
                        },
                      );

                      //-- Button Language
                    } else if (settingController.isLanguageDropdownVisible &&
                        (index == 1 || index == 2)) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          color:
                              settingController.selectedLanguage == index
                                  ? AppColors.orange
                                  : null,
                          child: ListTile(
                            title: Text(
                              index == 1 ? '4'.tr : '5'.tr, // "English",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    settingController.selectedLanguage == index
                                        ? FontWeight.w500
                                        : null,
                                color:
                                    isDarkTheme
                                        ? AppColors.white
                                        : settingController.selectedLanguage ==
                                            index
                                        ? AppColors.white
                                        : AppColors.black,
                              ),
                            ),

                            onTap: () {
                              settingController.selectLanguageItem(index);
                              controller.changeLanguage(
                                settingController.codeLanguage!,
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return ListTile(
                        title: Text(
                          settingItems[settingController
                                      .isLanguageDropdownVisible
                                  ? index - 2
                                  : index]
                              .title.tr,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color:
                                isDarkTheme ? AppColors.white : AppColors.black,
                          ),
                        ),
                        subtitle: Text(
                          settingItems[settingController
                                      .isLanguageDropdownVisible
                                  ? index - 2
                                  : index]
                              .subTitle
                              .tr,
                          style: const TextStyle(color: AppColors.grey),
                        ),
                        trailing:
                            settingItems[settingController
                                        .isLanguageDropdownVisible
                                    ? index - 2
                                    : index]
                                .icon,
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
