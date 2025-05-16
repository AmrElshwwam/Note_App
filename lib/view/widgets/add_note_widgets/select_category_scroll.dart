import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/category_screen_controller.dart';
import 'package:my_notes/controller/scrolling_category_controller.dart';
import 'package:my_notes/controller/select_category_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/view/widgets/add_note_widgets/custom_item_select_category.dart';

class SelectCategoryWidget extends StatelessWidget {
  const SelectCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String? whatScreen = Get.parameters['categoryName'];

    if (whatScreen != null) {
      // استدعاء resetCategory عند بناء الشاشة
      WidgetsBinding.instance.addPostFrameCallback((_) {
        CategoryScreenControllerImp categoryScreenController =
            Get.find<CategoryScreenControllerImp>();

        SelectCategoryControllerImp selectController =
            Get.find<SelectCategoryControllerImp>();

        selectController.getIndexSelectCategory(
          categoryScreenController.indexCategory!,
        );
      });
    }

    return GetBuilder<ScrollingCategoryControllerImp>(
      builder: (scrollingController) {
        return ListView.builder(
          controller: scrollingController.scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: scrollingController.categoryList.length,
          itemBuilder: (context, i) {
            return Row(
              children: [
                GetBuilder<SelectCategoryControllerImp>(
                  builder: (selectCategoryController) {
                    return CustomItemSelectCategory(
                      onTap: () {
                        //--
                        selectCategoryController.getIndexSelectCategory(i);
                      },
                      selected:
                          selectCategoryController.indexSelectedCategory == i,
                      paddingOutHorizontal: 10,
                      paddingOutVertical: 0,
                      paddingInHorizontal:
                          selectCategoryController.indexSelectedCategory == i
                              ? 10
                              : 7,
                      paddingInVertical:
                          selectCategoryController.indexSelectedCategory == i
                              ? 6
                              : 3,
                      colorBox:
                          selectCategoryController.indexSelectedCategory == i
                              ? AppColors.orange
                              : AppColors.orange.withValues(alpha: .4),
                      borderRadius: 7,
                      textBox: scrollingController.categoryList[i].title,
                      fontText: 16,
                      fontWeight: FontWeight.w500,
                      colorText:
                          selectCategoryController.indexSelectedCategory == i
                              ? AppColors.white
                              : AppColors.black,
                      boxShadow:
                          selectCategoryController.indexSelectedCategory == i
                              ? [
                                const BoxShadow(
                                  color: AppColors.orange,
                                  offset: Offset(0, 5),
                                  blurRadius: 7,
                                  spreadRadius: -3,
                                ),
                              ]
                              : [],
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
