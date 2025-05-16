import 'package:get/get.dart';
import 'package:my_notes/controller/home_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeControllerImp>(HomeControllerImp(), permanent: true);
  }
}
