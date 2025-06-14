import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/load_notes_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/view/widgets/home_widgets/item_note_home_widget.dart';

class ScrollLastNotes extends StatelessWidget {
  const ScrollLastNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<LoadNotesControllerImp>(
            builder: (controller) {
              if (controller.notes.isEmpty) {
                return Center(
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
              return Column(
                children: [
                  ...controller.notes.map((note) {
                    return ItemNoteHomeWidget(noteModel: note);
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
