import 'package:get/get.dart';
import 'package:my_notes/controller/select_category_controller.dart';

class SelectCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectCategoryControllerImp>(
      () => SelectCategoryControllerImp(),
    );
  }
}
