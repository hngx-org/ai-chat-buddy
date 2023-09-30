import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/views/authscreens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            color: AppColors.primaryColor,
            iconTheme: IconThemeData(color: AppColors.tertiaryColor),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: AppColors.primaryColor)),
        scaffoldBackgroundColor: Colors.transparent,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: GradientBackground(child: LoginPage(child: Center())),
      initialRoute: '/',
      routes: {
        '/loginScreen': (context) => GradientBackground(child: const Center()),
        '/homeScreen': (context) => GradientBackground(child: const Center()),
      },
    );
  }
}

class GradientBackground extends StatelessWidget {
  final Widget child;

  GradientBackground({required this.child});

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
            child: child));
  }
}