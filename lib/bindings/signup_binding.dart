import 'package:get/get.dart';
import 'package:my_notes/controller/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupControllerImp>(() => SignupControllerImp());
  }
}
