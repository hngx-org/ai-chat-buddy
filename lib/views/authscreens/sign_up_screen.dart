import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/views/authscreens/auth_screen_widgets.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                smallText: "Create a New Account",
              ),
              SizedBox(
                height: 50,
              ),
              InfoFilelds(
                hintText: 'Enter your Name',
                icon: Icon(Icons.person),
              ),
              SizedBox(
                height: 30,
              ),
              InfoFilelds(
                hintText: "Enter your Email Address",
                icon: Icon(Icons.email),
              ),
              SizedBox(
                height: 30,
              ),
              InfoFilelds(
                hintText: "Enter your password",
                icon: Icon(Icons.lock),
              ),
              SizedBox(height: 30),
              AuthScreenButtons(
                onTap: null,
                text: 'Login',
              ),
              SizedBox(
                height: 60,
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
