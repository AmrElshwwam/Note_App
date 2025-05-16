import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_notes/data/models/category_item_model.dart';

abstract class ScrollingCategoryController extends GetxController {
  //
  // int pageCount = 0;
  // void changePageCount();

  //

  //

  List<CategoryItemModel> categoryList = [
    CategoryItemModel(numberCategory: 1, title: "Person"),
    CategoryItemModel(numberCategory: 2, title: "Work"),
    CategoryItemModel(numberCategory: 3, title: "Desgin"),
    CategoryItemModel(numberCategory: 4, title: "Travel"),
    CategoryItemModel(numberCategory: 5, title: "Health"),
  ];

  //--
  // ??? ممكن نستغني عنه بعدين
  int indexCategory = 0;
  void getIndexCategory(int index);

  //--

  //للتحكم ف تحرك الاسكرول عند الدخول من كاتيجري معين حتي يتم الوقوف عليه في صفحة انشاء نوت جديدة تبع نفس الكاتيجري
  final ScrollController scrollController = ScrollController();

  //فانكشن تعمل ع استقبال رقم الكاتيجري الذي تم الضغط عليه
  //وارساله لفانكشن الاسكرول وتحريكه ع الكاتيجري الذي تم الضغط عليه
  toAutoSelectCategory(int indexAutoSelectCategory);

  // فانكشن تعمل ع تحريك الاسكرول ع نوع الكاتيجري المحدد اوتوماتيك عند الدخول من كاتيجري محدد
  void scrollToSelectedCategory(int index);

  void resetCategory();

  //--

  //

  //--
  late int numberCategorySelected;
  // فانكشن لتخزين رقم الكاتيجري ف المخزن - حتي يتم عرض النوت التي بنفس رقم الكاتيجري
  // void getNumberCategorySelected(int indexCategory);

  //-- فانكشن تعمل علي انشاء نوع كاتيجري جديد
  void addCategory(
    int newCategoryNum,
    String titleCategory,
    IconData iconCategory,
  );
}

//----------------------------------------------------------------

class ScrollingCategoryControllerImp extends ScrollingCategoryController {
  //

  //

  @override
  void getIndexCategory(int index) {
    indexCategory = index;

    update();
  }

  //

  // @override
  // void getNumberCategorySelected(int indexCategory) {
  //   numberCategorySelected = indexCategory;
  //   update();
  // }

  //--

  @override
  toAutoSelectCategory(int indexAutoSelectCategory) {
    indexCategory = indexAutoSelectCategory;

    update();
  }

  // فانكشن تعمل ع اختيار نوع الكاتيجري اوتوماتيك عند الدخول من كاتيجري محدد
  @override
  void scrollToSelectedCategory(int index) {
    // Calculate the position of the selected item
    const double itemWidth = 75; // Adjust based on your item width
    final double offset = itemWidth * index;
    // Ensure the offset is within bounds

    // const double itemWidth = 100; // Adjust based on your item width
    // final double maxScrollExtent = scrollController.position.maxScrollExtent;
    // final double calculatedOffset = itemWidth * index;
    // final double offset = calculatedOffset <= maxScrollExtent
    //     ? 100 //calculatedOffset
    //     : 120; //maxScrollExtent;
    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  //---

  // -- فانكشن لاضافه رقم النوت الجديده تلقائيا بالتسلسل
  int get setCategoryNum => categoryList.length + 1;

  //
  //

  @override
  void addCategory(
    int newCategoryNum,
    String titleCategory,
    IconData iconCategory,
  ) {
    categoryList.add(
      CategoryItemModel(numberCategory: newCategoryNum, title: titleCategory),
    );
    update();
    // update();
  }

  @override
  void resetCategory() {
    indexCategory = 0;
    // scrollToSelectedCategory(0);
    update();
  }
}
