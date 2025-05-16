import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController myController;
  final String hintText;
  final Widget labelName;
  final Widget icon;
  final String? Function(String?)? valid;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const CustomTextField({
    super.key,
    required this.myController,
    required this.labelName,
    required this.icon,
    required this.hintText,
    this.valid,
    this.keyboardType,
    this.obscureText,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      validator: valid,
      controller: myController,
      keyboardType: keyboardType,
      obscureText: obscureText == null || obscureText == false ? false : true,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 207, 206, 206)),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),

        label: labelName,
        labelStyle: const TextStyle(
          color: AppColors.orange,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,

        suffixIcon: InkWell(
          onTap: onTapIcon,
          splashColor: AppColors.background,
          hoverColor: AppColors.background,
          child: icon,
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 207, 206, 206),
          ),
          borderRadius: BorderRadius.circular(10),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.orange, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.orange, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),

        errorStyle: const TextStyle(fontSize: 15, color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
      ),

      cursorWidth: 3,
      mouseCursor: WidgetStateMouseCursor.textable,
    );
  }
}
