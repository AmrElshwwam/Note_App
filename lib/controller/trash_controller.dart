import 'package:get/get.dart';
import 'package:my_notes/data/models/note_model.dart';

abstract class TrashController extends GetxController {
  //
  //

  List<NewNoteModel> trashNotes = [];

  //
  //

  // void sendInfoNoteToDetails(
  //   String sendInfoTitle,
  //   String sendInfoSubtitle,
  //   int sendIndexNote,
  // );

  //
  //

  // late String getTitle;
  // late String getSubtitle;
  // late int getIndexNote;

  //
  //

  // late DateTime now;
  // late String formattedTime;
  // late String formattedDate;

  //
  //

  // void trashedNote(
  //   String title,
  //   String description,
  //   String timeAdd,
  //   String dateAdd,
  //   int newNumCategory,
  // );

  //
  //

  // void myTime();

  ///////////////////

  //
  //
  // int pageCount = 0;

  // فانكشن تعمل ع استقبال رقم اذا كان 1 يدل ع انه تم الدخول الي تعديل نوت من صفحة الكاتيجري
  // واذا كان 2 يدل ع انه تم الدخول الي تعديل نوت من الصفحة الرئيسيه للعرض شوو أوول
  // void setPageCount(int intPagrCount);

  // int clickAddNote = 0;

  // فانكشن تعمل ع استقبال رقم اذا كان 1 يدل ع انه تم الدخول الي انشاء نوت جديده من الصفحة الرئيسيه
  // واذا كان 2 يدل ع انه تم الدخول الي انشاء نوت جديده من صفحو الكاتيجري
  // void setClickAddNote(int intClickAddNote);
  //
  // addNote(
  //   String title,
  //   String description,
  //   String timeAdd,
  //   String dateAdd,
  //   int newNumCategory,
  // );

  // void myTime();
}

class TrashControllerImp extends TrashController {
  @override
  void onInit() {
    // trashNotes.addAll([
    //   NewNoteModel(
    //     titleNote: "Amro Medhat",
    //     descriptionNote: "17.st Elminyawe",
    //     timeAddNote: "12:30:35",
    //     dateAddNote: "31-7-2024",
    //     categoryNote: 0,
    //   ),
    // ]);
    super.onInit();
  }

  //
  //
  // @override
  // void sendInfoNoteToDetails(
  //   String sendInfoTitle,
  //   String sendInfoSubtitle,
  //   int sendIndexNote,
  // ) {
  //   getTitle = sendInfoTitle;
  //   getSubtitle = sendInfoSubtitle;
  //   getIndexNote = sendIndexNote;
  // }

  //////////////////////////
  // @override
  // void setPageCount(int intPagrCount) {
  //   pageCount = intPagrCount;
  // }

  //
  //
  // @override
  // void setClickAddNote(int intClickAddNote) {
  //   clickAddNote = intClickAddNote;
  // }

  // @override
  // void trashedNote(
  //   String title,
  //   String description,
  //   String timeAdd,
  //   String dateAdd,
  //   int newNumCategory,
  // ) {
  //   trashNotes.add(
  //     NewNoteModel(
  //       titleNote: title,
  //       descriptionNote: description,
  //       timeAddNote: timeAdd,
  //       dateAddNote: dateAdd,
  //       categoryNote: newNumCategory,
  //     ),
  //   );
  // }

  //
  //

  // @override
  // void myTime() {
  //   now = DateTime.now();
  //   formattedTime = "${now.hour}:${now.minute}:${now.second}";
  //   formattedDate = "${now.day}-${now.month}-${now.year}";
  // }

  //

  // مثال على دالة لتحديث الملاحظات
  // void updateNotes() {
  //   // قم هنا بتحديث قائمة الملاحظات أو أي منطق آخر
  //   // على سبيل المثال، يمكنك استخدام update() لإعادة بناء الواجهة
  //   update();
  // }
}
