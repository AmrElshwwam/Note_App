import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/scrolling_category_controller.dart';
import 'package:my_notes/core/constant/strings_routes.dart';
import 'package:my_notes/view/widgets/home_widgets/item_category_widget.dart';

class ScrollCategoryItems extends StatelessWidget {
  const ScrollCategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 90,
              child: GetBuilder<ScrollingCategoryControllerImp>(
                builder: (scrollingCategoryController) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: scrollingCategoryController.categoryList.length,
                    itemBuilder: (context, index) {
                      return ItemCategoryWidget(
                        icon: Icons.folder,

                        title:
                            scrollingCategoryController
                                .categoryList[index]
                                .title,
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.categoryScreen,
                            parameters: {
                              'categoryName':
                                  scrollingCategoryController
                                      .categoryList[index]
                                      .title,

                              'categoryIndex': index.toString(),
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
