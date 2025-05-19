import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "ar": {
      //Drawer Items
      "Home": "الرئيسية",
      "Profile": "الملف الشخصي",
      "archives": "الأرشيف",
      "Trash": "سلة المحذوفات",
      "Settings": "الإعدادات",

      // Home Screen
      "Hello": "مرحباً !",
      "Search": "بحث عن ملاحظة...",
      "Category" : "الفئة",
      "Last Notes" : "آخر الملاحظات",
      "Show All" : "عرض الكل",

      //
      "1": "الإعدادات",
      "2": "اللغة",
      "3": "اختر اللغة المفضلة لديك",
      "4": "العربية",
      "5": "الإنجليزية",
      "6": "الوضع العام",
      "7": "تشغيل الوضع الداكن",
      "8": "تنزيل",
      "9": "تنزيل ملفات من الانترنت",
      "10": "تحميل",
      "11": "تحميل ملفات الي الانترنت",
    },

    //----- English Language
    "en": {
      //Drawer Items
      "Home": "Home",
      "Profile": "Profile",
      "Archives": "Archives",
      "Trash": "Trash",
      "Settings": "Settings",

      // Home Screen
      "Hello": "Hello !",
      "Search": "Searching For Note...",

      //
      "1": "Settings",
      "2": "Language",
      "3": "Choose Language For Your Favorite",
      "4": "ِArabic",
      "5": "English",
      "6": "Mode",
      "7": "Turn On Dark Mode",
      "8": "Download",
      "9": "Download Files From The Internet",
      "10": "Upload",
      "11": "Upload File To The Internet",
    },
  };
}
