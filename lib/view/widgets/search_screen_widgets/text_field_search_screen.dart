import 'package:flutter/material.dart';
import 'package:my_notes/controller/search_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class TextFieldSearchScreen extends StatelessWidget {
  const TextFieldSearchScreen({super.key, required this.searchController});

  final SearchControllerImp searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.black),

      cursorColor: AppColors.white,
      cursorWidth: 3,

      controller: searchController.searchController,
      onChanged: searchController.searchNotes,

      decoration: InputDecoration(
        hintText: "Search...",
        hintStyle: TextStyle(color: const Color.fromARGB(255, 92, 92, 92)),

        filled: true,
        fillColor: AppColors.white.withValues(alpha: .5),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
