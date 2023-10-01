import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/views/chatscreens/landing_page_screen.dart';
import 'package:chat_buddy/views/chatscreens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          OnboardingPage(
            title: 'The Future of Chat is Here With AI Technology.',
            description:
                "it's easy when you have someone who is ready to listen to you and you can share your thoughts with.",
            imagePath: 'lib/assets/onboarding.png',
          ),
          OnboardingPage(
            title: 'ChatBuddy',
            description: 'Ready to grow your life to the next level.',
            imagePath: 'lib/assets/onboarding.png',
            onPressed: () {
              Get.to(() => ChatScreen());
            },
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback? onPressed;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      Text(
                        description,
                        style: TextStyle(fontSize: 25, color: AppColors.white),
                        textAlign: TextAlign.center,
                      ),
                    ]),
              ),
              SizedBox(height: 50),
              if (onPressed != null)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor),
                  onPressed: onPressed,
                  child: SizedBox(
                    width: 200,
                    height: 48,
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(fontSize: 18, color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 50),
              if (onPressed == null)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Swipe to Continue',
                      style: TextStyle(color: AppColors.white, fontSize: 25),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    ]);
  }
}
