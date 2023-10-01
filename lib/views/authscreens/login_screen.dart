import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/views/authscreens/auth_screen_widgets.dart';
import 'package:chat_buddy/views/authscreens/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
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
              const InfoFilelds(
                hintText: 'Enter your email',
                icon: Icon(Icons.person),
              ),
              const SizedBox(
                height: 30,
              ),
              const InfoFilelds(
                hintText: "Enter your password",
                icon: Icon(Icons.lock),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Get.to(() => ForgotPasswordPage());
                    },
                    child: Text(
                      'Forgot Password?',
                      style:
                          TextStyle(fontSize: 15, color: AppColors.buttonColor),
                    )),
              ),
              const SizedBox(height: 30),
              const AuthScreenButtons(
                onTap: null,
                text: 'Login',
              ),
              const SizedBox(
                height: 100,
              ),
              const InLineTexts(
                  firstText: 'Dont have an account?',
                  secondText: 'Sign Up',
                  onpressed: null)
            ],
          ),
        ),
      )),
    );
  }
}
