import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/core/constant/app_colors.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //-- Controller Find

    return TextField(
      readOnly:
          true, // يجب ان تكون للقراءة فقط حتي لا يتم الكتابه عليها والدخول الي صفحة السيرش
      onTap: () {
        Get.toNamed("/searchScreen");
      },

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.search, color: AppColors.white),
          ),
        ),
        //
        filled: true,
        fillColor: AppColors.white,
        hintText: "5".tr, //"Search",
        //
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),

        //
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
