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
              const InfoFilelds(
                hintText: 'Enter your Name',
                icon: Icon(Icons.person),
              ),
              const SizedBox(
                height: 30,
              ),
              const InfoFilelds(
                hintText: "Enter your Email Address",
                icon: Icon(Icons.email),
              ),
              const SizedBox(
                height: 30,
              ),
              const InfoFilelds(
                hintText: "Enter your password",
                icon: Icon(Icons.lock),
              ),
              const SizedBox(height: 30),
              const AuthScreenButtons(
                onTap: null,
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
      )),
    );
  }
}
