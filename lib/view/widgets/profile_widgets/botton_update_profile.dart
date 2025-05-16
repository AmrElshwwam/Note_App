import 'package:flutter/material.dart';
import 'package:my_notes/controller/profile_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class BottonUpdateProfile extends StatelessWidget {
  const BottonUpdateProfile({super.key, required this.profileController});

  final ProfileControllerImp profileController;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: Border(top: BorderSide(color: AppColors.orange, width: 3)),
      minWidth: double.infinity,
      height: 70,
      onPressed: () {
        profileController.updateProfile();
      },
      // color: AppColors.orange,
      child: Text(
        "Update Profile",
        style: TextStyle(
          fontSize: 18,
          color: AppColors.orange,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
