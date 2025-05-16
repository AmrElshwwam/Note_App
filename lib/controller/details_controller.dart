import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/category_screen_controller.dart';
import 'package:my_notes/controller/delete_note_controller.dart';
import 'package:my_notes/controller/edit_note_controller.dart';
import 'package:my_notes/controller/load_notes_controller.dart';
import 'package:my_notes/controller/search_controller.dart';
import 'package:my_notes/data/models/note_model.dart';

abstract class DetailsController extends GetxController {
  //--
  int? idNote;
  String? titleNote;
  String? descriptionNote;
  String? timeNote;
  String? dateNote;
  int? categoryNote;

  // -- ده المخزن اللي هنستقبل فيه موديل النوت من الارجيومينت اللي هنعدل عليه
  NewNoteModel? noteModel;

  // -- ده المخزن اللي هنستقبل فيه نوع الشاشه اللي جاي منها من الارجيومينت اللي هنعدل فيها
  // يعني جاي من صفحة الكاتيجري ولا الصفحه الرئيسية
  String? whatScreen;

  //-- New Data Note
  String? newTitleNote;
  String? newDescriptionNote;

  //--

  TextEditingController? titleNoteController;

  TextEditingController? descriptionNoteController;

  void editNote();

  LoadNotesControllerImp? loadNotesController;

  EditNoteControllerImp? editNoteController;

  DeleteNoteControllerImp? deleteNoteController;

  void deleteNote();
}

//........................

class DetailsControllerImp extends DetailsController {
  //--
  // NoteControllerImp noteController = Get.find<NoteControllerImp>();

  @override
  void onInit() {
    final args = Get.arguments as Map;

    noteModel = args["noteModel"];
    whatScreen = args["screen"];

    idNote = noteModel?.id;
    titleNote = noteModel?.titleNote;
    descriptionNote = noteModel?.descriptionNote;

    timeNote = noteModel?.dateTime.toIso8601String();
    // dateNote = noteModel?.dateAddNote;
    categoryNote = noteModel?.categoryNote;

    titleNoteController = TextEditingController(text: titleNote);
    descriptionNoteController = TextEditingController(text: descriptionNote);

    loadNotesController = Get.find<LoadNotesControllerImp>();
    editNoteController = Get.find<EditNoteControllerImp>();
    deleteNoteController = Get.find<DeleteNoteControllerImp>();

    super.onInit();
  }

  //--

  @override
  void editNote() {
    //-----
    final noteIndex = loadNotesController!.notes.indexWhere(
      (note) => note.id == idNote,
    );

    DateTime dateTimeEditNow = DateTime.now();

    if (noteIndex != -1) {
      editNoteController!.editNote(
        noteIndex,
        NewNoteModel(
          titleNote: titleNoteController!.text,
          descriptionNote: descriptionNoteController!.text,
          dateTime: dateTimeEditNow,
          // dateAddNote: dateNote!,
          categoryNote: categoryNote!,
        ),
      );
      if (whatScreen == "category") {
        CategoryScreenControllerImp categoryController =
            Get.find<CategoryScreenControllerImp>();

        categoryController.filterNotes();
      }

      if (whatScreen == "search") {
        SearchControllerImp searchController = Get.find<SearchControllerImp>();

        searchController.searchNotes(searchController.searchController.text);
      }
    }
  }

  //---
  // فانكشن تعمل علي حذف النوت من الصفحه الرئيسيه
  @override
  void deleteNote() {
    //-----
    final noteIndex = loadNotesController!.notes.indexWhere(
      (note) => note.id == idNote,
    );

    if (noteIndex != -1) {
      deleteNoteController!.deleteNote(noteIndex);

      if (whatScreen == "category") {
        CategoryScreenControllerImp categoryController =
            Get.find<CategoryScreenControllerImp>();

        categoryController.filterNotes();
      }

      if (whatScreen == "search") {
        SearchControllerImp searchController = Get.find<SearchControllerImp>();

        searchController.searchNotes(searchController.searchController.text);
      }
    }
  }

  @override
  void onClose() {
    titleNoteController!.dispose();
    descriptionNoteController!.dispose();
    super.onClose();
  }
}
