import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/drawer_controller.dart';
import 'package:my_notes/controller/profile_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/view/widgets/drawer_widgets/appbar_drawer_screens.dart';
import 'package:my_notes/view/widgets/profile_widgets/botton_update_profile.dart';
import 'package:my_notes/view/widgets/profile_widgets/title_and_textfield_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerControllerImp drawerController = Get.find<DrawerControllerImp>();

    ProfileControllerImp profileController = Get.find<ProfileControllerImp>();

    // ProfileControllerImp profileController = Get.put(ProfileControllerImp());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //--
          AppbarDrawerScreens(
            onPressedBack: () {
              drawerController.selectedItemDrawer(0);
              Get.delete<ProfileControllerImp>();
            },
          ),

          //--
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          child: GetBuilder<ProfileControllerImp>(
                            builder: (context) {
                              return Column(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: AppColors.orange,
                                    maxRadius: 50,
                                    child: Icon(
                                      Icons.person_outline,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                  ),

                                  //
                                  const SizedBox(height: 10),

                                  //
                                  Text(
                                    // "$firstName $lastName",
                                    "${profileController.firstName} ${profileController.lastName}",

                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Merienda",
                                    ),
                                  ),

                                  //
                                  Text(
                                    profileController.email,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Merienda",
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),

                        //...............................
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Divider(),
                        ),

                        //...............................
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TitleAndTextFieldWidget(
                                    titleTextField: "First Name",
                                    myController:
                                        profileController.firstNameController,
                                    hintText: "First Name",
                                  ),
                                ),

                                //
                                const SizedBox(width: 10),

                                //
                                Expanded(
                                  child: TitleAndTextFieldWidget(
                                    titleTextField: "Last Name",
                                    myController:
                                        profileController.lastNameController,
                                    hintText: "Last Name",
                                  ),
                                ),
                              ],
                            ),

                            //...............................
                            const SizedBox(height: 10),

                            TitleAndTextFieldWidget(
                              titleTextField: "Email Address",
                              myController: profileController.emailController,
                              hintText: "Email Address",
                            ),

                            //...............................
                            const SizedBox(height: 10),

                            TitleAndTextFieldWidget(
                              titleTextField: "Password",
                              myController: profileController.passwordController,
                              hintText: "Password",
                            ),

                            //...............................
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                //--
                BottonUpdateProfile(profileController: profileController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
