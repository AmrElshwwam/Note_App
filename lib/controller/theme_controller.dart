import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    // ده اللي بيخلّي التطبيق يطبّق الثيم المخزن أول ما يشتغل
    Get.changeThemeMode(theme);
  }

  //--

  final _storage = GetStorage();
  final String _key = 'isDarkMode';

  // getter بيقرأ القيمة المحفوظة من التخزين
  bool get isDarkMode => _storage.read(_key) ?? false;

  // الدالة دي بتغيّر الثيم وتخزنه
  void toggleTheme() {
    bool newThemeIsDark = !isDarkMode;

    // ده اللي فعلياً بيغير الثيم في التطبيق
    Get.changeThemeMode(newThemeIsDark ? ThemeMode.dark : ThemeMode.light);

    // تخزين القيمة الجديدة
    _storage.write(_key, newThemeIsDark);

    update(); // لإعادة بناء الواجهة إذا لزم الأمر
  }

  // getter بيرجع نوع الثيم الحالي على أساس القيمة المخزنة
  ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;
}
