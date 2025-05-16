import 'dart:convert';
import 'package:get/get.dart';
import 'package:my_notes/controller/load_notes_controller.dart';
import 'package:my_notes/data/services/services.dart';

abstract class DeleteNoteController extends GetxController {
  LoadNotesControllerImp? loadNotesController;

  //
  Future<void> deleteNote(int index);
}

//-------------------------------------------------------

class DeleteNoteControllerImp extends DeleteNoteController {
  @override
  void onInit() {
    loadNotesController = Get.find<LoadNotesControllerImp>();
    super.onInit();
  }

  //-- Edit Note

  @override
  Future<void> deleteNote(int index) async {
    loadNotesController!.notes.removeAt(index);
    MyServices myServices = Get.find();
    List<String> notesJson =
        loadNotesController!.notes
            .map((note) => jsonEncode(note.toJson()))
            .toList();
    await myServices.sharedPreferences.setStringList("notes", notesJson);
    loadNotesController!.update();
  }
}
