import 'package:get/get.dart';
import 'package:my_notes/data/services/services.dart';

class NewNoteModel {
  static int _idCounter = 0;
  int id;
  String titleNote;
  String descriptionNote;
  DateTime dateTime;
  // String dateAddNote;
  int categoryNote;

  NewNoteModel({
    required this.titleNote,
    required this.descriptionNote,
    required this.dateTime,
    // required this.dateAddNote,
    required this.categoryNote,
  }) : id = _idCounter++;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleNote': titleNote,
      'descriptionNote': descriptionNote,
      'dateTime': dateTime.toIso8601String(), // يُفضل استخدام iso8601
      // 'dateAddNote': dateAddNote,
      'categoryNote': categoryNote,
    };
  }

  factory NewNoteModel.fromJson(Map<String, dynamic> json) => NewNoteModel(
    titleNote: json['titleNote'],
    descriptionNote: json['descriptionNote'],
    dateTime: DateTime.parse(json['dateTime']), // تأكد من التحويل
    // dateAddNote: json['dateAddNote'],
    categoryNote: json['categoryNote'],
  );

  // دالة لتخزين التعداد في SharedPreferences
  static Future<void> saveLastCounter() async {
    MyServices myServices = Get.find();
    await myServices.sharedPreferences.setInt(
      "note_id_last_counter",
      _idCounter,
    );
  }

  // دالة لتحميل التعداد من SharedPreferences
  static Future<void> loadLastCounter() async {
    MyServices myServices = Get.find();
    _idCounter =
        myServices.sharedPreferences.getInt("note_id_last_counter") ?? 0;
  }
}
