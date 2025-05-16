import 'package:get/get.dart';
import 'package:my_notes/controller/signup_controller.dart';

String? validInputSignup(String val, int min, int max, String type) {
  SignupControllerImp signupController = Get.find<SignupControllerImp>();

  if (val.isEmpty) return "Can't Be Empty";

  if (val.length < min) return "Can't Be Less Than $min Characters";

  if (val.length > max) return "Can't Be Larger Than $max Characters";

  if (type == "username" && !GetUtils.isUsername(val)) {
    return "Not Valid Username";
  }

  if (type == "email" && !GetUtils.isEmail(val)) {
    return "Not Valid Email";
  }

  if (type == "phone" && !GetUtils.isPhoneNumber(val)) {
    return "Not Valid Phone";
  }

  if (type == "password") {
    if (val.length < 6) return "Password must be at least 6 characters";
  }

  if (type == "confirmpassword") {
    if (val.length < 6) return "Confirm Password must be at least 6 characters";
    if (signupController.password.text != val) {
      return "Password Do Not Match";
    }
  }

  return null;
}

//----------------

// validInputSignin >>


