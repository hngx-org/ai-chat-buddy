import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/controller/user_controller.dart';
import 'package:chat_buddy/views/authscreens/auth_screen_widgets.dart';
import 'package:chat_buddy/views/chatscreens/landing_page_screen.dart';
import 'package:chat_buddy/views/chatscreens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return Scaffold(
        body: GradientBackground(
            child: FutureBuilder(
      future: Future(
        () async {
          final result = await userController.hasUserLoggedInBefore();
          if (result == true) {
            Get.to(LandingScreen());
            return true;
          } else {
            Get.to(OnboardingScreen());
            return true;
          }
        },
      ),
      builder: (context, snapshot) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChatBuddyText(largeText: 'Chat Buddy', smallText: 'splash screen'),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator()
        ],
      ),
    )));
  }
}
