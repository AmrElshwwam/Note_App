import 'package:get/get.dart';
import 'package:my_notes/controller/drawer_controller.dart';

class DrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrawerControllerImp>(() => DrawerControllerImp());
  }
}
