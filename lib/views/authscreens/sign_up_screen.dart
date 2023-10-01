import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/controller/user_controller.dart';
import 'package:chat_buddy/helper/loading_widget.dart';
import 'package:chat_buddy/views/authscreens/auth_screen_widgets.dart';
import 'package:chat_buddy/views/authscreens/login_screen.dart';
import 'package:chat_buddy/views/chatscreens/landing_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    _obscurePassword;
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
                  smallText: "Create a New Account",
                ),
                const SizedBox(
                  height: 50,
                ),
                InfoFilelds(
                  hintText: 'Enter your Name',
                  icon: Icon(Icons.person),
                  controller: nameController,
                ),
                const SizedBox(
                  height: 30,
                ),
                InfoFilelds(
                  hintText: "Enter your Email Address",
                  icon: Icon(Icons.email),
                  controller: emailController,
                ),
                const SizedBox(
                  height: 30,
                ),
                InfoFilelds(
                    obscureText: _obscurePassword,
                    hintText: "Enter your password",
                    controller: passwordController,
                    icon: Icon(Icons.lock),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(_obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off))),
                const SizedBox(height: 30),
                AuthScreenButtons(
                  onTap: () async {
                    final result = await loadToScreen(
                      asyncComputation: () async =>
                          await userController.signupUser(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text),
                      context: context,
                    );
                    if (result == null) {
                      Get.to(() => LandingScreen());
                    } else {
                      Get.snackbar('error', "Unable To Login");
                    }
                  },
                  text: 'Create Account',
                ),
                const SizedBox(
                  height: 60,
                ),
                const InLineTexts(
                    firstText: 'Already have an account?',
                    secondText: 'Login',
                    onpressed: null)
              ],
            ),
          ),
        ),
      )),
    );
  }
}
