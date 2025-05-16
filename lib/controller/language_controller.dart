import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/data/services/services.dart';

class LanguageController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  // ThemeData appTheme = themeEnglish;

  void changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    language = locale; // تحديث اللغة
    myServices.sharedPreferences.setString("language", languageCode);

    // تحديد الثيم بناءً على اللغة

    // languageCode == "ar" ? appTheme = themeArabic : appTheme = themeEnglish;

    Get.updateLocale(locale);
    // update(); // استدعاء update() لإعادة بناء الواجهة
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("language");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      // appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      // appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}
