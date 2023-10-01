import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/views/authscreens/auth_screen_widgets.dart';
import 'package:chat_buddy/views/authscreens/enter_new_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckMail extends StatelessWidget {
  const CheckMail({super.key});

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
                largeText: 'Chat Buddy', smallText: 'Check your Mail?'),
            SizedBox(
              height: 40,
            ),
            InfoFilelds(
              hintText: 'Enter reset code ',
              icon: Icon(Icons.lock),
            ),
            SizedBox(
              height: 50,
            ),
            AuthScreenButtons(
              text: 'Continue',
              onTap: () {
                Get.to(() => EnterNewPassword());
              },
            ),
          ],
        ),
      ),
    ));
  }
}
