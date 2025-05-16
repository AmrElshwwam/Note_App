import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/search_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/view/widgets/search_screen_widgets/icon_button_widget.dart';
import 'package:my_notes/view/widgets/search_screen_widgets/text_field_search_screen.dart';

class AppbarSearchWidget extends StatelessWidget {
  const AppbarSearchWidget({super.key, required this.searchController});

  final SearchControllerImp searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButtonWidget(
                iconButton: Icons.keyboard_arrow_left,
                onPressed: () {
                  Get.back();
                },
              ),

              //--
              SizedBox(width: 10),

              //--
              Expanded(
                child: TextFieldSearchScreen(
                  searchController: searchController,
                ),
              ),

              //--
              SizedBox(width: 10),

              //--
              IconButtonWidget(
                iconButton: Icons.clear,
                onPressed: () {
                  searchController.searchController.clear();
                  searchController.update();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
