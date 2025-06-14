import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/core/constant/strings_routes.dart';
import 'package:my_notes/core/function/snackbar_helper.dart';
import 'package:my_notes/data/services/services.dart';

abstract class SignupController extends GetxController {
  //--
  GlobalKey<FormState> formKeySignup = GlobalKey<FormState>();

  //--

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;

  signup();
}

//-----------------------

class SignupControllerImp extends SignupController {
  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
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

      myServices.sharedPreferences.setString("FirstName", firstName.text);
      myServices.sharedPreferences.setString("LastName", lastName.text);
      myServices.sharedPreferences.setString("Email", email.text);
      myServices.sharedPreferences.setString("Password", password.text);

      //?? المفروض هنا نعمل اتشيك ان الايميل اتنشئ بيه قبل كده ولا لاء

      SnackbarHelper.success("Congratulations", "Successfully Created Account", (
        status,
      ) async {
        if (status == SnackbarStatus.CLOSED) {
          if (Get.isOverlaysOpen) {
            //لو في snack أو dialog مفتوح، اقفله
            //بيستخدم الـ closeOverlays: true عشان يقفل أي overlays مفتوحة
            Get.back(closeOverlays: true);
            //بيضمن إن الكود اللي بعده (في حالتنا Get.offNamed) يتنفذ بعد ما يتم
            //إغلاق الـ overlay فعليًا في فريم جديد
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Get.offNamed(AppRoutes.signinScreen);
            });
          } else {
            Get.offNamed(AppRoutes.signinScreen);
          }
        }
      });
    }
  }

      @override
      void onClose() {
        firstName.dispose();
        lastName.dispose();
        email.dispose();
        password.dispose();
        confirmPassword.dispose();
        super.onClose();
      }
}
