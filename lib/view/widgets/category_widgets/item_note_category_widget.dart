import 'package:flutter/material.dart';
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
    bool isDarkMode = AppThemes.isDarkMode(context);

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
            // BoxShadow(
            //   color: Colors.grey.withValues(alpha: .4),
            //   offset: const Offset(-1, -1),
            //   blurRadius: 5,
            // ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                noteModel.titleNote, // "Amro Medhat Emam",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? AppColors.white : Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),

              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(color: Colors.grey, height: .5),
              ),

              //
              Text(
                noteModel.descriptionNote, //"17.st Elminyawee - Elshrabya",
                style: TextStyle(
                  color: isDarkMode ? AppColors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
