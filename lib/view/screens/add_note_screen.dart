import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/add_note_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/app_theme.dart';
import 'package:my_notes/view/widgets/add_note_widgets/appbar_add_note.dart';
import 'package:my_notes/view/widgets/add_note_widgets/button_add_note.dart';
import 'package:my_notes/view/widgets/add_note_widgets/container_add_category.dart';
import 'package:my_notes/view/widgets/add_note_widgets/select_category_scroll.dart';
import 'package:my_notes/view/widgets/add_note_widgets/text_field_description.dart';
import 'package:my_notes/view/widgets/add_note_widgets/text_field_title.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppThemes.isDarkMode(context);
    //-- Controllers
    AddNoteControllerImp addNoteController = Get.find<AddNoteControllerImp>();

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.black : AppColors.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              //
              const AppbarAddNote(),

              //
              Expanded(
                child: Column(
                  children: [
                    //
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Title",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ),

                    //
                    TextFieldTitle(
                      controller: addNoteController.titleController,
                      hintText: "Type the node title...",
                    ),

                    //
                    const SizedBox(height: 10),

                    //
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ),

                    //
                    const SizedBox(height: 10),

                    //
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          //--
                          ContainerAddCategory(),

                          //--
                          SizedBox(width: 10),

                          //--
                          Expanded(child: SelectCategoryWidget()),
                        ],
                      ),
                    ),

                    //
                    const SizedBox(height: 10),

                    //
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ),

                    //--
                    Expanded(
                      child: TextFieldDescription(
                        controller: addNoteController.descriptionController,
                      ),
                    ),
                  ],
                ),
              ),

              //--
              ButtonAddNote(nameButton: "Add Note"),

              //--
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
