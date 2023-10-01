import 'package:chat_buddy/constants/app_colors.dart';
<<<<<<< HEAD
import 'package:chat_buddy/views/authscreens/login.dart';
import 'package:chat_buddy/views/chatscreens/landing_page_screen.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
=======
>>>>>>> 8b4fae042e0f333906dac0f7b8f4666a6dc93395
=======
import 'package:chat_buddy/views/profileScreens/profile_screen.dart';
>>>>>>> 36e2516b98e769a58214e148a8bae3e2583f6a40
>>>>>>> main
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

        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: AppColors.textColor,
          ),
        ), //scaffoldBackgroundColor: Colors.transparent,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
=======
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> main
      home: GradientBackground(child: LandingScreen()),
    );
  }
}

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 83, 31, 117),
              Color.fromARGB(255, 18, 28, 136),
            ],
          ),
        ),
        child: child,
      ),
=======
      home: const ProfileScreen(),
>>>>>>> 36e2516b98e769a58214e148a8bae3e2583f6a40
    );
  }
}
