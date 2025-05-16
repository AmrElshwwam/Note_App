import 'package:get/get.dart';
import 'package:my_notes/controller/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchControllerImp>(() => SearchControllerImp());
  }
}
