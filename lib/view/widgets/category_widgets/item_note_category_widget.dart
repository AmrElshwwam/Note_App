import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_notes/controller/scrolling_category_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/app_theme.dart';
import 'package:my_notes/data/models/note_model.dart';

class ItemNoteCategoryWidget extends StatelessWidget {
  const ItemNoteCategoryWidget({
    super.key,
    required this.noteModel,
    required this.onTap,
  });

  final NewNoteModel noteModel;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    DateTime dt = noteModel.dateTime;
    String dateNote = "${dt.day}-${dt.month}-${dt.year}";
    String timeNote = DateFormat(
      'hh:mm a',
    ).format(dt); 

    bool isDarkMode = AppThemes.isDarkMode(context);

    final scrollingCategoryController =
        Get.find<ScrollingCategoryControllerImp>();

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.grey2 : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: .4),
              offset: const Offset(0, 5),
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      noteModel.titleNote, // Title Note,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: isDarkMode ? AppColors.white : Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),

                  //--
                  SizedBox(width: 5),

                  //--
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(color: Colors.grey, height: .5),
              ),

              //
              Expanded(
                child: Text(
                  noteModel.descriptionNote, // Description Note,
                  style: TextStyle(
                    color: isDarkMode ? AppColors.white : Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 9,
                ),
              ),

              //-- Date & Time Note
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //--
                  Text(
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
    );
  }
}
