import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/add_note_controller.dart';
import 'package:my_notes/controller/select_category_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';

import '../../../core/function/snackbar_helper.dart';

class ButtonAddNote extends StatelessWidget {
  const ButtonAddNote({super.key, required this.nameButton});

  final String nameButton;

  @override
  Widget build(BuildContext context) {
    AddNoteControllerImp addNoteController = Get.find<AddNoteControllerImp>();

    SelectCategoryControllerImp selectCategoryController =
        Get.find<SelectCategoryControllerImp>();

    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      minWidth: double.infinity,
      height: 60,
      onPressed: () async {
        if (addNoteController.titleController.text.isEmpty ||
            addNoteController.descriptionController.text.isEmpty) {
          SnackbarHelper.error(
            "Error",
            "Please enter a title and description Note!!",
          );
          return;
        }

        addNoteController.addNote(
          addNoteController.titleController.text,
          addNoteController.descriptionController.text,
          selectCategoryController.indexSelectedCategory,
        );

        Get.back();

        SnackbarHelper.success("Success", "Note added!", (status) async {
          // if (status == SnackbarStatus.CLOSED) {
          //   if (Get.isOverlaysOpen) {
          //     // لو في snack أو dialog مفتوح، اقفله
          //     Get.back(closeOverlays: true);
          //   } else {
          //     // يرجع للشاشة اللي قبل
          //     Get.back();
          //   }
          // }
        });
      },
      color: AppColors.orange,
      child: Text(
        nameButton,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
      ),
    );
  }
}
