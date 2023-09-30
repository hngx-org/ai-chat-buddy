import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/views/authscreens/login.dart';
<<<<<<< HEAD
import 'package:chat_buddy/views/chatscreens/landing_page_screen.dart';
import 'package:flutter/material.dart';
=======
>>>>>>> 8b4fae042e0f333906dac0f7b8f4666a6dc93395
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
          color: AppColors.primaryColor,
          iconTheme: IconThemeData(color: AppColors.tertiaryColor),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: AppColors.primaryColor,
          ),
        ),
        scaffoldBackgroundColor: Colors.transparent,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home: GradientBackground(child: LandingScreen()),
      initialRoute: '/',
      routes: {
        '/landingScreen': (context) =>
            GradientBackground(child: const Center()),
        '/homeScreen': (context) => GradientBackground(child: const Center()),
=======
      home: const GradientBackground(child: LoginPage(child: Center())),
      initialRoute: '/',
      routes: {
        '/loginScreen': (context) => const GradientBackground(child: Center()),
        '/homeScreen': (context) => const GradientBackground(child: Center()),
>>>>>>> 8b4fae042e0f333906dac0f7b8f4666a6dc93395
      },
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
    );
  }
}
