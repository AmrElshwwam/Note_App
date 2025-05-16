import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/core/constant/strings_routes.dart';
import 'package:my_notes/data/services/services.dart';

abstract class SignupController extends GetxController {
  //--
  GlobalKey<FormState> formKeySignup = GlobalKey<FormState>();

  //--

  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;

  signup();
}

//-----------------------

class SignupControllerImp extends SignupController {
  @override
  void onInit() {
    userName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  signup() {
    var formdata = formKeySignup.currentState;
    if (formdata!.validate()) {
      MyServices myServices = Get.find();

      myServices.sharedPreferences.setString("Email", email.text);
      myServices.sharedPreferences.setString("Password", password.text);

      //?? المفروض هنا نعمل اتشيك ان الايميل اتنشئ بيه قبل كده ولا لاء

      Get.offNamed(AppRoutes.signinScreen);
    }
  }

  @override
  void onClose() {
    userName.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.onClose();
  }
}
