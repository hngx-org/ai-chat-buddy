import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/views/chatscreens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: AppColors.primaryColor,
            foregroundColor: AppColors.white,
            iconTheme: IconThemeData(color: AppColors.white),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: AppColors.primaryColor,
            ),
          ),
          scaffoldBackgroundColor: Colors.transparent,
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        home:
            // GradientBackground(child:
            OnboardingScreen());
  }
}
