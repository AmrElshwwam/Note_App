import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/search_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/app_theme.dart';
import 'package:my_notes/view/widgets/search_screen_widgets/appbar_search_widget.dart';
import 'package:my_notes/view/widgets/search_screen_widgets/item_note_search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //-- Controller Find
    SearchControllerImp searchController = Get.find<SearchControllerImp>();
    bool isDarkMode = AppThemes.isDarkMode(context);
    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.black : AppColors.white,

      body: Column(
        children: [
          //-- Appbar Searching
          AppbarSearchWidget(searchController: searchController),

          //-- Body screen
          Expanded(
            child: GetBuilder<SearchControllerImp>(
              builder: (context) {
                if (searchController.searchController.text.isEmpty) {
                  return Center(
                    child: Text(
                      "Please Enter Your Search...",
                      style: TextStyle(fontSize: 18, color: AppColors.grey),
                    ),
                  );
                } else if (searchController.searchList.isEmpty) {
                  return Center(
                    child: Text(
                      "No Notes Found !",
                      style: TextStyle(fontSize: 18, color: AppColors.grey),
                    ),
                  );
                } else {
                  return GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: .6,
                        ),
                    itemCount: searchController.searchList.length,
                    itemBuilder: (context, index) {
                      return ItemNoteSearchWidget(
                        noteModel: searchController.searchList[index],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
