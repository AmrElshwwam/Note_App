import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class SnackbarHelper {
  static void success(
    String title,
    String message,
    void Function(SnackbarStatus?)? snackbarStatus,
  ) {
    _show(
      title,
      message,
      backgroundColor: AppColors.orange,
      icon: Icons.check_circle_outline,
      snackbarStatus: snackbarStatus,
    );
  }

  static void error(String title, String message) {
    _show(
      title,
      message,
      backgroundColor: const Color.fromARGB(255, 243, 33, 18),
      icon: Icons.error_outline,
    );
  }

  static void warning(String title, String message) {
    _show(
      title,
      message,
      backgroundColor: Colors.yellow,
      icon: Icons.warning_amber_outlined,
    );
  }

  static void _show(
    String title,
    String message, {
    required Color backgroundColor,
    required IconData icon,
    Function(SnackbarStatus?)? snackbarStatus,
    // required bool autoBack,
  }) {
    Get.snackbar(
      title,
      message,
      icon: Icon(icon, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      duration: const Duration(milliseconds: 1300),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      snackbarStatus: snackbarStatus,

      // (status) {
      //   if (status == SnackbarStatus.CLOSED && autoBack) {
      //     Get.back();
      //   }
      // },
    );
  }
}
