import 'package:flutter/material.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/app_theme.dart';

class ItemCategoryWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  // final int indexCategory;
  final void Function()? onTap;
  const ItemCategoryWidget({
    super.key,
    required this.title,
    required this.icon,
    // required this.indexCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Icon(icon, color: AppColors.orange, size: 60),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color:
                    AppThemes.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////

// class CategoryListContainer2 extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   const CategoryListContainer2({
//     super.key,
//     required this.title,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Column(
//         children: [
//           Material(
//             shape: const CircleBorder(
//               side: BorderSide(width: 3, color: AppColors.orange),
//             ),
//             child: CircleAvatar(
//               backgroundColor: AppColors.white,
//               radius: 30,
//               child: Icon(
//                 icon, //Icons.health_and_safety,
//                 color: AppColors.orange,
//                 size: 30,
//               ),
//             ),
//           ),
//           Text(
//             title,
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
// }
