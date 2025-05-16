import 'dart:convert';
import 'package:get/get.dart';
import 'package:my_notes/controller/load_notes_controller.dart';
import 'package:my_notes/data/models/note_model.dart';
import 'package:my_notes/data/services/services.dart';

abstract class EditNoteController extends GetxController {
  LoadNotesControllerImp? loadNotesController;

  //
  Future<void> editNote(int index, NewNoteModel updatedNote);
}

//-------------------------------------------------------

class EditNoteControllerImp extends EditNoteController {
  @override
  void onInit() {
    loadNotesController = Get.find<LoadNotesControllerImp>();
    super.onInit();
  }

  //-- Edit Note

  @override
  Future<void> editNote(int index, NewNoteModel updatedNote) async {
    loadNotesController!.notes[index] = updatedNote;
    MyServices myServices = Get.find();
    List<String> notesJson =
        loadNotesController!.notes
            .map((note) => jsonEncode(note.toJson()))
            .toList();
    await myServices.sharedPreferences.setStringList("notes", notesJson);
    loadNotesController!.update();
  }

  
}
