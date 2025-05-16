import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/drawer_controller.dart';
import 'package:my_notes/controller/trash_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/strings_routes.dart';
import 'package:my_notes/view/widgets/category_widgets/item_note_category_widget.dart';
import 'package:my_notes/view/widgets/drawer_widgets/appbar_drawer_screens.dart';

class TrashScreen extends StatelessWidget {
  const TrashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerControllerImp drawerController = Get.find<DrawerControllerImp>();

    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            //
            //
            AppbarDrawerScreens(
              onPressedBack: () {
                drawerController.selectedItemDrawer(0);
                Get.delete<TrashControllerImp>();
              },
            ),

            //
            //
            Expanded(
              child: GetBuilder<TrashControllerImp>(
                init: TrashControllerImp(),
                builder: (trashController) {
                  // اذا كان لا يوجد نوت ف هذا التصنيف يتم عرض الرساله
                  if (trashController.trashNotes.isEmpty) {
                    return const Center(
                      child: Text(
                        'No notes available in this trash',
                        style: TextStyle(fontSize: 18, color: AppColors.grey),
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
                    itemCount: trashController.trashNotes.length,
                    itemBuilder: (context, index) {
                      return ItemNoteCategoryWidget(
                        noteModel: trashController.trashNotes[index],
                        onTap: () {
                          // trashController.sendInfoNoteToDetails(
                          //   trashController.trashNotes[index].titleNote,
                          //   trashController.trashNotes[index].descriptionNote,
                          //   index,
                          // );

                          //
                          //
                          Get.toNamed(
                            AppRoutes.detailsNote,
                            // arguments: {
                            //   "title": homeScreenController.notes[index].title,
                            //   "subtitle":
                            //       homeScreenController.notes[index].subtitle,
                            //   "indexNote": index,
                            // },
                          );
                        },
                        // titleBoxScroll: trashController.trashNotes[index].titleNote,
                        // subtitleBoxScroll:
                        //     trashController.trashNotes[index].descriptionNote,
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
