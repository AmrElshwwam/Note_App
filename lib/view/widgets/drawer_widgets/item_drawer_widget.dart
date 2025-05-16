import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class ItemDrawerWidget extends StatelessWidget {
  final bool selected;
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const ItemDrawerWidget({
    super.key,
    required this.selected,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        decoration: BoxDecoration(
          color: selected ? AppColors.orange : AppColors.background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: ListTile(
            onTap: onTap,
            // selected: selected,
            title: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color:
                    isDarkMode
                        ? AppColors.white
                        : selected
                        ? AppColors.white
                        : AppColors.black,
                fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
                // color: isDarkTheme ? AppColors.black : AppColors.background,
              ),
            ),
            leading: Icon(
              icon,
              size: 30,
              color:
                  isDarkMode
                      ? AppColors.white
                      : selected
                      ? AppColors.white
                      : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
