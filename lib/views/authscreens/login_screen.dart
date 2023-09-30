import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/views/authscreens/auth_screen_widgets.dart';
import 'package:flutter/material.dart';
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
              SizedBox(
                height: 100,
              ),
              ChatBuddyText(
                largeText: "Chat Buddy",
                smallText: "Please Login To Your Account",
              ),
              SizedBox(
                height: 50,
              ),
              InfoFilelds(
                hintText: 'Enter your email',
                icon: Icon(Icons.person),
              ),
              SizedBox(
                height: 30,
              ),
              InfoFilelds(
                hintText: "Enter your password",
                icon: Icon(Icons.lock),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style:
                          TextStyle(fontSize: 15, color: AppColors.buttonColor),
                    )),
              ),
              SizedBox(height: 30),
              AuthScreenButtons(
                onTap: null,
                text: 'Login',
              ),
              SizedBox(
                height: 100,
              ),
              InLineTexts(
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
