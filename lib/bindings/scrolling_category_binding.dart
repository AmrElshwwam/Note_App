import 'package:get/get.dart';
import 'package:my_notes/controller/scrolling_category_controller.dart';

class ScrollingCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScrollingCategoryControllerImp>(
      () => ScrollingCategoryControllerImp(),
    );
  }
}
