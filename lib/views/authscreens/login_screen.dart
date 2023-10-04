import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/controller/user_controller.dart';
import 'package:chat_buddy/helper/loading_widget.dart';
import 'package:chat_buddy/views/authscreens/auth_screen_widgets.dart';
import 'package:chat_buddy/views/authscreens/forgot_password.dart';
import 'package:chat_buddy/views/authscreens/sign_up_screen.dart';
import 'package:chat_buddy/views/chatscreens/landing_page_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  UserController userController = Get.put(UserController());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    _passwordVisible;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  ChatBuddyText(
                    largeText: "Chat Buddy",
                    smallText: "Please Login To Your Account",
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InfoFilelds(
                    hintText: 'Enter your email',
                    icon: Icon(Icons.email),
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InfoFilelds(
                    obscureText: !_passwordVisible,
                    hintText: "Enter your password",
                    controller: passwordController,
                    icon: Icon(Icons.lock),
                    trailing: IconButton(
                      icon: Icon(_passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  // INFO: Function not available in auth package
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: TextButton(
                  //       onPressed: () {
                  //         // Get.to(ForgotPasswordPage());
                  //       },
                  //       child: Text(
                  //         'Forgot Password?',
                  //         style: TextStyle(
                  //             fontSize: 15, color: AppColors.buttonColor2),
                  //       )),
                  // ),
                  const SizedBox(height: 50),
                  AuthScreenButtons(
                    text: 'Login',
                    onTap: () async {
                      final result = await loadToScreen(
                        asyncComputation: () async =>
                            await userController.loginUser(
                                email: emailController.text,
                                password: passwordController.text),
                        context: context,
                      );
                      if (result == null) {
                        Get.to(() => const LandingScreen());
                      } else {
                        Get.snackbar(
                          'Authentication Error',
                          "User unable to login",
                          colorText: Colors.red,
                          margin: const EdgeInsets.all(10),
                          duration: const Duration(seconds: 3),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  InLineTexts(
                    firstText: 'Dont have an account?',
                    secondText: 'Sign Up',
                    onpressed: () => Get.to(
                      () => const SignUpScreen(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
