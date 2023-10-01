import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/views/chatscreens/chat_screen.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(children: [
              SizedBox(
                height: 150,
              ),
              CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('lib/assets/avatar1.jpg')),
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome to ChatBuddy! 👋 ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              SizedBox(
                height: 300,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => ChatScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: SizedBox(
                  width: 300,
                  height: 48,
                  child: Center(
                    child: Text(
                      'Explore ChatBuddy',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}