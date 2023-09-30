import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/views/authscreens/auth_screen_widgets.dart';
import 'package:flutter/material.dart';

class EnterNewPassword extends StatelessWidget {
  const EnterNewPassword({super.key});

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
                largeText: 'Chat Buddy', smallText: 'Enter New Password?'),
            SizedBox(
              height: 40,
            ),
            InfoFilelds(
              hintText: 'Enter New Password',
              icon: Icon(Icons.lock),
            ),
            SizedBox(
              height: 30,
            ),
            InfoFilelds(
              hintText: 'Confirm Password ',
              icon: Icon(Icons.email),
            ),
            SizedBox(
              height: 30,
            ),
            AuthScreenButtons(text: 'Proceed to Login', onTap: null),
          ],
        ),
      ),
    ));
  }
}
