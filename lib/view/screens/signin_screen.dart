import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/signin_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/strings_routes.dart';
import 'package:my_notes/core/function/valid_input_signin.dart';
import 'package:my_notes/view/widgets/auth_widgets/background_auth.dart';
import 'package:my_notes/view/widgets/auth_widgets/custom_button.dart';
import 'package:my_notes/view/widgets/auth_widgets/custom_textfield.dart';
import 'package:my_notes/view/widgets/auth_widgets/text_have_or_dont_account.dart';
import 'package:my_notes/view/widgets/auth_widgets/title_screen.dart';
import 'package:my_notes/view/widgets/auth_widgets/welcome_message_screen.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninControllerImp>(
      builder: (signinController) {
        return SafeArea(
          bottom: false,
          child: Scaffold(
            body: Stack(
              children: [
                //--
                BackgroundAuth(),

                //--
                Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      //---
                      WelcomeMessageScreen(titleScreen: "Welcome Back"),

                      //
                      const SizedBox(height: 15),

                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 5,
                                color: Colors.grey.withValues(alpha: .3),
                                offset: const Offset(0, 10),
                                blurRadius: 7,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 30,
                            ),
                            child: Form(
                              key: signinController.formKeySignin,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TitleScreen(titleScreen: "Sign In"),

                                  //
                                  const SizedBox(height: 15),

                                  //
                                  CustomTextField(
                                    myController: signinController.email,
                                    keyboardType: TextInputType.emailAddress,
                                    valid: (val) {
                                      return validInputSignin(
                                        val!,
                                        8,
                                        25,
                                        "email",
                                      );
                                    },
                                    hintText: "Enter Your Email",
                                    labelName: const Text("  Email  "),
                                    icon: const Icon(
                                      Icons.email,
                                      color: AppColors.orange,
                                    ),
                                  ),

                                  //
                                  const SizedBox(height: 15),

                                  //
                                  CustomTextField(
                                    myController: signinController.password,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText:
                                        signinController.isShowPassword,
                                    onTapIcon: () {
                                      signinController.showPassword();
                                    },
                                    valid: (val) {
                                      return validInputSignin(
                                        val!,
                                        8,
                                        25,
                                        "password",
                                      );
                                    },
                                    hintText: "Enter Your Password",
                                    labelName: const Text("  Password  "),
                                    icon:
                                        signinController.isShowPassword == true
                                            ? const Icon(
                                              Icons.visibility_off,
                                              color: AppColors.orange,
                                            )
                                            : const Icon(
                                              Icons.visibility,
                                              color: AppColors.orange,
                                            ),
                                  ),

                                  //
                                  const SizedBox(height: 10),

                                  //
                                  InkWell(
                                    onTap: () {
                                      // Get.offNamed(AppRoutes.ForgetScreen);
                                    },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Forget Password?",
                                        style: TextStyle(
                                          fontSize: 16,
                                          // color: AppColors.black,
                                          color: AppColors.orange,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),

                                  //
                                  const SizedBox(height: 20),

                                  //
                                  CustomButton(
                                    titleButton: "Sign In",
                                    onPressed: () {
                                      signinController.login(context);
                                    },
                                  ),

                                  //
                                  const SizedBox(height: 20),

                                  //
                                  const Text(
                                    "Or Sign In With ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                  //
                                  const SizedBox(height: 10),

                                  //
                                  SizedBox(
                                    width: 200,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: List.generate(3, (index) {
                                        return InkWell(
                                          onTap: () {},
                                          child: CircleAvatar(
                                            maxRadius: 20,
                                            backgroundColor: AppColors.orange,
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      //
                      const SizedBox(height: 20),

                      //
                      TextHaveOrDontAccount(
                        questionText: "Don't have an Account? ",
                        answerText: "Sign up",
                        onTapAnswer: () {
                          Get.offNamed(AppRoutes.signupScreen);
                        },
                      ),

                      //--
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
