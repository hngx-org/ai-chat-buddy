import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/views/authscreens/login.dart';
import 'package:chat_buddy/views/profileScreens/profile_screen.dart';
import 'package:chat_buddy/views/profileScreens/subscription_details_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
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
          color: Colors.transparent,
          foregroundColor: AppColors.white,
          iconTheme: IconThemeData(color: AppColors.white),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: AppColors.primaryColor,
          ),
        ),
        scaffoldBackgroundColor: Colors.transparent,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const ProfileScreen(),
      // initialRoute: '/',
      // routes: {
      //   '/loginScreen': (context) => const GradientBackground(child: Center()),
      //   '/homeScreen': (context) => const GradientBackground(child: Center()),
      // },
    );
  }
}
