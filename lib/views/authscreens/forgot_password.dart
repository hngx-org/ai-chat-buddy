import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/views/authscreens/auth_screen_widgets.dart';
import 'package:chat_buddy/views/authscreens/check_mail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GradientBackground(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            ChatBuddyText(
                largeText: 'Chat Buddy', smallText: 'Forgot Password?'),
            SizedBox(
              height: 40,
            ),
            InfoFilelds(
              hintText: 'Enter email address ',
              icon: Icon(Icons.email),
            ),
            SizedBox(
              height: 30,
            ),
            AuthScreenButtons(
              text: 'Send reset link',
              onTap: () {
                Get.to(() => CheckMail());
              },
            ),
          ],
        ),
      ),
    ));
  }
}
