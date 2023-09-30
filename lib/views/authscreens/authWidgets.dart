import 'package:chat_buddy/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ChatBuddyText extends StatelessWidget {
  final String largeText;
  final String smallText;
  ChatBuddyText({required this.largeText, required this.smallText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          largeText,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        Text(
          smallText,
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        )
      ]),
    );
  }
}
