import 'package:get/get.dart';
import 'package:my_notes/controller/signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninControllerImp>(() => SigninControllerImp());
  }
}
