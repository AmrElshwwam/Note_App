import 'package:get/get.dart';
import 'package:my_notes/controller/load_notes_controller.dart';
import 'package:my_notes/controller/scrolling_category_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScrollingCategoryControllerImp>(
      () => ScrollingCategoryControllerImp(),
      fenix: true,
    );

    Get.lazyPut<LoadNotesControllerImp>(() => LoadNotesControllerImp(),fenix: true,);
  }
}
