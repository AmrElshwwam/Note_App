import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/select_category_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/function/snackbar_helper.dart';
import 'package:my_notes/view/widgets/add_note_widgets/button_add_category.dart';
import 'package:my_notes/view/widgets/add_note_widgets/textfield_add_category.dart';

class ShowModalBottomSheet extends StatelessWidget {
  const ShowModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    String? newCategory;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Create Category",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ),

            //
            //
            const SizedBox(height: 10),

            //
            //
            TextFieldAddCategory(
              hintText: "Type the node title...",
              onChange: (value) {
                newCategory = value;
              },
            ),

            const SizedBox(height: 10),

            ButtonAddCategory(
              nameButton: "Create Category",
              onPressed: () {
                if (newCategory == null || newCategory!.isEmpty) {
                  SnackbarHelper.error("Error", "Please enter a category name");
                }

                //---

                SelectCategoryControllerImp selectCategoryController =
                    Get.find<SelectCategoryControllerImp>();
                selectCategoryController.addCategory(
                  selectCategoryController.setCategoryNum,
                  newCategory!,
                );

                SnackbarHelper.success("Success", "Category added", (
                  status,
                ) async {
                  if (status == SnackbarStatus.CLOSED) {
                    if (Get.isOverlaysOpen) {
                      // لو في snack أو dialog مفتوح، اقفله
                      Get.back(closeOverlays: true);
                    } else {
                      // يرجع للشاشة اللي قبل
                      Get.back();
                    }
                  }
                });
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
