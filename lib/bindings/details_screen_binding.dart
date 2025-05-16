import 'package:get/get.dart';
import 'package:my_notes/controller/delete_note_controller.dart';
import 'package:my_notes/controller/details_controller.dart';
import 'package:my_notes/controller/edit_note_controller.dart';

class DetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsControllerImp>(() => DetailsControllerImp());

    Get.lazyPut<EditNoteControllerImp>(() => EditNoteControllerImp());

    Get.lazyPut<DeleteNoteControllerImp>(() => DeleteNoteControllerImp());

    
  }
}
