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
            //fontFamily: 'Scholarly Ambition',
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

class InfoFilelds extends StatelessWidget {
  final Widget? icon;
  final String hintText;
  const InfoFilelds({required this.hintText, this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 3,
        height: MediaQuery.of(context).size.height / 12,
        decoration: BoxDecoration(
          color: AppColors.tertiaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: icon,
          iconColor: AppColors.buttonColor,
          title: TextField(
            style: TextStyle(color: AppColors.textColor),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ));
  }
}

class AuthScreenButtons extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const AuthScreenButtons({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 3,
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 209, 175, 175),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18,
                color: AppColors.white,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}

class InLineTexts extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Function()? onpressed;
  const InLineTexts(
      {required this.firstText,
      required this.secondText,
      required this.onpressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 15,
          ),
        ),
        TextButton(
            onPressed: onpressed,
            child: Text(
              secondText,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.buttonColor,
                  fontSize: 17),
            ))
      ],
    );
  }
}
