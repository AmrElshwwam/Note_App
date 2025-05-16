import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_notes/data/models/note_model.dart';
import 'package:my_notes/data/services/services.dart';

abstract class LoadNotesController extends GetxController {
  List<NewNoteModel> notes = [];

  //
  Future<void> loadNotes();
}

//................

class LoadNotesControllerImp extends LoadNotesController {
  @override
  void onInit() {
    loadNotes();
    super.onInit();
  }

  //--

  @override
  Future<void> loadNotes() async {
    try {
      MyServices myServices = Get.find();
      List<String>? notesJson = myServices.sharedPreferences.getStringList(
        "notes",
      );

      if (notesJson != null) {
        notes =
            notesJson
                .map((note) => NewNoteModel.fromJson(jsonDecode(note)))
                .toList();

        notes.sort((a, b) => b.dateTime.compareTo(a.dateTime));
      } else {
        notes = [];
      }

      update();
    } catch (e) {
      print("Error loading notes: $e");
    }
  }
}
