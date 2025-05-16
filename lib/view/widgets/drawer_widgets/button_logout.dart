import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class ButtonLogout extends StatelessWidget {
  const ButtonLogout({super.key, this.onPressed, required this.nameButton});

  final String nameButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.orange, width: 2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: AppColors.orange, size: 25),
            //
            SizedBox(width: 5),
            //
            Text(
              nameButton,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.orange,
                fontFamily: "Merienda",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
