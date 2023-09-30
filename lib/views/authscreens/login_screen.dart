import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/views/authscreens/authWidgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ChatBuddyText(
              largeText: "Chat Buddy",
              smallText: "Please Login To Your Account",
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: TextField(
                decoration: InputDecoration(),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
