import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/load_notes_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/app_theme.dart';
import 'package:my_notes/core/constant/strings_routes.dart';
import 'package:my_notes/view/widgets/category_widgets/item_note_category_widget.dart';
import 'package:my_notes/view/widgets/show_all_notes_widgets/appbar_show_all.dart';

class ShowAllNotesScreen extends StatelessWidget {
  const ShowAllNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppThemes.isDarkMode(context);
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: isDarkMode ? AppColors.black : AppColors.white,
        body: Column(
          children: [
            //
            //
            const AppbarShowAll(),

            //
            //
            Expanded(
              child: GetBuilder<LoadNotesControllerImp>(
                builder: (controller) {
                  if (controller.notes.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Notes Available !",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey,
                        ),
                      ),
                    );
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: .6,
                        ),
                    itemCount: controller.notes.length,
                    itemBuilder: (context, index) {
                      return ItemNoteCategoryWidget(
                        noteModel: controller.notes[index],
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.detailsNote,
                            arguments: {
                              "noteModel": controller.notes[index],
                              "screen": "home",
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
