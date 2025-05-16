import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/core/function/snackbar_helper.dart';
import 'package:my_notes/data/services/services.dart';

abstract class ProfileController extends GetxController {
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? emailController;
  TextEditingController? mobileController;

  late String email;
  late String firstName;
  late String lastName;
  late String mobile;

  // String? oldEmail;
  // String? oldFirstName;
  // String? oldLastName;
  // String? oldMobile;
}

class ProfileControllerImp extends ProfileController {
  @override
  void onInit() async {
    MyServices myServices = Get.find();
    // await myServices.sharedPreferences.clear();

    email = myServices.sharedPreferences.getString("Email") ?? "";
    firstName =
        myServices.sharedPreferences.getString("FirstName") ??
        ""; // تعيين قيمة افتراضية
    lastName =
        myServices.sharedPreferences.getString("LastName") ??
        ""; // تعيين قيمة افتراضية
    mobile = myServices.sharedPreferences.getString("Mobile") ?? "";

    emailController = TextEditingController(text: email);
    firstNameController = TextEditingController(text: firstName);
    lastNameController = TextEditingController(text: lastName);
    mobileController = TextEditingController(text: mobile);

    super.onInit();
  }

  void updateProfile() {
    if (firstNameController!.text.isEmpty) {
      SnackbarHelper.error("Error", "First name cannot be empty");
      return;
    }
    if (lastNameController!.text.isEmpty) {
      SnackbarHelper.error("Error", "Last name cannot be empty");
      return;
    }
    if (emailController!.text.isEmpty) {
      SnackbarHelper.error("Error", "Email cannot be empty");
      return;
    }
    if (mobileController!.text.isEmpty) {
      SnackbarHelper.error("Error", "Mobile Number cannot be empty");
      return;
    }
    email = emailController!.text;
    firstName = firstNameController!.text;
    lastName = lastNameController!.text;
    mobile = mobileController!.text;

    // Save to SharedPreferences
    MyServices myServices = Get.find();
    myServices.sharedPreferences.setString("Email", email);
    myServices.sharedPreferences.setString("FirstName", firstName);
    myServices.sharedPreferences.setString("LastName", lastName);
    myServices.sharedPreferences.setString("Mobile", mobile);

    update();

    SnackbarHelper.success(
      "Saved",
      "Profile data updated successfully",
      (status) {},
    );

    // showSnackbar(title: "Saved", message: "Profile data updated successfully");
  }
}
