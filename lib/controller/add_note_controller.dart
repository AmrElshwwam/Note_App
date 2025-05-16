import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/category_screen_controller.dart';
import 'package:my_notes/controller/load_notes_controller.dart';
import 'package:my_notes/data/models/note_model.dart';
import 'package:my_notes/data/services/services.dart';

abstract class AddNoteController extends GetxController {
  LoadNotesControllerImp? loadNotesController;

  // مخزن لتخزين نوع الشاشه الذي سيتم انشاء نوت جديدة فيه
  String? whatsScreen;

  //
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> addNote(String title, String description, int category);
}

//.......................

class AddNoteControllerImp extends AddNoteController {
  @override
  void onInit() {
    loadNotesController = Get.find<LoadNotesControllerImp>();
    whatsScreen = Get.parameters["whatsScreen"];

    super.onInit();
  }

  //--

  //-- add note
  @override
  Future<void> addNote(String title, String description, int category) async {
    await NewNoteModel.loadLastCounter();

    DateTime dateTimeAddNow = DateTime.now();

    NewNoteModel newNote = NewNoteModel(
      titleNote: title,
      descriptionNote: description,
      dateTime: dateTimeAddNow,
      // dateAddNote: dateNow,
      categoryNote: category,
    );

    loadNotesController!.notes.add(newNote);

    MyServices myServices = Get.find();

    List<String> notesJson =
        loadNotesController!.notes
            .map((note) => jsonEncode(note.toJson()))
            .toList();

    await myServices.sharedPreferences.setStringList("notes", notesJson);

    await NewNoteModel.saveLastCounter();

    titleController.clear();
    descriptionController.clear();

    loadNotesController!.loadNotes();

    if (whatsScreen == "category") {
      CategoryScreenControllerImp categoryController =
          Get.find<CategoryScreenControllerImp>();

      categoryController.filterNotes();
    }
  }



  //--

  
    @override
    void onClose() {
      titleController.dispose();
      descriptionController.dispose();
      super.onClose();
    }
}
