import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/views/authscreens/auth_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/views/chatscreens/chat_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('lib/assets/avatar1.jpg')),
              const SizedBox(
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
              const SizedBox(
                height: 200,
              ),
              AuthScreenButtons(
                text: 'Explore ChatBuddy',
                onTap: () {
                  Get.to(() => ChatScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
