import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/drawer_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/strings_routes.dart';
import 'package:my_notes/data/data_models/drawer_items.dart';
import 'package:my_notes/data/services/services.dart';
import 'package:my_notes/view/widgets/drawer_widgets/button_logout.dart';
import 'package:my_notes/view/widgets/drawer_widgets/item_drawer_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    MyServices myServices = Get.find();
    String firstName =
        myServices.sharedPreferences.getString("FirstName") ?? "Your";
    String lastName =
        myServices.sharedPreferences.getString("LastName") ?? "Name";
    String email =
        myServices.sharedPreferences.getString("Email") ?? "Your Email";

    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            //
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.orange,
                    radius: 30,
                    child: Icon(Icons.person, color: AppColors.white, size: 30),
                  ),

                  //--
                  const SizedBox(height: 10),

                  //--
                  Text(
                    // "Amr Juliano",
                    "$firstName $lastName",

                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ),
                  Text(
                    email,
                    // "Amr.Medhat@gmail.com",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            //
            Container(color: Colors.grey, height: .5),

            //
            const SizedBox(height: 10),

            //
            Expanded(
              child: GetBuilder<DrawerControllerImp>(
                builder: (drawerController) {
                  return ListView.builder(
                    itemCount: drawerItems.length,
                    itemBuilder: (context, index) {
                      return ItemDrawerWidget(
                        title: drawerItems[index].title.tr,
                        icon: drawerItems[index].iconCategory,
                        selected:
                            drawerController.selectedIndexItemsDrawer == index
                                ? true
                                : false,
                        onTap: () {
                          drawerController.selectedItemDrawer(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),

            //--
            ButtonLogout(
              nameButton: 'Logout',
              onPressed: () {
                Get.offAllNamed(AppRoutes.signinScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
