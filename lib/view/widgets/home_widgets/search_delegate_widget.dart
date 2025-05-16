// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:my_notes/core/constant/app_colors.dart';
// import 'package:my_notes/core/constant/strings_routes.dart';
// import 'package:my_notes/data/models/note_model.dart';
// import 'package:my_notes/view/widgets/home_widgets/item_note_home_widget.dart';

// class SearchDelegateWidget extends SearchDelegate {
//   //
//   final List<NewNoteModel> notes;

//   SearchDelegateWidget({required this.notes});

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     return Theme.of(context).copyWith(
//       appBarTheme: const AppBarTheme(
//         color: AppColors.orange, // لون الـ AppBar
//         iconTheme: IconThemeData(color: Colors.white), // لون الأيقونات
//       ),

//       //
//       //
//       textSelectionTheme: TextSelectionThemeData(
//         selectionColor: Colors.black.withValues(alpha: .5), //لون السيليكشن
//         cursorColor: Colors.black, // لون المؤشر
//       ),

//       //
//       //
//       textTheme: const TextTheme(
//         titleLarge: TextStyle(color: Colors.black, fontSize: 18),
//       ),

//       //
//       //
//       inputDecorationTheme: InputDecorationTheme(
//         contentPadding: EdgeInsets.all(10),
//         filled: true,
//         fillColor: Colors.white.withValues(alpha: .5),

//         hintStyle: TextStyle(
//           color: Colors.black.withValues(alpha: .5),
//         ), // لون النص داخل حقل البحث

//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide.none,
//         ),

//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide.none,
//         ),

//         border: InputBorder.none,
//       ),
//     );
//   }

//   //-----------------

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       // Padding(
//       //   padding: const EdgeInsets.only(right: 0),
//       //   child: IconButton(
//       //     iconSize: 30,
//       //     style: const ButtonStyle(
//       //       side: WidgetStatePropertyAll(
//       //         BorderSide(color: AppColors.white, width: 2),
//       //       ),
//       //     ),
//       //     onPressed: () {
//       //       query = "";
//       //     },
//       //     icon: const Icon(
//       //       Icons.clear,
//       //       color: AppColors.white,
//       //       // size: 30,
//       //     ),
//       //   ),
//       // ),
//     ];
//   }

//   //-----------------

//   @override
//   Widget? buildLeading(BuildContext context) {
//     // return IconButton(
//     //   iconSize: 30,
//     //   style: const ButtonStyle(
//     //     side: WidgetStatePropertyAll(
//     //       BorderSide(color: AppColors.white, width: 2),
//     //     ),
//     //   ),
//     //   onPressed: () {
//     //     close(context, null);
//     //   },
//     //   icon: const Icon(
//     //     Icons.keyboard_arrow_left,
//     //     color: AppColors.white,
//     //     // size: 30,
//     //   ),
//     // );
//   }

//   //-----------------

//   @override
//   Widget buildResults(BuildContext context) {
//     return const Text("asdasdas");
//   }

//   //-----------------

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final filterSugg =
//         notes
//             .where(
//               (note) =>
//                   note.titleNote.toLowerCase().contains(query.toLowerCase()),
//             )
//             .toList();

//     if (query == "") {
//       return Center(
//         child: Text(
//           "Please Editing Your Search",
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.black.withValues(alpha: .5),
//           ),
//         ),
//       );
//     } else {
//       return Padding(
//         padding: const EdgeInsets.all(10),
//         child: ListView.builder(
//           itemCount: filterSugg.length,
//           itemBuilder: (context, i) {
//             return InkWell(
//               hoverColor: AppColors.background,
//               onTap: () {
//                 Get.toNamed(AppRoutes.detailsNote);
//               },
//               child: Column(
//                 children:
//                     filterSugg.map((note) {
//                       return ItemNoteHomeWidget(noteModel: note);
//                     }).toList(),
//               ),
//             );
//           },
//         ),
//       );
//     }
//   }
// }
