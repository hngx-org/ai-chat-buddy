import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GradientBackground(
          child: SafeArea(
        child: Text(''),
      )),
    );
  }
}
