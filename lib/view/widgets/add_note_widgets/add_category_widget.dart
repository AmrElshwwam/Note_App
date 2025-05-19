import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/view/widgets/add_note_widgets/show_modal_bottom_sheet.dart';

class AddCategoryWidget extends StatelessWidget {
  const AddCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          context: context,
          builder: (context) {
            return ShowModalBottomSheet();
          },
        );
      },
      child: Container(
        height: 40,
        width: 50,
        decoration: BoxDecoration(
          // color: Colors.black,
          border: Border.all(
            color: AppColors.orange,
            width: 3,
          ),
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(20),
          ),
        ),
        child: const Icon(
          Icons.add,
          color: AppColors.orange,
          size: 30,
        ),
      ),
    );
  }
}
