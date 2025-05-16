import 'package:get/get.dart';
import 'package:my_notes/controller/category_screen_controller.dart';

class CategoryScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryScreenControllerImp>(
      () => CategoryScreenControllerImp(),
      fenix: true,
    );

  }
}
