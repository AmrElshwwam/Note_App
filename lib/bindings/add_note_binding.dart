import 'package:get/get.dart';
import 'package:my_notes/controller/add_note_controller.dart';

class AddNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNoteControllerImp>(() => AddNoteControllerImp());
  }
}
