import 'package:get/get.dart';
import 'package:my_notes/controller/load_notes_controller.dart';
import 'package:my_notes/data/models/note_model.dart';

abstract class CategoryScreenController extends GetxController {
  //--

  late LoadNotesControllerImp loadNotesController;

  // -- مخزن لتخزين رقم الكاتيجري المختار عن طريق الارجيومنت حتي يتم عرض النوتس التي بنفس الرقم
  int? indexCategory;

  // -- مخزن لتخزين النوت التي تم فلترتها حسب رقم الكاتيجري

  List<NewNoteModel> notesCategory = [];

  // --
  void filterNotes();
}

//----------------------------

class CategoryScreenControllerImp extends CategoryScreenController {
  @override
  void onInit() {
    loadNotesController = Get.find<LoadNotesControllerImp>();

    indexCategory = int.tryParse(Get.parameters["categoryIndex"] ?? '0') ?? 0;

    filterNotes();

    // print("indexCategory: $indexCategory");

    super.onInit();
  }

  // --
  // فانكشن تعمل علي فلترة اللنوت وعرض النوت الذي تتبع لرقم الكاتيجري الذي تم الضغط عليها
  @override
  void filterNotes() {
    // Ensure indexCategoryHome is initialized
    notesCategory =
        loadNotesController.notes
            .where((note) => note.categoryNote == indexCategory)
            .toList();

    update();
  }
}
