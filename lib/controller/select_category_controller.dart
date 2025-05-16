import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/scrolling_category_controller.dart';
import 'package:my_notes/data/models/category_item_model.dart';

abstract class SelectCategoryController extends GetxController {
  //--
  // فانكشن لتخزين رقم الكاتيجري الذي تم اختيارة ف صفحة انشاء نوت جديده
  int indexSelectedCategory = 0;
  void getIndexSelectCategory(int index);

  //للتحكم ف تحرك الاسكرول عند الدخول من كاتيجري معين حتي يتم الوقوف عليه في صفحة انشاء نوت جديدة تبع نفس الكاتيجري
  final ScrollController scrollController = ScrollController();

  void automaticScrollingCategory();

  //-- فانكشن تعمل علي انشاء نوع كاتيجري جديد
  void addCategory(int newCategoryNum, String titleCategory);
}

//----------------------------------------------------------------

class SelectCategoryControllerImp extends SelectCategoryController {
  //--

  @override
  void getIndexSelectCategory(int index) {
    indexSelectedCategory = index;
    update();
    automaticScrollingCategory();
  }

  //

  ScrollingCategoryControllerImp scrollingController =
      Get.find<ScrollingCategoryControllerImp>();

  @override
  void automaticScrollingCategory() {
    // Calculate the position of the selected item
    const double itemWidth = 80; // Adjust based on your item width
    final double offset = itemWidth * indexSelectedCategory;

    scrollingController.scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  //---

  // -- فانكشن لاضافه رقم النوت الجديده تلقائيا بالتسلسل
  int get setCategoryNum => scrollingController.categoryList.length + 1;

  //
  //

  @override
  void addCategory(int newCategoryNum, String titleCategory) {
    scrollingController.categoryList.add(
      CategoryItemModel(numberCategory: newCategoryNum, title: titleCategory),
    );
    scrollingController.update();
  }
}
