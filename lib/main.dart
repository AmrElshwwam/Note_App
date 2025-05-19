import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_notes/bindings.dart';
import 'package:my_notes/controller/language_controller.dart';
import 'package:my_notes/controller/theme_controller.dart';
import 'package:my_notes/core/constant/app_theme.dart';
import 'package:my_notes/core/constant/strings_routes.dart';
import 'package:my_notes/core/localization/translation.dart';
import 'package:my_notes/data/services/services.dart';
import 'package:my_notes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await GetStorage.init();

  Get.put<LanguageController>(LanguageController(), permanent: true);
  Get.put<ThemeController>(ThemeController());

  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends GetView<ThemeController> {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      builder: (langController) {
        return GetMaterialApp(
          translations: MyTranslation(),
          debugShowCheckedModeBanner: false,
          locale: langController.language,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: Get.find<ThemeController>().theme,
          getPages: routes,
          initialBinding: AppBinding(),
          initialRoute: AppRoutes.welcomeScreen,
        );
      },
    );
  }
}
