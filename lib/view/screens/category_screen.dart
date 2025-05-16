import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/category_screen_controller.dart';
import 'package:my_notes/core/constant/app_theme.dart';
import 'package:my_notes/core/constant/strings_routes.dart';
import 'package:my_notes/view/widgets/category_widgets/appbar_category.dart';
import 'package:my_notes/view/widgets/home_widgets/floating_button.dart';
import 'package:my_notes/view/widgets/category_widgets/item_note_category_widget.dart';
import '../../core/constant/app_colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppThemes.isDarkMode(context);

    String? appbarCategoryName = Get.parameters['categoryName'] ?? "";

    return SafeArea(
      bottom: false,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingButton(
          onPressed: () {
            Get.toNamed(
              AppRoutes.addNoteScreen,
              parameters: {
                'categoryName': appbarCategoryName,
                "whatsScreen": "category",
              },
            );

            //--
          },
        ),
        backgroundColor: isDarkMode ? AppColors.black : Colors.white,
        body: Column(
          children: [
            AppbarCategory(titleAppBar: appbarCategoryName),

            //
            //
            Expanded(
              child: GetBuilder<CategoryScreenControllerImp>(
                builder: (controller) {
                  // اذا كان لا يوجد نوت ف هذا التصنيف يتم عرض الرساله
                  if (controller.notesCategory.isEmpty) {
                    return const Center(
                      child: Text(
                        'No notes available in this category !',
                        style: TextStyle(fontSize: 18, color: AppColors.grey),
                      ),
                    );
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: .6,
                        ),
                    itemCount: controller.notesCategory.length,
                    itemBuilder: (context, index) {
                      return ItemNoteCategoryWidget(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.detailsNote,

                            //-- بستخدمه علشان ابعت لصفحة التفاصيل بيانات النوت اللي هنعدل عليه
                            arguments: {
                              "noteModel": controller.notesCategory[index],
                              "screen": "category",
                            },
                          );
                        },
                        // بستخدمه جوة الويدجت علشان يظهر جواه البيانات للنوت
                        noteModel: controller.notesCategory[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
