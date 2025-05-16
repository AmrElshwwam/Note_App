import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/controller/signup_controller.dart';
import 'package:my_notes/core/constant/app_colors.dart';
import 'package:my_notes/core/constant/strings_routes.dart';
import 'package:my_notes/core/function/valid_input.dart';
import 'package:my_notes/view/widgets/auth_widgets/background_auth.dart';
import 'package:my_notes/view/widgets/auth_widgets/custom_button.dart';
import 'package:my_notes/view/widgets/auth_widgets/custom_textfield.dart';
import 'package:my_notes/view/widgets/auth_widgets/text_have_or_dont_account.dart';
import 'package:my_notes/view/widgets/auth_widgets/title_screen.dart';
import 'package:my_notes/view/widgets/auth_widgets/welcome_message_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupControllerImp>(
      builder: (signupController) {
        return Scaffold(
          body: Stack(
            children: [
              //--
              BackgroundAuth(),

              //--
              Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    WelcomeMessageScreen(titleScreen: "Create Account"),

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
                            key: signupController.formKeySignup,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //
                                TitleScreen(titleScreen: "Sign Up"),

                                //
                                const SizedBox(height: 20),

                                //
                                CustomTextField(
                                  //>> Email
                                  valid: (val) {
                                    return validInputSignup(
                                      val!,
                                      8,
                                      25,
                                      "email",
                                    );
                                  },
                                  myController: signupController.email,
                                  keyboardType: TextInputType.emailAddress,
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
                                  //>> Password
                                  valid: (val) {
                                    return validInputSignup(
                                      val!,
                                      8,
                                      25,
                                      "password",
                                    );
                                  },
                                  myController: signupController.password,
                                  keyboardType: TextInputType.visiblePassword,
                                  hintText: "Enter Your Password",
                                  labelName: const Text("  Password  "),
                                  icon: const Icon(
                                    Icons.lock,
                                    color: AppColors.orange,
                                  ),
                                ),

                                //
                                const SizedBox(height: 15),

                                //
                                CustomTextField(
                                  //>> Confirm Password
                                  valid: (val) {
                                    return validInputSignup(
                                      val!,
                                      8,
                                      25,
                                      "confirmpassword",
                                    );
                                  },
                                  myController:
                                      signupController.confirmPassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  hintText: "Enter Your Confirm Password",
                                  labelName: const Text("  Confirm Password  "),
                                  icon: const Icon(
                                    Icons.lock,
                                    color: AppColors.orange,
                                  ),
                                ),

                                //
                                const SizedBox(height: 20),

                                //
                                CustomButton(
                                  titleButton: "Sign Up",
                                  onPressed: () {
                                    signupController.signup();
                                  },
                                ),

                                //
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
                      questionText: "Already have an Account? ",
                      answerText: "Sign in",
                      onTapAnswer: () {
                        Get.offNamed(AppRoutes.signinScreen);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
