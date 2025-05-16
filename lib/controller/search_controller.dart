import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/load_notes_controller.dart';
import 'package:my_notes/data/models/note_model.dart';

abstract class SearchController extends GetxController {
  late LoadNotesControllerImp loadNotesController;
  // late EditNoteControllerImp editNoteController;
  // DeleteNoteControllerImp? deleteNoteController;

  late TextEditingController searchController;

  List<NewNoteModel> searchList = [];

  void searchNotes(String query);
}

//.................

class SearchControllerImp extends SearchController {
  @override
  void onInit() {
    loadNotesController = Get.find<LoadNotesControllerImp>();
    searchController = TextEditingController();

    super.onInit();
  }

  @override
  void searchNotes(String query) {
    searchList =
        loadNotesController.notes
            .where(
              (note) =>
                  note.titleNote.toLowerCase().contains(query.toLowerCase()),
              //  ||
              // note.descriptionNote.toLowerCase().contains(
              //   query.toLowerCase(),
              // ),
            )
            .toList();
    update();
  }

  //
}
