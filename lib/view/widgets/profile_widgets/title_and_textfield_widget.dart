import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class TitleAndTextFieldWidget extends StatelessWidget {
  final String titleTextField;
  final TextEditingController? myController;
  // final void Function(String)? onChange;
  final String hintText;
  const TitleAndTextFieldWidget({
    super.key,
    // this.onChange,
    required this.hintText,
    required this.myController,
    required this.titleTextField,
  });

  @override
  Widget build(BuildContext context) {
    // String nTitle;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleTextField,
          // "First Name",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "Merienda",
          ),
        ),

        //--
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            controller: myController,
            decoration: InputDecoration(
              hintText: hintText, //"Type the node title...",
              hintStyle: const TextStyle(fontFamily: "Merienda"),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.orange, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            // onChanged: onChange,
          ),
        ),
      ],
    );
  }
}
