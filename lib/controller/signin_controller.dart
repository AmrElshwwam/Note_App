import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/strings_routes.dart';
import 'package:my_notes/core/function/snackbar_helper.dart';
import 'package:my_notes/data/services/services.dart';

abstract class SigninController extends GetxController {
  GlobalKey<FormState> formKeySignin = GlobalKey<FormState>();

  login(BuildContext context);

  void showPassword();
}

class SigninControllerImp extends SigninController {
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  late TextEditingController email;
  late TextEditingController password;

  bool? isShowPassword = true;

  @override
  void showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  void login(BuildContext context) {
    var formdata = formKeySignin.currentState;
    if (formdata!.validate()) {
      MyServices myServices = Get.find();

      if (myServices.sharedPreferences.getString("Email") == null ||
          myServices.sharedPreferences.getString("Password") == null) {
        SnackbarHelper.error("No Account Found", "Plaeas Create A New Account");
      } else if (myServices.sharedPreferences.getString("Email") !=
              email.text ||
          myServices.sharedPreferences.getString("Password") != password.text) {
        SnackbarHelper.error("Login Failed", "Invalid Email or Password");
      } else if (myServices.sharedPreferences.getString("Email") ==
              email.text &&
          myServices.sharedPreferences.getString("Password") == password.text) {
        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder:
              (_) => const Center(
                child: CircularProgressIndicator(color: AppColors.orange),
              ),
        );

        Get.offNamed(AppRoutes.masterScreen);
      }

      //
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
