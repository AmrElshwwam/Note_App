import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class TextHaveOrDontAccount extends StatelessWidget {
  const TextHaveOrDontAccount({
    super.key,
    required this.questionText,
    required this.answerText,
    this.onTapAnswer,
  });

  final String questionText;
  final String answerText;
  final void Function()? onTapAnswer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          // "Already have an Account? ",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),

        //--
        InkWell(
          onTap: onTapAnswer,
          child: Text(
            answerText,
            // "Sign In",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
