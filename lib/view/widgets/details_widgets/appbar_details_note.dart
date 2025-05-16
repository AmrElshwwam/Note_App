import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/details_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/function/snackbar_helper.dart';
import 'package:my_notes/view/widgets/search_screen_widgets/icon_button_widget.dart';

class AppbarDetailsNote extends StatelessWidget {
  const AppbarDetailsNote({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsControllerImp detailsController = Get.find<DetailsControllerImp>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: AppColors.orange,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButtonWidget(
            iconButton: Icons.keyboard_arrow_left,
            onPressed: () {
              Get.back();
            },
          ),

          //
          Row(
            children: [
              IconButton(
                hoverColor: Colors.black.withValues(alpha: .1),
                iconSize: 30,
                color: AppColors.white,
                icon: const Icon(Icons.save),
                onPressed: () {
                  detailsController.editNote();

                  Get.back();

                  SnackbarHelper.success(
                    "Note Edited",
                    "The note has been successfully updated.",
                    (status) async {
                      // if (status == SnackbarStatus.CLOSED) {
                      //   // await Future.delayed(const Duration(milliseconds: 300));
                      //   if (Get.isOverlaysOpen) {
                      //     // لو في snack أو dialog مفتوح، اقفله
                      //     Get.back(closeOverlays: true);
                      //   } else {
                      //     // يرجع للشاشة اللي قبل
                      //     Get.back();
                      //   }
                      // }
                    },
                  );
                },
              ),

              //--
              PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.white,
                  size: 30,
                ),

                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'Delete',
                      child: const Text('Delete'),
                      onTap: () {
                        detailsController.deleteNote();

                        Get.back();

                        SnackbarHelper.success(
                          "Note Deleted",
                          "The note has been successfully deleted.",
                          (status) async {
                            // if (status == SnackbarStatus.CLOSED) {
                            //   // await Future.delayed(const Duration(milliseconds: 300));
                            //   if (Get.isOverlaysOpen) {
                            //     // لو في snack أو dialog مفتوح، اقفله
                            //     Get.back(closeOverlays: true);
                            //   } else {
                            //     // يرجع للشاشة اللي قبل
                            //     Get.back();
                            //   }
                            // }
                          },
                        );
                      },
                    ),
                  ];
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
