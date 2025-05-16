import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_notes/controller/settings_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class SwitchSettingsWidget extends StatelessWidget {
  const SwitchSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsControllerImp>(
      builder: (settingController) {
        return Switch(
          value: settingController.statusSwitch!,
          onChanged: (value) {
            settingController.changeStatusSwitch(value);
          },
          activeColor: AppColors.orange,
        );
      },
    );
  }
}
