import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/app_theme.dart';
import 'package:my_notes/core/constant/strings_routes.dart';
import 'package:my_notes/view/widgets/drawer_widgets/drawer_widget.dart';
import 'package:my_notes/view/widgets/home_widgets/appbar_home.dart';
import 'package:my_notes/view/widgets/home_widgets/floating_button.dart';
import 'package:my_notes/view/widgets/home_widgets/row_last_notes.dart';
import 'package:my_notes/view/widgets/home_widgets/scroll_category_items.dart';
import 'package:my_notes/view/widgets/home_widgets/scroll_last_notes.dart';
import 'package:my_notes/view/widgets/home_widgets/search_filed_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppThemes.isDarkMode(context);
    return SafeArea(
      bottom: false,
      child: Scaffold(
        drawer: const DrawerWidget(),
        backgroundColor:
            Theme.of(
              context,
            ).scaffoldBackgroundColor, // استخدم لون الخلفية من الثيم// Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingButton(
          onPressed: () {
            Get.toNamed(
              AppRoutes.addNoteScreen,
              parameters: {"whatsScreen": "home"},
            );
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        isDarkMode
                            ? AppColors.grey.withValues(alpha: .7)
                            : AppColors.orange.withValues(alpha: .7),
                    offset: const Offset(0, 10),
                    blurRadius: 15,
                    spreadRadius: -2,
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //
                    AppbarHome(),

                    //
                    SizedBox(height: 20),

                    //
                    SearchFieldWidget(),
                  ],
                ),
              ),
            ),

            //
            const SizedBox(height: 5),

            //
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Category".tr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                ),
              ),
            ),

            //
            const ScrollCategoryItems(),

            //
            const SizedBox(height: 5),

            //
            const RowLastNotes(),

            //
            const SizedBox(height: 5),

            //
            const ScrollLastNotes(),

            //
          ],
        ),
      ),
    );
  }
}
