import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/select_category_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/view/widgets/add_note_widgets/button_add_note.dart';
import 'package:my_notes/view/widgets/add_note_widgets/text_field_title.dart';

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
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Create Category",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            //
            //
            const SizedBox(height: 10),

            //
            //
            TextFieldTitle(
              hintText: "Type the node title...",
              onChange: (value) {
                newCategory = value;
              },
            ),

            const SizedBox(height: 10),

            ButtonAddNote(
              nameButton: "Create Category",
              onPressed: () {
                if (newCategory == null || newCategory!.isEmpty) {
                  Get.snackbar(
                    "Error",
                    "Please enter a category name",
                    backgroundColor: AppColors.orange,
                    colorText: AppColors.white,
                    duration: const Duration(seconds: 1),
                  );
                  return;
                }

                //---

                SelectCategoryControllerImp selectCategoryController =
                    Get.find<SelectCategoryControllerImp>();
                selectCategoryController.addCategory(
                  selectCategoryController.setCategoryNum,
                  newCategory!,
                );

                Get.back();
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
