import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/views/authscreens/auth_screen_widgets.dart';
import 'package:chat_buddy/views/authscreens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = false;

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
                InfoFilelds(
                    obscureText: _obscurePassword,
                    hintText: "Enter your password",
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
        ),
      )),
    );
  }
}
