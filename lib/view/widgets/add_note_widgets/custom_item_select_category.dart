import 'package:flutter/material.dart';

class CustomItemSelectCategory extends StatelessWidget {
  //
  final Color colorBox;
  final List<BoxShadow>? boxShadow;
  final double paddingOutHorizontal;
  final double paddingOutVertical;
  final double paddingInHorizontal;
  final double paddingInVertical;
  final double borderRadius;
  final String textBox;
  final double fontText;
  final Color colorText;
  final FontWeight fontWeight;
  final bool selected;
  final void Function()? onTap;
  //
  const CustomItemSelectCategory({
    super.key,
    required this.colorBox,
    this.boxShadow,
    required this.borderRadius,
    required this.textBox,
    required this.fontText,
    required this.colorText,
    required this.fontWeight,
    required this.paddingInHorizontal,
    required this.paddingInVertical,
    required this.paddingOutHorizontal,
    required this.paddingOutVertical,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingOutHorizontal /* 10*/,
          vertical: paddingOutVertical /*0*/,
        ),
        child: Container(
          width: 90,
          padding: EdgeInsets.symmetric(
            horizontal: paddingInHorizontal,
            vertical: paddingInVertical,
          ),
          decoration: BoxDecoration(
            color: colorBox,
            borderRadius: BorderRadius.circular(borderRadius /*7*/),
            boxShadow: boxShadow,
          ),
          child: Text(
            textAlign: TextAlign.center,
            textBox, // "Work",
            style: TextStyle(
              fontSize: fontText, //18,
              fontWeight: fontWeight, // FontWeight.w500,
              color: colorText, // AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
