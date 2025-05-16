import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/scrolling_category_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/app_theme.dart';
import 'package:my_notes/core/constant/strings_routes.dart';
import 'package:my_notes/data/models/note_model.dart';

class ItemNoteHomeWidget extends StatelessWidget {
  final NewNoteModel noteModel;
  const ItemNoteHomeWidget({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    DateTime dt = noteModel.dateTime;
    String dateNote = "${dt.day}-${dt.month}-${dt.year}";
    String timeNote = "${dt.hour}:${dt.minute}";
    bool isDarkMode = AppThemes.isDarkMode(context);

    final scrollingCategoryController =
        Get.find<ScrollingCategoryControllerImp>();
    return InkWell(
      hoverColor: AppColors.background,
      onTap: () {
        Get.toNamed(
          AppRoutes.detailsNote,

          arguments: {"noteModel": noteModel, "screen": "home"},
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color:
                isDarkMode
                    ? const Color.fromARGB(255, 82, 82, 82)
                    : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: .4),
                offset: const Offset(0, 5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                //--
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      noteModel.titleNote,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: isDarkMode ? Colors.white : AppColors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),

                    // Lable Category
                    Text(
                      scrollingCategoryController
                          .categoryList[noteModel.categoryNote]
                          .title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.orange,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),

                //
                //
                Text(
                  noteModel.descriptionNote,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: isDarkMode ? Colors.white : AppColors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),

                //
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      // noteModel.timeAddNote,
                       timeNote,
                      
                      style: TextStyle(
                        fontSize: 13,
                        color: isDarkMode ? Colors.white : AppColors.black,
                      ),
                    ),

                    //--
                    SizedBox(width: 10),

                    //--
                    Text(
                      // noteModel.dateAddNote,
                      dateNote,
                      style: TextStyle(
                        fontSize: 13,
                        color: isDarkMode ? Colors.white : AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
