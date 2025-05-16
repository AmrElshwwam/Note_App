import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/details_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/app_theme.dart';
import 'package:my_notes/view/widgets/details_widgets/appbar_details_note.dart';
import 'package:my_notes/view/widgets/details_widgets/text_field_details.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AppThemes.isDarkMode(context);

    DetailsControllerImp detailsController = Get.find<DetailsControllerImp>();

    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            //--
            AppbarDetailsNote(),

            Expanded(
              child: Container(
                color: isDarkMode ? AppColors.black : AppColors.white,
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //--
                      TextFieldDetails(
                        myController: detailsController.titleNoteController,

                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),

                      //--
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(color: Colors.grey, height: 1),
                      ),

                      //--
                      TextFieldDetails(
                        myController:
                            detailsController.descriptionNoteController,

                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),

                      //
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
