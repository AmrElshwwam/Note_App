import 'package:get/get.dart';
import 'package:my_notes/controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<HomeControllerImp>(HomeControllerImp(), permanent: true);

    Get.put<ProfileControllerImp>(ProfileControllerImp(), permanent: true);
  }
}
